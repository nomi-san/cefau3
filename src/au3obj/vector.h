#pragma once

namespace simple
{
template <typename T>
class vector
{
public:
	vector(unsigned int _commit_size=0);
	~vector();
	void push_back(T _new_data);
	void clear();
	void erase(unsigned int _index);
	T at(unsigned int _index);
	T operator[](unsigned int _index) const;
	T& operator[](unsigned int _index);
	unsigned int size();
private:
	T* _storage;
	unsigned int _size;
	unsigned int _reserved;
};

template<typename T>
void vector<T>::clear()
{
	delete [] _storage;
	_storage=NULL;
	_size=0;
	_reserved=0;
}

template<typename T>
vector<T>::vector(unsigned int _commit_size):
_storage(NULL),_size(0),_reserved(_commit_size)
{
	if (_reserved)
	{
		_storage = new T[_reserved];
	}
}

template<typename T>
vector<T>::~vector()
{
	delete [] _storage;	
}

template<typename T>
void vector<T>::push_back(T _new_data)
{
	if ((_size+1)>_reserved) // vector full.
	{
		T* _new_storage = new T[(_size+1)*2];
		for (unsigned int _i=0;_i<_size;_i++){
			_new_storage[_i] = _storage[_i];
		}
		delete [] _storage;
		_storage = _new_storage;
		_reserved = (_size+1)*2;
	}
	_storage[_size] = _new_data;
	_size++;
}


template<typename T>
void vector<T>::erase(unsigned int _index)
{
	--_size;
	if (_index < _size) _storage[_index] = _storage[_size];
}

template<typename T>
T vector<T>::at(unsigned int _index)
{
	return _storage[_index];
}

template <typename T>
unsigned int vector<T>::size()
{
	return _size;
}

template <typename T>
T vector<T>::operator[](unsigned int _index) const
{	// subscript nonmutable sequence
		return (_storage[_index]);
}

template <typename T>
T &vector<T>::operator[](unsigned int _index)
{	// subscript mutable sequence
	return (_storage[_index]);
}

}
