#!/bin/bash

# 指定包含PNG文件的源目录
PNG_DIRECTORY="/Users/zhangxingcheng/Desktop/Shell Project(zxc)/PNGSource"
# 指定保存WEBP文件的目标目录
WEBP_DIRECTORY="/Users/zhangxingcheng/Desktop/Shell Project(zxc)/WEBPGenerated"

echo "shell start"

# 检查PNG资源是否存在
if [ ! -d "$PNG_DIRECTORY" ]; then
    echo "指定资源目录不存在: $PNG_DIRECTORY"
    exit 1
fi

# 如果目标目录不存在 - 创建
if [ ! -d "$WEBP_DIRECTORY" ]; then
    mkdir -p "$WEBP_DIRECTORY"
fi

# 转换目录中的所有PNG文件为WEBP
for PNG_FILE in "$PNG_DIRECTORY"/*.png; do

    if [ -f "$PNG_FILE" ]; then

        FILENAME=$(basename "$PNG_FILE" .png)

        WEBP_FILE="$WEBP_DIRECTORY/$FILENAME.webp"

        cwebp "$PNG_FILE" -o "$WEBP_FILE"
        echo "已转换: $PNG_FILE -> $WEBP_FILE"
    else
        echo "没有找到PNG文件: $PNG_FILE"
    fi
done

echo "PNG to WEBP 转换完成。"

