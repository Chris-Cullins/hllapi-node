(function() {
  var WinHLLAPI, connectPresentationSpace, ffi, hllapi, hlldll;

  ffi = require('ffi');

  hlldll = ffi.DynamicLibrary("./hllapi32.dll");

  hllapi = hlldll.get('WinHLLAPI');

  WinHLLAPI = ffi.ForeignFunction(hllapi, Number, [Number, String, Number, Number]);

  connectPresentationSpace = function(presentationSpace) {
    var data_string, function_number, length, ps_position, ps_position_return;
    function_number = 1;
    data_string = presentationSpace;
    length = 4;
    ps_position = 0;
    ps_position_return = WinHLLAPI(function_number, data_string, length, ps_position);
    return ps_position_return;
  };

  connectPresentationSpace("A");

}).call(this);
