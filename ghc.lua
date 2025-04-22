local io = require("io")
local process = require("core.process")
local ghc = { ghc_process = nil, started = false, ghc_path = "/usr/bin/ghci" }

function ghc:start()
  if self.ghc_process == nil then
    self.ghc_process = process.start(self.ghc_path, { stdout = process.REDIRECT_PARENT })
    self.started = true
    return self
  end
    print("ghc already started")
end

function ghc:interactive()
  return self
end

function ghc:isStarted()
  return self.ghc_process ~= nil
end

function ghc:writeLine(line)
  if self:isStarted() then
    return self.ghc_process:write(line .. "\n")
  else
    print("ghc not started")
  end
end

return ghc
