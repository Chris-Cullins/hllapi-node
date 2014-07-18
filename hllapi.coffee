ffi = require('ffi')
ref = require('ref')

intPtr = ref.refType(ref.types.int32)
cString = ref.refType(ref.types.CString)

hllapi = ffi.Library('hllapi32', {
    'WinHLLAPI': [intPtr, [intPtr, cString, intPtr, intPtr]]
});


connectPresentationSpace = (presentationSpace) ->

    function_number = ref.alloc(ref.types.int32, 1)
    data_string = ref.allocCString(presentationSpace)
    length = ref.alloc(ref.types.int32,4)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position.deref()


disconnectPresentationSpace = () ->
    function_number = ref.alloc(ref.types.int32, 2)
    data_string = ref.allocCString('A')
    length = ref.alloc(ref.types.int32,4)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position.deref()


sendKey = (key) ->
    function_number = ref.alloc(ref.types.int32, 3)
    data_string = ref.allocCString(key)
    length = ref.alloc(ref.types.int32,key.length)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position.deref()


wait = () ->
    function_number = ref.alloc(ref.types.int32, 4)
    data_string = ref.allocCString('')
    length = ref.alloc(ref.types.int32,0)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position.deref()


copyPresentationSpace = (screen) ->
    function_number = ref.alloc(ref.types.int32, 5)
    data_string = ref.allocCString(screen)
    length = ref.alloc(ref.types.int32,8000)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    return data_string


searchPresentationSpace = (target) ->
    function_number = ref.alloc(ref.types.int32, 6)
    data_string = ref.allocCString(target, 'ascii')
    length = ref.alloc(ref.types.int32,target.length)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    return {'returnCode':ps_position.deref(), 'position':length.deref()}


queryCursorLocation = () ->
    function_number = ref.alloc(ref.types.int32, 7)
    data_string = ref.allocCString('')
    length = ref.alloc(ref.types.int32,0)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    return {'returnCode':ps_position.deref(), 'position':length.deref()}




console.log connectPresentationSpace('A')
console.log sendKey("H")
console.log sendKey("I")
console.log disconnectPresentationSpace()
