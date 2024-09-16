local M = {}

local function readFile(filename)
  -- Open the file in read mode
  local file = io.open(filename, 'r')
  -- Check if the file exists
  if not file then
    -- Return nil and an error message
    return nil, 'File not found: ' .. filename
  end
  -- Read the whole file content
  local content = file:read('*a')
  -- Close the file
  file:close()
  -- Return the content
  return content
end

-- Define a function to parse a .env file and return a table of key-value pairs
local function parseEnv(content)
  -- Create an empty table to store the pairs
  local pairs = {}
  -- Loop through each line in the content
  for line in content:gmatch('[^\r\n]+') do
    -- Trim any leading or trailing whitespace from the line
    line = line:match('^%s*(.-)%s*$')
    -- Ignore empty lines or lines starting with #
    if line ~= '' and line:sub(1, 1) ~= '#' then
      -- Split the line by the first = sign
      local key, value = line:match('([^=]+)=(.*)')
      -- Trim any leading or trailing whitespace from the key and value
      key = key:match('^%s*(.-)%s*$')
      value = value:match('^%s*(.-)%s*$')
      -- Check if the value is surrounded by double quotes
      if value:sub(1, 1) == '"' and value:sub(-1, -1) == '"' then
        -- Remove the quotes and unescape any escaped characters
        value = value:sub(2, -2):gsub('\\"', '"')
      end
      -- Check if the value is surrounded by single quotes
      if value:sub(1, 1) == "'" and value:sub(-1, -1) == "'" then
        -- Remove the quotes
        value = value:sub(2, -2)
      end
      -- Store the key-value pair in the table
      pairs[key] = value
    end
  end
  -- Return the table
  return pairs
end



local function readNeovimEnvFile()
    local homeDir = os.getenv('HOME')
    local envFile = homeDir .. '/.config/nvim/.env'
    local envContent = readFile(envFile)
    return envContent
end


M.GetNeovimEnv = function (key)
    local envContent = readNeovimEnvFile()
    local envPairs = parseEnv(envContent)
    return envPairs[key]
end


return M
