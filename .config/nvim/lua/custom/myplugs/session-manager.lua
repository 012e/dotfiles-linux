local function stdout_exe_cmd(cmd)
	local f = assert(io.popen(cmd))
	local s = assert(f:read("*a"))
	f:close()
	s = string.gsub(s, "^%s+", "")
	s = string.gsub(s, "%s+$", "")
	s = string.gsub(s, "[\n\r]+", " ")
	return s
end

local function is_git_repo()
	-- Must direct stderr to /dev/null because for some reason
	-- the error messsage appear in the buffer
	return (os.execute("git rev-parse --is-inside-work-tree 2>/dev/null") == 0)
end

local function git_repo_root()
	return stdout_exe_cmd("git rev-parse --show-toplevel")
end

local function session_path()
	return (git_repo_root() .. "/vimsession.vim")
end

vim.api.nvim_create_user_command("S", function()
	if is_git_repo() == true then
		vim.cmd("mksession! " .. session_path())
	end
end, {})

-- Create session
vim.api.nvim_create_autocmd({ "WinEnter", "VimLeave" }, {
	callback = function()
		if is_git_repo() == true then
			vim.cmd("mksession! " .. session_path())
		end
	end,
})
