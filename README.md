## Typora 自定义命令上传图片

### 声明！

<div style='color:#f00;'>
本项目只可用于个人学习使用，任何商业行为与作者无关！
</div>

### How to use

将 bin 目录 `.sh` 文件复制到自己 pc 任意目录下，比如放到 `~/shell/`目录下，如果按文件名 `juejin-uploader`，则执行步骤为

1、进入到 ~/shell/ 目录

```bash
$ cd ~/shell/
```

2、将 shell 脚本变为可执行文件

```bash
$ chmod 777 juejin-uploader.sh
# or
# chmod a+x juejin-uploader.sh
```

3、打开 `Typora` 的偏好设置

- 选中 `Image`菜单
- 勾选 Apply above rules to online images
- Image Upload 选项选择 `Custom Command`
- 填写 shell 脚本路径

![image-20200722101002334](https://user-gold-cdn.xitu.io/2020/7/22/173744f4fe3890b9?w=685&h=466&f=png&s=54135)

4、点击 Test Uploader 测试下能否上传成功吧

5、复制图片或者插入本地图片到 Typora 中，然后点击上传图片即可上传

## 其它

#### 图片路径含有空格等特殊字符时

本地图片路径如果含有空格，在 `shell` 脚本里会被分隔当成两个文件路径处理，根据路径找不到文件，导致上传失败。

> 例：Library/Application Support/typora-user-images/image-20200722101002334.png
>
> Application Support 目录本身含有空格

不过，好在 `Typora` 已经支持了对特殊字符转义的配置，允许在插入图片时自动对图片地址进行 `escape`，我们只要勾选上对应的配置，`shell`脚本在识别到含有转义字符时会进行相应处理

如图：

![image-20200723122404071](https://user-gold-cdn.xitu.io/2020/7/23/1737a93dc82bbae0?w=1360&h=938&f=png&s=132832)

更改配置后，即可上传成功 ✌️
