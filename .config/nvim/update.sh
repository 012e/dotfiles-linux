#! /usr/bin/fish
set -l temp /tmp/NvChad
set -l dest ~/.config/nvim

rm -rf /tmp/NvChad
git clone https://github.com/NvChad/NvChad /tmp/NvChad
cp $temp/init.lua $dest/ -r
# cp $temp/.stylua.toml $dest/ -r
cp $temp/lua/core $dest/lua/ -r
cp $temp/lua/plugins $dest/lua/ -r

set -l old_commit_hash (cat ./commit_hash.txt)
set -l current_commit_hash (git --git-dir=$temp/.git rev-parse HEAD)
if [ $old_commit_hash != $current_commit_hash ]

    # handle new comits
    git --git-dir=$temp/.git log \
                  $old_commit_hash..$current_commit_hash \
                > changelog.txt

    # update old commit hash to newer one
    echo $current_commit_hash > ./commit_hash.txt
else
    echo "not updated" > ./changelog.txt
end

# update packer_compile
nvim -c PackerSync

