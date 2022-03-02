from ../types import AVThreadMessageQueue, AVThreadMessageFlags

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

proc av_thread_message_queue_alloc* (mq: ptr ptr AVThreadMessageQueue, nelem, elsize: cuint): cint
proc av_thread_message_queue_free* (mq: ptr ptr AVThreadMessageQueue)
proc av_thread_message_queue_send* (mq: ptr AVThreadMessageQueue, msg: pointer, flags: cuint): cint
proc av_thread_message_queue_recv* (mq: ptr AVThreadMessageQueue, msg: pointer, flags: cuint): cint
proc av_thread_message_queue_set_err_send* (mq: ptr AVThreadMessageQueue, err: cint)
proc av_thread_message_queue_set_err_recv* (mq: ptr AVThreadMessageQueue, err: cint)
proc av_thread_message_queue_set_free_func* (mmq: ptr AVThreadMessageFlags, free_func: proc (msg: pointer))
proc av_thread_message_queue_nb_elems* (mq: ptr AVThreadMessageQueue): cint
proc av_thread_message_flush* (mq: ptr AVThreadMessageQueue)
