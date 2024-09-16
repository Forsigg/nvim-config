local dap = require('dap')

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

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Just launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end,
    },

    {
        name = "Launch file with custom venv",
        type = "python",
        request = "launch",
        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			--
						local venvPath = vim.fn.input("Venv Path: ")
						return venvPath
            -- local cwd = vim.fn.getcwd()
            -- if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            --     return cwd .. '/venv/bin/python'
            -- elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            --     return cwd .. '/.venv/bin/python'
            -- else
            --     return '/usr/bin/python'
            -- end
        end
    },
    {
        name = "Launch file with envs",
        type = "python",
        request = "launch",
        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end,
        env = function()
            local envInputPath = vim.fn.input("Env Path: ")
            local currentPath = vim.fn.getcwd()
            local envPath = currentPath .. "/" .. envInputPath

            print(envPath)

            local envFileContent = readFile(envPath)
            return parseEnv(envFileContent)
        end
    }
}

dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port or '10001'
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
                source_filetype = 'python',
            },
        })
    else
        cb({
            type = 'executable',
            command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/debugpy-adapter",
            args = { '-m', 'debugpy.adapter' },
            options = {
                source_filetype = 'python',
            },
        })
    end
end
