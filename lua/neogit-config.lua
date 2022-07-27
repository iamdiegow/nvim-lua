local status_ok, neogit = pcall(require, 'neogit')
if not status_ok then
	return
end

neogit.setup {
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  auto_refresh = true,
  disable_builtin_notifications = false,
  use_magit_keybindings = false,
  kind = "tab",
  commit_popup = {
    kind = "split",
  },
  popup = {
    kind = "split",
  },
  signs = {
    section = { ">", "v" }, -- { CLOSED, OPENED }
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true
  },
  -- Setting any section to `false` will make the section not render at all
  sections = {
    untracked = {
      folded = false
    },
    unstaged = {
      folded = false
    },
    staged = {
      folded = false
    },
    stashes = {
      folded = true
    },
    unpulled = {
      folded = true
    },
    unmerged = {
      folded = false
    },
    recent = {
      folded = true
    },
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup"
    }
  }
}
