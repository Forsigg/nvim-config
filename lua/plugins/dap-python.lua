local dap_python = require('dap-python')

dap_python.test_runner = 'pytest'
dap_python.setup('~/code/py-debug/.venv/bin/python')
