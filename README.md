# LvModelWindow

[![CI Status](http://img.shields.io/travis/pgbo/LvModelWindow.svg?style=flat)](https://travis-ci.org/pgbo/LvModelWindow)
[![Version](https://img.shields.io/cocoapods/v/LvModelWindow.svg?style=flat)](http://cocoapods.org/pods/LvModelWindow)
[![License](https://img.shields.io/cocoapods/l/LvModelWindow.svg?style=flat)](http://cocoapods.org/pods/LvModelWindow)
[![Platform](https://img.shields.io/cocoapods/p/LvModelWindow.svg?style=flat)](http://cocoapods.org/pods/LvModelWindow)

## 简介

通过LvModelWindow能够轻易实现任意弹出视图，将你想要弹出的视图add到它的windowRootView里，通过modelWindowDelegate设置好show和dismiss细节，即可构建弹出视图

## 安装
### cocoapods
将下面的语句加入到你的Podfile：
```ruby
pod "LvModelWindow", :git => "https://github.com/pgbo/LvModelWindow.git"
```

### 手动安装
拷贝并添加或推拽LvModelWindow目录到你的项目目录里即可。

## 使用
### 初始化
```` objective-c
_modelWindow = [[LvModelWindow alloc]initWithPreferStatusBarHidden:YES supportedOrientationPortrait:NO supportedOrientationPortraitUpsideDown:NO supportedOrientationLandscapeLeft:NO supportedOrientationLandscapeRight:NO];
_modelWindow.modelWindowDelegate = self;
````
### 添加一个视图到Window上，举例：添加一个Labael
```` objective-c
UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 64)];
[_modelWindow.windowRootView addSubview:label];
_modelWindow.windowRootView.backgroundColor = [UIColor blackColor];

label.text = @"😄我显示出来了, 再点我就会消失";
label.backgroundColor = [UIColor whiteColor];
label.textColor = [UIColor blackColor];
label.textAlignment = NSTextAlignmentCenter;

label.userInteractionEnabled = YES;
[label addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissModelWindow)]];
````

## Author

pgbo, 460667915@qq.com

## License

LvModelWindow is available under the MIT license. See the LICENSE file for more info.
