Pod::Spec.new do |s|
  s.name             = 'AModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AModule.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/fengsh998/AModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fengsh998@163.com' => 'fengsh998@163.com' }
  s.source           = { :git => 'https://github.com/fengsh998/AppResourceModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  
  s.static_framework = true
  
  s.subspec 'Classes' do |src|
     src.source_files = 'Modules/AModule/Classes/**/*'
   end
   

   s.subspec 'Resources' do |res|
     res.resource_bundles = {
       'AModule' => ['Modules/AModule/Assets/**/{*.xcassets}','Modules/AModule/Assets/**/{*.bundle}','Modules/AModule/others/*.png']
     }
   end
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'BasicCore', '~> 0.1.0'
end
