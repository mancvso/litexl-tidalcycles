local io = require("io")
local ghc = { ghc_process = nil, ghc_path = "/usr/bin/ghci" }

function ghc:start()
  if self.ghc_process == nil then
    self.ghc_process = io.popen(self.ghc_path)
  end
end

function ghc:interactive()
  return self
end

return ghc
