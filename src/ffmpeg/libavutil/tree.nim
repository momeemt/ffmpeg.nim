from ../types import AVTreeNode

when defined(windows):
  {.push importc, dynlib: "avutil-(|56|57|58|59|60).dll", cdecl.}
elif defined(macosx):
  {.push importc, dynlib: "libavutil(|.56|.57|.58|.59|.60).dylib", cdecl.}
else:
  {.push importc, dynlib: "libavutil.so(|.56|.57|.58|.59|.60)", cdecl.}

var av_tree_node_size*: cint

proc av_tree_node_alloc* (): ptr AVTreeNode
proc av_tree_find* (root: ptr AVTreeNode
, key: pointer, cmp: proc (key, b: pointer): cint, next: ptr pointer): pointer
proc av_tree_insert* (rootp: ptr ptr AVTreeNode, key: pointer, cmp: proc (key, b: pointer): cint, next: ptr ptr AVTreeNode): pointer
proc av_tree_destroy* (t: ptr AVTreeNode)
proc av_tree_enumerate* (t: ptr AVTreeNode, opaque: pointer, cmp: proc (opaque, elem: pointer), enu: proc (opaque, elem: pointer))
