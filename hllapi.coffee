ffi = require('ffi')
ffi.DynamicLibrary("hllapi32.dll")

hllapi = ffi.Library('hllapi', {
    "WinHLLAPI": ["int",["int","string","int","int"]],
    })

connectPresentationSpace (presentationSpace) ->
    function_number = 1
    data_string = presentationSpace
    length = 4
    ps_position = 0
    ps_position_return = hllapi.WinHLLAPI(function_number, data_string, length, ps_position)
    return ps_position_return

connectPresentationSpace("A")
