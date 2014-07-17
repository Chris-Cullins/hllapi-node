ffi = require('ffi')
ref = require('ref')
hlldll = ffi.DynamicLibrary("./hllapi32.dll")
hllapi = hlldll.get('WinHLLAPI')
#hllapi = hlldll.WinHLLAPI
#WinHLLAPI = ffi.ForeignFunction(hllapi, Number,  [Number,  String,  Number, Number])

intPtr = ref.refType(ref.types.int32)
cString = ref.refType(ref.types.CString)

hllapiLib = ffi.Library('hllapi32', {
    'WinHLLAPI': [intPtr, [intPtr, cString, intPtr, intPtr]]
});

connectPresentationSpace = (presentationSpace) ->

    function_number = ref.alloc(ref.types.int32, 1)
    data_string = ref.allocCString(presentationSpace)
    length = ref.alloc(ref.types.int32,4)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapiLib.WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position.deref()

disconnectPresentationSpace = () ->
    function_number = ref.alloc(ref.types.int32, 2)
    data_string = ref.allocCString('A')
    length = ref.alloc(ref.types.int32,4)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapiLib.WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position.deref()

sendKey = (key) ->
    function_number = ref.alloc(ref.types.int32, 3)
    data_string = ref.allocCString(key)
    length = ref.alloc(ref.types.int32,key.length)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapiLib.WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position.deref()


console.log connectPresentationSpace('A')
console.log sendKey("H")
console.log sendKey("I")
console.log disconnectPresentationSpace()
