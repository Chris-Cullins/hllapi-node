ffi = require('ffi')
ref = require('ref')
debug = require('./debug/logging')

intPtr = ref.refType(ref.types.int32)
cString = ref.refType(ref.types.CString)


debugMode = false

hllapi = ffi.Library('hllapi32', {
    'WinHLLAPI': [intPtr, [intPtr, cString, intPtr, intPtr]]
});


setDebugMode = (boolean) ->
    debugMode = boolean

connectPresentationSpace = (presentationSpace) ->

    function_number = ref.alloc(ref.types.int32, 1)
    data_string = ref.allocCString(presentationSpace)
    length = ref.alloc(ref.types.int32,4)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 1, ps_position.deref(), presentationSpace)
    return ps_position.deref()


disconnectPresentationSpace = () ->
    function_number = ref.alloc(ref.types.int32, 2)
    data_string = ref.allocCString('A')
    length = ref.alloc(ref.types.int32,4)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 2, ps_position.deref(), '')
    return ps_position.deref()


sendKey = (key) ->
    function_number = ref.alloc(ref.types.int32, 3)
    data_string = ref.allocCString(key)
    length = ref.alloc(ref.types.int32,key.length)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 3, ps_position.deref(), key)
    return ps_position.deref()


wait = () ->
    function_number = ref.alloc(ref.types.int32, 4)
    data_string = ref.allocCString('')
    length = ref.alloc(ref.types.int32,0)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 4, ps_position.deref(), '')
    return ps_position.deref()


copyPresentationSpace = (screen) ->
    function_number = ref.alloc(ref.types.int32, 5)
    data_string = ref.allocCString(screen)
    length = ref.alloc(ref.types.int32,8000)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 5, ps_position.deref(), '')
    return data_string


searchPresentationSpace = (target) ->
    function_number = ref.alloc(ref.types.int32, 6)
    data_string = ref.allocCString(target, 'ascii')
    length = ref.alloc(ref.types.int32,target.length)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 6, ps_position.deref(), target)
    return {'returnCode':ps_position.deref(), 'position':length.deref()}


queryCursorLocation = () ->
    function_number = ref.alloc(ref.types.int32, 7)
    data_string = ref.allocCString('')
    length = ref.alloc(ref.types.int32,0)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 7, ps_position.deref(), '')
    return {'returnCode':ps_position.deref(), 'position':length.deref()}


copyPresentationSpaceToString = (sizeOfSpace) ->
    function_number = ref.alloc(ref.types.int32, 8)
    holdingString = " "
    for x in [1..sizeOfSpace] by 1
        holdingString = holdingString + " "

    data_string = ref.allocCString(holdingString)
    length = ref.alloc(ref.types.int32,0)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 8, ps_position.deref(), sizeOfSpace)
    return {'returnCode':ps_position.deref(), 'position':length.deref()}

setSessionParameters = (input) ->
    function_number = ref.alloc(ref.types.int32, 9)
    data_string = ref.allocCString(input)
    length = ref.alloc(ref.types.int32, input.length)
    ps_position = ref.alloc(ref.types.int32, position)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 9, ps_position.deref(), input)
    return ps_position.deref()

pause = (time) ->
    function_number = ref.alloc(ref.types.int32, 18)
    data_string = ref.allocCString('')
    length = ref.alloc(ref.types.int32, time)
    ps_position = ref.alloc(ref.types.int32, position)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 18, ps_position.deref(), time)
    return ps_position.deref()


querySessionStatus = (presSpace) ->
    function_number = ref.alloc(ref.types.int32, 22)
    data_string = ref.allocCString(presSpace)
    length = ref.alloc(ref.types.int32, 20)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 22, ps_position.deref(), presSpace)
    return ps_position.deref()

startHostNotification = (param) ->
    function_number = ref.alloc(ref.types.int32, 23)
    data_string = ref.allocCString(param)
    length = ref.alloc(ref.types.int32, 16)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 23, ps_position.deref(), param)
    return ps_position.deref()

queryHostUpdate = (presSpace) ->
    function_number = ref.alloc(ref.types.int32, 24)
    data_string = ref.allocCString(presSpace)
    length = ref.alloc(ref.types.int32, 4)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 24, ps_position.deref(), presSpace)
    return ps_position.deref()

stopHostNotification = (presSpace) ->
    function_number = ref.alloc(ref.types.int32, 121)
    data_string = ref.allocCString(presSpace)
    length = ref.alloc(ref.types.int32, 4)
    ps_position = ref.alloc(ref.types.int32, 0)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 121, ps_position.deref(), presSpace)
    return ps_position.deref()

findFieldPosition = (input, position) ->
    function_number = ref.alloc(ref.types.int32, 31)
    data_string = ref.allocCString(input)
    length = ref.alloc(ref.types.int32, input.length)
    ps_position = ref.alloc(ref.types.int32, position)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 31, ps_position.deref(), input)
    return {'returnCode':ps_position.deref(), 'length':length.deref()}

copyStringtoField = (input, position) ->
    function_number = ref.alloc(ref.types.int32, 33)
    data_string = ref.allocCString(input)
    length = ref.alloc(ref.types.int32, input.length)
    ps_position = ref.alloc(ref.types.int32, position)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 33, ps_position.deref(), input)
    return ps_position.deref()


copyFieldtoString = (targetString, position) ->
    function_number = ref.alloc(ref.types.int32, 34)
    data_string = ref.allocCString(targetString)
    length = ref.alloc(ref.types.int32, targetString.length)
    ps_position = ref.alloc(ref.types.int32, position)

    hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    debug.debugHLLAPI(debugMode, 34, ps_position.deref(), targetString)
    return {'returnCode':ps_position.deref(), 'position':length.deref(), 'dataString':data_string.deref()}


## Export functions ###########################################
exports.connectPresentationSpace = connectPresentationSpace;
exports.disconnectPresentationSpace = disconnectPresentationSpace;
exports.sendKey = sendKey;
exports.wait = wait;
exports.copyPresentationSpace = copyPresentationSpace;
exports.searchPresentationSpace = searchPresentationSpace;
exports.queryCursorLocation = queryCursorLocation;
exports.copyPresentationSpaceToString = copyPresentationSpaceToString;
exports.setSessionParameters = setSessionParameters;
exports.pause = pause;
exports.querySessionStatus = querySessionStatus;
exports.queryHostUpdate = queryHostUpdate;
exports.startHostNotification = startHostNotification;
exports.stopHostNotification = stopHostNotification;
exports.findFieldPosition  = findFieldPosition;
exports.copyStringtoField = copyStringtoField;
exports.copyFieldtoString = copyFieldtoString;
