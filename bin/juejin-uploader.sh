# 上传图片到掘金 cdn
#!bin/sh

# 初始化下标
index=0
# 初始化数组
list=()

# 上传图片
for item in $@; do
    # 将转义的空格 %20 还原 
    item=`echo "$item" | sed 's/%20/\ /g'`
    # 上传结果
    result=`curl -H "Expect:" -F "file=@$item" https://cdn-ms.juejin.im/v1/upload\?bucket\=gold-user-assets`
    # 添加图片 https 地址到数组，字符截取、去除双引号
    imagePath=`echo $result | awk -F '"https":' '{ print $2 }' | awk -F '},' '{ print $1 }' | sed 's/\"//g'`
    # 检测图片地址是否不为空
    if [ -n "$imagePath" ]
    then
        list[$index]=$imagePath
        # 更新下标
        index=`expr $index + 1`
    else 
        echo "字符串长度为0"
    fi
done

# 如果 list 数组为空
if [ $index -eq 0  ]
then
    filePath=$@
    result=`curl -H "Expect:" -F "file=@$filePath" https://cdn-ms.juejin.im/v1/upload\?bucket\=gold-user-assets`
    # 添加图片 https 地址到数组，字符截取、去除双引号
    list[$index]=`echo $result | awk -F '"https":' '{ print $2 }' | awk -F '},' '{ print $1 }' | sed 's/\"//g'`
fi

echo "Upload Success:"
# 遍历图片地址列表
for item in "${list[@]}"; do
    echo "$item"
done