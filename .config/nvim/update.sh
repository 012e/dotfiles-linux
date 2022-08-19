#! /usr/bin/sh
temp=/tmp/NvChad
dest=~/.config/nvim

# sync fork
echo "syncing the fork"
gh repo sync 012e/nvchad -b main

# download fork
rm -rf /tmp/NvChad
echo "cloning the fork"
gh repo clone 012e/nvchad /tmp/NvChad

# copy files
cp $temp/init.lua $dest/ -r
cp $temp/.stylua.toml $dest/ -r
cp $temp/lua/core $dest/lua/ -r
cp $temp/lua/plugins $dest/lua/ -r

old_commit_hash=$(cat ./commit_hash.txt)
current_commit_hash=$(git --git-dir=$temp/.git rev-parse HEAD)

if [ "$old_commit_hash" != "$current_commit_hash" ]; then
	# handle new commits
	git --git-dir=$temp/.git log \
		"$old_commit_hash".."$current_commit_hash" \
		>changelog.txt

	# update old commit hash to newer one
	echo "$current_commit_hash" >./commit_hash.txt
else
	echo "not updated" >./changelog.txt
fi

# update packer_compile
nvim -c PackerSync
