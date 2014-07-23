messages = require('./messages.json')

debugHLLAPI = (mode, functionNum, returnCode, dataString) ->
    if mode
        if returnCode > 0
            ts_hms = new Date()
            messageArray = messages.functionMessageArray
            messageObj = messageArray[functionNum - 1]
            console.log "\n\n[" + ts_hms.toISOString() + "]: Error on Function Name '" + messageObj.name + "'."
            console.log "This function was called inside:"  ##TODO add node function name lib later
            console.log "You passed it the following data: " + dataString
            console.log "HLLAPI returned a return code of: " + returnCode
            console.log "HLLAPI's  message: " + messageObj.message
            console.log "Explaination: " + messageObj.explaination + "\n\n"
    return



exports.debugHLLAPI = debugHLLAPI
