# LvModelWindow

[![CI Status](http://img.shields.io/travis/pgbo/LvModelWindow.svg?style=flat)](https://travis-ci.org/pgbo/LvModelWindow)
[![Version](https://img.shields.io/cocoapods/v/LvModelWindow.svg?style=flat)](http://cocoapods.org/pods/LvModelWindow)
[![License](https://img.shields.io/cocoapods/l/LvModelWindow.svg?style=flat)](http://cocoapods.org/pods/LvModelWindow)
[![Platform](https://img.shields.io/cocoapods/p/LvModelWindow.svg?style=flat)](http://cocoapods.org/pods/LvModelWindow)

## 简介

通过LvModelWindow能够轻易实现任意自定义视图、任意自定义动画。LvModelWindow是一个弹出视图的wrapper Window，可添加自定义视图、自定义动画，支持StatusBar隐藏，支持屏幕旋转。

## 安装
### cocoapods
将下面的语句加入到你的Podfile：
```ruby
pod "LvModelWindow"
```

## 使用
### 初始化
```` objective-c
_modelWindow = [[LvModelWindow alloc]initWithPreferStatusBarHidden:NO preferStatusBarStyle:UIStatusBarStyleLightContent supportedOrientationPortrait:NO supportedOrientationPortraitUpsideDown:NO supportedOrientationLandscapeLeft:NO supportedOrientationLandscapeRight:NO];
_modelWindow.modelWindowDelegate = self;
````
### 添加自定义视图到 Window 上，举例：添加一个 UILabel
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

### 设置动画实体，举例：添加一个 DefaultModelWindowAnimation
_modelWindow.modelWindowAnimation = ({
    DefaultModelWindowAnimation *animation = [[DefaultModelWindowAnimation alloc]init];
    animation.touchBackgroudView = _modelWindow.windowRootView;
    animation.contentView = label;
    animation;
});

````

## Author

pgbo, 460667915@qq.com

## License

LvModelWindow is available under the MIT license. See the LICENSE file for more info.
