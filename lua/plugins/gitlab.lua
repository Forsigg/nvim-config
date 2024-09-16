local envs = require('core.envs')

require("gitlab").setup({
    auth_provider = function()
        return envs.GetNeovimEnv('GITLAB_TOKEN'), envs.GetNeovimEnv('GITLAB_URL'), nil
    end
})
