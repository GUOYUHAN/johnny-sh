#!/bin/bash

# 当任何一行命令执行失败时，脚本立即退出
# set -e

# 先添加所有更改到暂存区
git add .

# 提示用户输入commit信息
echo -e "\e[32m\e[1m请输入commit信息：\e[0m"
IFS= read -r commitMessage
echo -e "\e[32m\e[1m正在git commit -m $commitMessage...\e[0m"

# 执行commit操作
git commit -m "$commitMessage" || { echo "\e[31m\e[1mgit commit 失败，脚本退出\e[0m"; exit 1; }

# 获取本地分支列表
# branches=$(git branch | cut -c 3-)

# 获取当前分支名称
currentBranch=$(git rev-parse --abbrev-ref HEAD)

# 直接推送当前分支
echo
echo -e "\e[32m\e[1m正在推送分支：\e[0m\e[1m\e[42m$currentBranch\e[0m\e[1m\e[32m..."
echo
git push origin "$currentBranch" || { echo "\e[31m\e[1mgit push 失败，脚本退出\e[0m"; exit 1; }

echo -e "\e[32m\e[1m ______    __    __     _____    _____     _____   ______   ______  
/ ____/\  /\_\  /_/\   /\ __/\  /\ __/\  /\_____\ / ____/\ / ____/\ 
) ) __\/ ( ( (  ) ) )  ) )__\/  ) )__\/ ( (_____/ ) ) __\/ ) ) __\/ 
 \ \ \    \ \ \/ / /  / / /    / / /     \ \__\    \ \ \    \ \ \   
 _\ \ \    \ \  / /   \ \ \_   \ \ \_    / /__/_   _\ \ \   _\ \ \  
)____) )   ( (__) )    ) )__/\  ) )__/\ ( (_____\ )____) ) )____) ) 
\____\/     \/__\/     \/___\/  \/___\/  \/_____/ \____\/  \____\/  
\e[0m"

# # 从分支列表中选择要推送的分支
# echo "请选择要推送的分支："
# select branch in $branches; do
#   # 检查用户是否选择了分支
#   if [ -n "$branch" ]; then
#     # 推送分支
#     echo "$branch"
#     git push origin "$branch"
#     break
#   else
#     echo "无效的选择，请重新选择"
#   fi
# done
