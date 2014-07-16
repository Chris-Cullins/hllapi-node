ffi = require('ffi')
ref = require('ref')
hlldll = ffi.DynamicLibrary("./hllapi32.dll")
hllapi = hlldll.get('WinHLLAPI')
#hllapi = hlldll.WinHLLAPI
#WinHLLAPI = ffi.ForeignFunction(hllapi, Number,  [Number,  String,  Number, Number])

functionNum = ref.refType('int')
dataString = ref.refType('string')
length = ref.refType('int')
pos = ref.refType('int')
posReturn = ref.refType('int')

hllapiLib = ffi.Library('hllapi32', {
    'WinHLLAPI': [posReturn, [functionNum, dataString, length, pos]]
});

connectPresentationSpace = (presentationSpace, callback) ->

    function_number = ref.alloc('int', 1)
    data_string = ref.alloc('CString', presentationSpace)
    length = ref.alloc('int',4)
    ps_position = ref.alloc('int', 0)
    ps_position_return = ref.alloc('int')
    console.log function_number.deref() + " ... " + data_string.deref() + " ... " + length.deref()
    console.log hllapiLib.WinHLLAPI.async(function_number, data_string, length, ps_position, (err, res) ->
                    console.log "returned!" + ps_position_return.deref()
                    callback()
                    return console.error(err) if err
                    return
    )
    return

disconnectPresentationSpace = () ->
    function_number = ref.alloc('int', 2)
    data_string = ref.alloc('CString')
    length = ref.alloc('int',4)
    ps_position = ref.alloc('int', 0)
    ps_position_return = ref.alloc('int')
    console.log function_number.deref() + " ... " + data_string.deref() + " ... " + length.deref()
    ps_position_return = hllapiLib.WinHLLAPI.async(function_number, data_string, length, ps_position, (err, res) ->
        return console.error(err) if err
        console.log "returned!" + ps_position_return.deref()
        return
    )
    return ps_position_return.deref()

sendKey = (key) ->
    function_number = ref.alloc('int', 1)
    data_string = ref.alloc('CString', key)
    length = ref.alloc('int',key.length)
    ps_position = ref.alloc('int', 0)
    ps_position_return = ref.alloc('int')
    console.log function_number.deref() + " ... " + data_string.deref() + " ... " + length.deref()
    ps_position_return = hllapiLib.WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position_return.deref()


connectPresentationSpace('A', sendKey('H'))
sendKey('H')
sendKey('I')
disconnectPresentationSpace()
