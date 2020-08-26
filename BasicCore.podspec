#
#
#         BasicCore 组件模块
#
#

Pod::Spec.new do |s|
  s.name             = 'BasicCore'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BasicCore.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/fengsh998/BasicCore'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fengsh998@163.com' => 'fengsh998@163.com' }
  s.source           = { :git => 'https://github.com/fengsh998/AppResourceModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  
  # 设置是否使用静态库进行连接
  #  s.static_framework = true
  
  #s.source_files = 'Modules/BasicCore/Src/**/*'
  
  s.subspec 'Classes' do |src|
    src.source_files = 'Modules/BasicCore/Src/**/*'
  end
  

  s.subspec 'Resources' do |res|
    res.resource_bundles = {
      'BasicCore' => ['Modules/BasicCore/Assets/**/{*.xcassets}','Modules/BasicCore/Assets/**/{*.bundle}']
    }
  end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
