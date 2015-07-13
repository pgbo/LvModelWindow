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
  s.summary          = "A short description of LvModelWindow."
  s.description      = <<-DESC
                       弹出视图的Window，可以往window中添加任何视图，支持StatusBar隐藏，支持屏幕旋转
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
