ffi = require('ffi')
hlldll = ffi.DynamicLibrary("./hllapi32.dll")
hllapi = hlldll.get('WinHLLAPI')
#hllapi = hlldll.WinHLLAPI
WinHLLAPI = ffi.ForeignFunction(hllapi, Number,  [Number,  String,  Number, Number])

connectPresentationSpace = (presentationSpace) ->
    function_number = 1
    data_string = presentationSpace
    length = 4
    ps_position = 0
    ps_position_return = WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position_return

connectPresentationSpace("A")
