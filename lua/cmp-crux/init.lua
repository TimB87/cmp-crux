local cmp = require 'cmp'

local function runCommand(cmd)
  local handle = io.popen(cmd)
  local Output = handle and handle:read '*a'
  if Output then
    Result = {}
    for line in Output:gmatch '[^\r\n]+' do
      table.insert(Result, line)
    end
  else
    print 'No output available.'
  end
  if handle then
    handle:close()
  end
  return Result
end

local command = 'prt-cache list'
local outputTable = runCommand(command)

local resultTable = {}
for _, value in ipairs(outputTable) do
  table.insert(resultTable, { label = value })
end

local source = {}

function source:is_available()
  if vim.bo.filetype == 'Pkgfile' then
    return true
  end
end

function source:get_trigger_characters()
  return { '.' }
end

function source:complete(params, callback)
  callback(resultTable)
end

function source:resolve(completion_item, callback)
  callback(completion_item)
end

function source:execute(completion_item, callback)
  callback(completion_item)
end

return source
