console.log "Beginning HLLAPI tests..."
messages = require('./messages.json')


outPut = (functionNum, returnCode, dataString) ->
    messageArray = messages.functionMessageArray
    messageObj = messageArray[functionNum]
    console.log "\n\n[" + Date.toString + "]: Error on Function Name '" + messageObj.name + "'."
    console.log "\tThis function was called inside:"  ##TODO add node function name lib later
    console.log "\tYou passed it the following data: " + dataString
    console.log "\tHLLAPI returned a return code of: " + returnCode
    console.log "\tHLLAPI's  message: " + messageObj.message
    console.log "\tExplaination: " + messageObj.explaination + "\n\n"
    return

debugHLLAPI = (mode, functionNum, returnCode, dataString) ->
    if mode
        switch functionNum
            when 1 then output(1, returnCode, dataString)



exports.debugHLLAPI = debugHLLAPI
