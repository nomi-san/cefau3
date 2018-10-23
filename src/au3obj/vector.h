/**
 * @package	AutoItObject
 * @copyright	Copyright (C) The AutoItObject-Team. All rights reserved.
 * @license	Artistic License 2.0, see Artistic.txt
 * 
 * This file is part of AutoItObject.
 * 
 * AutoItObject is free software; you can redistribute it and/or modify
 * it under the terms of the Artistic License as published by Larry Wall,
 * either version 2.0, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
 * See the Artistic License for more details.
 * 
 * You should have received a copy of the Artistic License with this Kit,
 * in the file named "Artistic.txt".  If not, you can get a copy from
 * <http://www.perlfoundation.org/artistic_license_2_0> OR
 * <http://www.opensource.org/licenses/artistic-license-2.0.php>
 * 
 * A complete list of contributors is available in dll.h
 *
 */
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
