return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- keymaps for LSP
            local on_attach = function(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, bufopts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, bufopts)
                -- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
            end

            -- Auto-format ("lint") on save
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("my.lsp", {}),
                callback = function(args)
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
                    if not client:supports_method("textDocument/willSaveWaitUntil")
                        and client:supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                            end,
                        })
                    end
                end,
            })

            -- completion capabilities (optional, for nvim-cmp)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            if ok then
                capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
            end

            -- Helper to configure and enable a server
            local function enable_lsp(name, config)
                config = config or {}
                config.on_attach = on_attach
                config.capabilities = capabilities
                vim.lsp.config(name, config)
                vim.lsp.enable(name)
            end
            enable_lsp("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                        telemetry = { enable = false },
                    }
                }
            })
            enable_lsp("clangd",
                {
                    cmd = { "clangd", "--query-driver=/usr/bin/g++,/usr/bin/gcc" },
                    filetypes = { "c", "cpp", "objcpp" },
                    root_markers = {
                        ".clangd",
                        ".clang-tidy",
                        ".clang-format",
                        "compile_commands.json",
                        "compile_flags.txt",
                        "configure.ac",
                        ".git"
                    }
                }
            )
            enable_lsp("rust_analyzer")
            enable_lsp("denols")
            enable_lsp("tsserver")
            enable_lsp("html")
            enable_lsp("cssls")
            enable_lsp("pyright")
            enable_lsp("gopls")
            enable_lsp("bashls")
            enable_lsp("jsonls")
        end
    }
}
