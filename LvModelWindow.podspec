#
# Be sure to run `pod lib lint LvModelWindow.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LvModelWindow"
  s.version          = "0.1.7"
  s.summary          = "LvModelWindow是一个弹出视图的wrapper Window，可添加自定义视图、自定义动画，支持StatusBar隐藏，支持屏幕旋转。"
  s.description      = <<-DESC
                       通过LvModelWindow能够轻易实现任意自定义视图、任意自定义动画。LvModelWindow是一个弹出视图的wrapper Window，可添加自定义视图、自定义动画，支持StatusBar隐藏，支持屏幕旋转。
                       DESC
  s.homepage         = "https://github.com/pgbo/LvModelWindow"
  s.license          = 'MIT'
  s.author           = { "pgbo" => "460667915@qq.com" }
  s.source           = { :git => "https://github.com/pgbo/LvModelWindow.git", :tag => s.version.to_s }
  s.social_media_url = 'https://github.com/pgbo'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
