local connectedDatabase = false

if connectedDatabase == false then
    connectedDatabase = dbConnect("mysql", "dbname=" ..databaseConfig.dbName.. ";host=" ..databaseConfig.host.. ";charset=utf8", databaseConfig.user, databaseConfig.password, "share=0")

    if connectedDatabase == false then
        setServerPassword(exports.rp_util:generateString(16))

        for index, player in pairs(getElementsByType("player")) do
            kickPlayer(player, "system", "Skontaktuj się z administratorem podając błąd #1")
        end

        return false
    end

    setServerPassword()
    outputDebugString("The database has been correctly connected", 4, 0, 255, 0)
end

function getDatabaseConnection()
    return connectedDatabase
end

function dbQueryExtended(query)
    if not query or not connectedDatabase then return end

    local finalResult = nil

    local preparedString = dbPrepareString(connectedDatabase, query)
    
    if preparedString then
        local queryHandle = dbQuery(connectedDatabase, preparedString)

        if queryHandle then
            pollProgress = dbPoll(queryHandle, -1)
            pollProgress = pollProgress[1]

            if not pollProgress then
                dbFree(queryHandle)
                return finalResult
            end

            finalResult = pollProgress
            return finalResult
        end
    end
end

function dbExecExtended(query)
    if not query or not connectedDatabase then return end

    local preparedString = dbPrepareString(connectedDatabase, query)

    if preparedString then 
        if dbExec(connectedDatabase, preparedString) then
            return true
        else
            return false
        end
    end
end