local ghc = require "plugins.tidal.ghc"

local repl = { managed_ghc = ghc }
function repl:initTidal()
    -- load boot.tidal
    --  script path/content
    self.managed_ghc:start()
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
        print( line=="" and "(blank)" or line)
        self:tidalSendLine(line)
    end

    return self:tidalSendLine(':}')
end

function repl:tidalSendLine(line)
	return self.managed_ghc.writeLine(line)
end

function repl:isStarted()
    return self.managed_ghc ~= nil
end

return repl
