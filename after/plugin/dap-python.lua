local root = vim.fs.dirname(
    vim.fs.find(".git", {
        upward = true,
        type = "directory",
    })[1]
)
require("dap-python").setup(root .. "/venv/bin/python")
