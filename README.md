## Typora 自定义命令上传图片

#### 声明！

本项目只可用于个人学习使用，任何商业行为与作者无关！

#### How to use

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

**已知问题**

- 本地图片路径如果含有空格，在 `shell` 脚本里会被分隔当成两个文件路径处理，根据路径找不到文件，导致上传失败，这个暂时没有解决，本身这个在 `Typora` 那里就应该对路径（空格之类）进行转义

  > 例：Library/Application Support/typora-user-images/image-20200722101002334.png
  >
  > Application Support 目录本身含有空格

遇到路径含有空格导致上传失败问题，可将图片在其他目录保存一份，再上传
