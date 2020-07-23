# 上传图片到掘金 cdn
#!bin/sh

# 初始化下标
index=0

# 上传图片
for item in $@; do
    # 将转义的空格 %20 还原 
    item=`echo "$item" | sed 's/%20/ /g'`
    # 上传结果
    result=`curl -H "Expect:" -F "file=@$item" https://cdn-ms.juejin.im/v1/upload\?bucket\=gold-user-assets`
    # 添加图片 https 地址到数组，字符截取、去除双引号
    list[$index]=`echo $result | awk -F '"https":' '{ print $2 }' | awk -F '},' '{ print $1 }' | sed 's/\"//g'`
    # 更新下标
    index=`expr $index + 1`
done

echo "Upload Success:"
# 遍历图片地址列表
for item in "${list[@]}"; do
    echo "$item"
done
