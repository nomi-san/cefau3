#include "../cefau3.h"

#include "include/capi/cef_task_capi.h"

/* CefTask
--------------------------------------------------*/

CEFAU3API void CefTask_Execute(cef_task_t *self)
{
	self->execute(self);
}

/* CefTaskRunner
--------------------------------------------------*/

CEFAU3API int CefTaskRunner_IsSame(struct _cef_task_runner_t* self,
	struct _cef_task_runner_t* that)
{
	return self->is_same(self, that);
}

CEFAU3API int CefTaskRunner_BelongsToCurrentThread(struct _cef_task_runner_t* self)
{
	return self->belongs_to_current_thread(self);
}

CEFAU3API int CefTaskRunner_BelongsToThread(struct _cef_task_runner_t* self,
	cef_thread_id_t threadId)
{
	return self->belongs_to_thread(self, threadId);
}

CEFAU3API int CefTaskRunner_PostTask(struct _cef_task_runner_t* self,
	struct _cef_task_t* task)
{
	return self->post_task(self, task);
}

CEFAU3API int CefTaskRunner_PostDelayedTask(struct _cef_task_runner_t* self,
	struct _cef_task_t* task,
	int64 delay_ms)
{
	return self->post_delayed_task(self, task, delay_ms);
}

/////////////////////////////

CEFAU3API cef_task_runner_t* CefTaskRunner_GetForCurrentThread()
{
	return cef_task_runner_get_for_current_thread();
}

CEFAU3API cef_task_runner_t* CefTaskRunner_GetForThread(
	cef_thread_id_t threadId)
{
	return cef_task_runner_get_for_thread(threadId);
}

CEFAU3API int CefCurrentlyOn(cef_thread_id_t threadId)
{
	return cef_currently_on(threadId);
}

CEFAU3API int CefPostTask(cef_thread_id_t threadId, cef_task_t* task)
{
	return cef_post_task(threadId, task);
}

CEFAU3API int CefPostDelayedTask(cef_thread_id_t threadId,
	cef_task_t* task,
	int64 delay_ms)
{
	return cef_post_delayed_task(threadId, task, delay_ms);
}