local wk = require("which-key")

wk.register({
    f = {
        name = "Find",
        f = {"Find File"},
        b = {"Find Buffer"},
        h = {"Find Help"},
        w = {"Find Text"}
    },
    e = {"File Manager"},
    o = {"Git status"},
    x = {"Close Buffer"},
    w = {"Save"},
    t = {name = "Terminal", f = {"Float terminal"}, h = {"Horizontal terminal"}},
    h = {"No highlight"},
    g = {name = "Git", b = "Branches", c = "Commits", s = "Status", l = "Lazygit"},
    c = {name = "Comment", l = "Comment Line"},
    l = {
        name = "LSP",
        d = "Diagnostic",
        D = "Hover diagnostic",
        f = "Format",
        r = "Rename",
        a = "Action",
        s = "Symbol",
        x = {
            name = "Extract",
            v = "Extract Var",
            b = "Extract Block to func",
            f = "Extract visual code to func"
        }
    },
    m = {
        name = "Make commands",
        u = "make up",
        d = "make down",
        p = "make prune",
        c = "make check airflow",
        t = {
            name = "make pytest",
            p = "test parsers",
            j = "test joiners",
            o = "test operarors",
            c = "test crawlers",
            e = "test expert filters"
        },
        b = {
            name = "make build",
            a = "build airflow",
            p = "build parsers base",
            j = "build joiners",
            o = "build operarors",
            x = "build couch xporter",
            c = "build crawlers",
            e = "build expert filters",
            t = "build tests"
        }
    },
    d = 'Docs generate',
    -- d = {
    --     name = "Docker",
    --     p = "docker ps",
    --     i = {
    --         name = "Images",
    --         l = "ls"
    --     },
    --     b = {
    --         name = "Build",
    --         b = "docker build ."
    --     }
    -- }
}, {prefix = "<leader>"})
