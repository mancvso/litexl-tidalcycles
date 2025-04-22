-- mod-version:3
local core = require "core"
local DocView = require "core.docview"
local command = require "core.command"
local contextmenu = require "plugins.contextmenu"
local keymap = require "core.keymap"

local repl = require "plugins.tidal.repl"

local function eval(str)
  core.log("OK")
  repl:initTidal()
  return repl:tidalSendExpression("hush")
end

command.add("core.docview", {

  ["tidal:reboot"] = function(dv)
    core.command_view:enter("Evaluate And Replace With Result", {
      submit = function(cmd)
        dv.doc:replace(function(str)
          return eval(cmd)
        end)
      end
    })
  end,

  ["tidal:selected"] = function(dv)
    for idx, line1, col1, line2, col2 in dv.doc:get_selections() do
      if line1 ~= line2 or col1 ~= col2 then
        local text = dv.doc:get_text(line1, col1, line2, col2)
        dv.doc:text_input(eval(text), idx)
      else
        local text = dv.doc.lines[line1]
        dv.doc:replace_cursor(idx, line1, 0, line1, #text, eval)
      end
    end
  end,
})


contextmenu:register("core.docview", {
  { text = "Evaluate Tidal",  command = "tidal:selected" },
  { text = "Reboot Tidal",  command = "tidal:reboot" }
})


keymap.add { ["ctrl+shift+return"] = "tidal:selected" }
