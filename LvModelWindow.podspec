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
  s.version          = "0.1.0"
  s.summary          = "LvModelWindow是一个弹出视图的wrapper Window，通过往它里面添加你想要的视图实现自定义，支持StatusBar隐藏，支持屏幕旋转"
  s.description      = <<-DESC
                       通过LvModelWindow能够轻易实现任意弹出视图，将你想要弹出的视图add到它的windowRootView里，通过modelWindowDelegate设置好show和dismiss细节，即可构建弹出视图
                       DESC
  s.homepage         = "https://github.com/pgbo/LvModelWindow"
  s.license          = 'MIT'
  s.author           = { "pgbo" => "460667915@qq.com" }
  s.source           = { :git => "https://github.com/pgbo/LvModelWindow.git", :tag => s.version.to_s }
  s.social_media_url = 'https://github.com/pgbo'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'LvModelWindow' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
