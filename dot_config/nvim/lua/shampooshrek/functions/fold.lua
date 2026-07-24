local M = {}
-- Function to create folds around Python docstrings
function M.PyDocHide()
  -- Ensure the current buffer is a Python file
  if vim.bo.filetype ~= 'python' then
    vim.api.nvim_echo({ { "[PyDocHide] Not a Python file.", "WarningMsg" } }, false, {})
    return
  end

  -- Set foldmethod to manual
  vim.wo.foldmethod = 'manual'

  -- Clear existing manual folds
  vim.cmd('normal! zE')

  -- Get the parser for the current buffer
  local parser = vim.treesitter.get_parser(0, 'python')
  if not parser then
    vim.api.nvim_echo({ { "[PyDocHide] Tree-sitter parser not found for Python.", "ErrorMsg" } }, false, {})
    return
  end

  local tree = parser:parse()[1]
  if not tree then
    vim.api.nvim_echo({ { "[PyDocHide] Failed to parse the buffer.", "ErrorMsg" } }, false, {})
    return
  end

  local root = tree:root()

  -- Function to recursively traverse the tree and find docstrings
  local function traverse(node)
    local node_type = node:type()

    if node_type == 'function_definition' or node_type == 'class_definition' then
      -- Get the body of the function or class
      local body = nil
      for child in node:iter_children() do
        if child:type() == 'block' then
          body = child
          break
        end
      end

      if body then
        -- The first child of the body might be the docstring
        local first_child = body:child(0)
        if first_child and first_child:type() == 'expression_statement' then
          local string_node = first_child:child(0)
          if string_node and string_node:type() == 'string' then
            -- Get the range of the docstring
            local start_row, _, end_row, _ = string_node:range()

            -- Tree-sitter uses 0-based indexing for rows
            local start_line = start_row + 1
            local end_line = end_row + 1

            -- Create a fold from start_line to end_line
            -- Ensure start_line is less than end_line
            if start_line < end_line then
              vim.cmd(string.format('%d,%dfold', start_line, end_line))
            end
          end
        end
      end
    end

    -- Recursively traverse children
    for child in node:iter_children() do
      traverse(child)
    end
  end

  -- Start traversal from the root
  traverse(root)
end

-- Function to create folds around Js docstrings
function M.JsDocHide()
  -- Ensure the current buffer is a Js file
  local filetype = vim.bo.filetype
  local availables = {
    ["javascript"] = true,
    ["typescript"] = true,
    ["javascriptreact"] = true,
    ["typescriptreact"] = true
  }

  if not availables[filetype] then
    vim.api.nvim_echo({ { "[JsDocHide] Not a Js/Ts file.", "WarningMsg" } }, false, {})
    return
  end

  -- Set foldmethod to manual
  vim.wo.foldmethod = 'manual'

  -- Clear existing manual folds
  vim.cmd('normal! zE')

  -- Get the parser for the current buffer
  local parser = vim.treesitter.get_parser(0, filetype)
  if not parser then
    vim.api.nvim_echo({ { "[JsDocHide] Tree-sitter parser not found for Js/Ts.", "ErrorMsg" } }, false, {})
    return
  end

  local tree = parser:parse()[1]

  if not tree then
    vim.api.nvim_echo({ { "[JsDocHide] Failed to parse the buffer.", "ErrorMsg" } }, false, {})
    return
  end

  local root = tree:root()

  local function calc_total_lines(node)
    local start_row, _, end_row, _ = node:range()

    return (end_row - start_row)
  end

  local function get_next_sibling_fast(node)
    local parent = node:parent()
    if not parent then return nil end

    local count = parent:child_count()

    for i = 0, count - 1 do
      local child = parent:child(i)

      if child:id() == node:id() then
        if i < count - 1 then
          return parent:child(i + 1)
        end
        return nil
      end
    end

    return nil
  end

  local function traverse(node)
    local node_type = node:type()

    if node_type == 'comment' and calc_total_lines(node) > 1 then
      local next_node = get_next_sibling_fast(node)

      if next_node == nil then
        return
      end

      local next_node_type = next_node:type()

      if next_node_type == 'export_statement' or
          next_node_type == 'function_declaration' or
          next_node_type == "class_declaration"
      then
        local start_row, _, end_row, _ = node:range()

        local start_line = start_row + 1
        local end_line = end_row + 1

        if start_line < end_line then
          vim.cmd(string.format('%d,%dfold', start_line, end_line))
        end
      end
    end

    -- Recursively traverse children
    for child in node:iter_children() do
      traverse(child)
    end
  end

  -- Start traversal from the root
  traverse(root)
end

return M
