local M = {}

-- map table
function M.map(tbl, func)
    local result = {}
    for i, v in ipairs(tbl) do
        result[i] = func(v)
    end

    return result
end

-- get files from directory
function M.get_files_in_directory(dir)
    local files = {}
    local scan = require("plenary.scandir")
    scan.scan_dir(dir, {
        only_dirs = false,
        depth = 1,
        add_dirs = false,
        on_insert = function(entry)
            table.insert(files, entry)
        end,
    })

    return files
end

-- map requires files of directory to table
function M.require_files_to_table(dir)
    local t = {}
    for _, file in ipairs(M.get_files_in_directory(dir)) do
        local module_name = file:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("%.lua$", ""):gsub("/", ".")
        local name = module_name:match("%.([^%.]+)$")
        t[name] = require(module_name)
    end

    return t
end

-- import plugins
function M.get_lazy_import_plugins(path)
    local imports = {}
    local lfs = vim.loop.fs_scandir

    local function is_directory(item_path)
        local stat = vim.loop.fs_stat(item_path)
        return stat and stat.type == "directory"
    end

    local function contains_files(item_path)
        local handle = lfs(item_path)
        if not handle then
            return false
        end
        while true do
            local name, type = vim.loop.fs_scandir_next(handle)
            if not name then
                break
            end
            if type == "file" then
                return true
            elseif type == "directory" then
                if contains_files(item_path .. "/" .. name) then
                    return true
                end
            end
        end
        return false
    end

    local function scan(directory, module_path)
        local handle = lfs(directory)
        if not handle then
            return
        end

        local has_files = false
        while true do
            local name, type = vim.loop.fs_scandir_next(handle)
            if not name then
                break
            end
            local full_path = directory .. "/" .. name
            local submodule_path = module_path .. "." .. name
            if type == "file" then
                has_files = true
            elseif type == "directory" then
                scan(full_path, submodule_path)
            end
        end

        if has_files then
            table.insert(imports, module_path)
        end
    end

    scan(path, "plugins")

    return M.map(imports, function(f)
        return { import = f }
    end)
end

-- load and setup theme
function M.setup_theme()
    local config_path = vim.fn.stdpath("config")
    local handle = vim.loop.fs_scandir(config_path .. "/lua/config/theme")
    local theme_file = config_path .. "/.theme"
    local default_theme = "monokai"

    local theme_list = {}
    while true do
        local name, t = vim.loop.fs_scandir_next(handle)
        if not name then
            break
        end
        if t == "file" and type(name) == "string" and name:match("%.lua$") then
            local theme_name = name:gsub("%.lua$", "")
            table.insert(theme_list, theme_name)
        end
    end

    local selected_theme = nil
    if vim.loop.fs_stat(theme_file) then
        local file = io.open(theme_file, "r")
        if file then
            selected_theme = file:read("*l")
            file:close()
        end
    end
    if not selected_theme or not vim.tbl_contains(theme_list, selected_theme) then
        selected_theme = default_theme
    end

    local res = {}
    table.insert(res, require("config.theme." .. selected_theme))

    return res
end

return M
