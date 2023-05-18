local M = {
  'mfussenegger/nvim-dap',
  lazy = true,
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "nvim-telescope/telescope-dap.nvim",
  },
  keys = {
    {"<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run to Cursor" },
    {"<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", desc = "Evaluate Input" },
    {"<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", desc= "Conditional Breakpoint" },
    {"<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
    {"<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
    {"<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
    {"<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
    {"<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate" },
    {"<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
    {"<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", desc = "Hover Variables" },
    {"<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", desc = "Scopes" },
    {"<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
    {"<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
    {"<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause" },
    {"<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
    {"<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
    {"<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
    {"<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
    {"<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate" },
    {"<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
    {"<leader>de", "<cmd>lua require'dapui'.eval()<cr>", mode = "v", desc = "Evaluate" },
  },
  config = function()
    -- config
    local dap_breakpoint = {
      error = {
        text = "🟥",
        texthl = "LspDiagnosticsSignError",
        linehl = "",
        numhl = "",
      },
      rejected = {
        text = "",
        texthl = "LspDiagnosticsSignHint",
        linehl = "",
        numhl = "",
      },
      stopped = {
        text = "⭐️",
        texthl = "LspDiagnosticsSignInformation",
        linehl = "DiagnosticUnderlineInfo",
        numhl = "LspDiagnosticsSignInformation",
      },
    }

    vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
    vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
    vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

    -- extensions
    require("nvim-dap-virtual-text").setup {
      commented = true,
    }

    local dap, dapui = require "dap", require "dapui"
    dapui.setup {} -- use default
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- debuggers
    require("dap-python").setup("python", {})
  end
}

return M
