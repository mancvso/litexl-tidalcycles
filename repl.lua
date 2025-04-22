local ghc = require "plugins.tidal.ghc"

local repl = { managed_ghc = ghc }
function repl:initTidal()
    -- load boot.tidal
    --  script path/content
    self.managed_ghc:start()
    self.managed_ghc:writeLine(":script /home/endo/test-script.hs")
    return true
end

function repl:hush()
    return self:tidalSendExpression('hush')
end

function repl.magiclines(s)
    if s:sub(-1)~="\n" then s=s.."\n" end
    return s:gmatch("(.-)\n")
end

function repl:tidalSendExpression(expression)
    self:tidalSendLine(":{")

    for line in repl.magiclines(expression) do
        -- print( line )
        self:tidalSendLine(line)
    end

    return self:tidalSendLine(':}')
end

function repl:tidalSendLine(line)
    if self.managed_ghc:isStarted() == true then
        return self.managed_ghc:writeLine(line)
    else
        print("not started")
    end
end

function repl:isStarted()
    return self.managed_ghc:isStarted()
end

return repl
