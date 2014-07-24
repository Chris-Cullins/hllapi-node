messages = require('./messages.json')

debugHLLAPI = (mode, functionNum, returnCode, dataString) ->
    if mode
        if returnCode > 0
            ts_hms = new Date()
            for x in [0..messages.functionMessageArray.length - 1] by 1
                if messages.functionMessageArray[x].functionNumber is functionNum
                    functionMessageObj = messages.functionMessageArray[x]

            console.log "\n\n[" + ts_hms.toISOString() + "]: Error on Function Name '" + functionMessageObj.name + "'."
            console.log "This function was called inside:"  ##TODO add node function name lib later
            console.log "You passed it the following data: " + dataString
            console.log "HLLAPI returned a return code of: " + returnCode

            for x in [0..functionMessageObj.message.length - 1] by 1
                if functionMessageObj.message[x].num is returnCode
                    message = functionMessageObj.message[x].mes

            if message?
                console.log "HLLAPI's  message: " + message
            else
                console.log "No HLLAPI message found. Something must have gone terribly wrong."
            ##console.log "Explaination: " + functionMessageObj.explaination + "\n\n"
    return



exports.debugHLLAPI = debugHLLAPI
