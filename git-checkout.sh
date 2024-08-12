#!/bin/bash

# 获取本地分支列表
IFS=$'\n' branches=($(git branch | cut -c 3-))

# 从分支列表中选择要推送的分支
echo "请选择要切换的分支："
select branch in $branches; do
  # 检查用户是否选择了分支
  if [ -n "$branch" ]; then
    # 切换分支
    echo -e "\e[32m\e[1m正在切换到分支：\e[0m\e[1m\e[42m$branch\e[0m\e[1m\e[32m...\e[0m"
    echo
    git checkout "$branch"
    break
  else
    echo "无效的选择，请重新选择"
  fi
done
