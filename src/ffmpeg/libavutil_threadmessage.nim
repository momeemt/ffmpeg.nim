{.pragma: threadmessage, importc, header: "<libavutil/threadmessage.h>".}

type
  AVThreadMessageQueue* {.threadmessage.} = object

  AVThreadMessageFlags* {.threadmessage.} = enum
    AV_THREAD_MESSAGE_NONBLOCK = 1

when defined(windows):
  {.push importc, dynlib: "avutil-(|55|56|57).dll".}
elif defined(macosx):
  {.push importc, dynlib: "avutil(|.55|.56|.57).dylib".}
else:
  {.push importc, dynlib: "libavutil.so(|.55|.56|.57)".}

proc av_thread_message_queue_alloc* (mq: ptr ptr AVThreadMessageQueue, nelem, elsize: cuint): cint
proc av_thread_message_queue_free* (mq: ptr ptr AVThreadMessageQueue)
proc av_thread_message_queue_send* (mq: ptr AVThreadMessageQueue, msg: pointer, flags: cuint): cint
proc av_thread_message_queue_recv* (mq: ptr AVThreadMessageQueue, msg: pointer, flags: cuint): cint
proc av_thread_message_queue_set_err_send* (mq: ptr AVThreadMessageQueue, err: cint)
proc av_thread_message_queue_set_err_recv* (mq: ptr AVThreadMessageQueue, err: cint)
proc av_thread_message_queue_set_free_func* (mmq: ptr AVThreadMessageFlags, free_func: proc (msg: pointer))
proc av_thread_message_queue_nb_elems* (mq: ptr AVThreadMessageQueue): cint
proc av_thread_message_flush* (mq: ptr AVThreadMessageQueue)
