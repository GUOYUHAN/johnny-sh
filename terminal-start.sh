#!/bin/bash

# 定义一个包含所有动物名称的数组
animals=("beavis.zen" "blowfish" "bong" "bud-frogs" "bunny" "cheese" "cower" "daemon" "default" "dragon" "dragon-and-cow" "elephant" "elephant-in-snake" "eyes" "flaming-sheep" "ghostbusters" "head-in" "hellokitty" "kiss" "kitty" "koala" "kosh" "luke-koala" "meow" "milk" "moofasa" "moose" "mutilated" "ren" "satanic" "sheep" "skeleton" "small" "stegosaurus" "stimpy" "supermilker" "surgery" "three-eyes" "turkey" "turtle" "tux" "udder" "vader" "vader-koala" "www")

# 使用$RANDOM生成一个随机数，然后对数组长度取余，得到一个随机索引
random_index=$((RANDOM % ${#animals[@]}))

# 使用随机选中的动物名称
selected_animal=${animals[$random_index]}

fortune | cowsay -f $selected_animal | lolcat
