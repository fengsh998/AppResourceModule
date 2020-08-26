# AppResourceModule

[![CI Status](https://img.shields.io/travis/fengsh998@163.com/AppResourceModule.svg?style=flat)](https://travis-ci.org/fengsh998@163.com/AppResourceModule)
[![Version](https://img.shields.io/cocoapods/v/AppResourceModule.svg?style=flat)](https://cocoapods.org/pods/AppResourceModule)
[![License](https://img.shields.io/cocoapods/l/AppResourceModule.svg?style=flat)](https://cocoapods.org/pods/AppResourceModule)
[![Platform](https://img.shields.io/cocoapods/p/AppResourceModule.svg?style=flat)](https://cocoapods.org/pods/AppResourceModule)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AppResourceModule is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AppResourceModule'
```

本地测试。

```ruby
use_frameworks! 

target 'AppResourceModule_Example' do
  pod 'AppResourceModule', :path => '../'

  pod 'BasicCore', :path => '../'
  pod 'AModule', :path => '../'
  pod 'BModule', :path => '../'
#  target 'AppResourceModule_Tests' do
#    inherit! :search_paths
#
#
#  end
end
```



每个组件(组件化)都可以写一个ModuleBundle类(类名自定)实现该协议即可。

当不想让外部访问，即只访问内部资源时,直接用默认权限, 不要用public!

如果想跨模块访问时则通过public 公开

```swift
[public] class ModuleBundle: BundleResourceAccess {

  static var bundleName: String { get { "ModuleName" } }
  static var bundleClass: AnyClass { get { ModuleBundle.self } }

}
```



##### EXAMPLE

让外部可以访问

```ruby
/// B 模块内部资源访问，可以外提供
public class BResProvider: BundleResourceAccess {
    public static var bundleName: String { get { "BModule" } }
    // 这个是固定写法
    public static var bundleClass: AnyClass { get { BResProvider.self } }
}
```

让外部不可访问

```ruby
// A 模块内部资源访问，不对外提供
class AResProvider: BundleResourceAccess {
     static var bundleName: String { get { "AModule" } }
     static var bundleClass: AnyClass { get { AResProvider.self } }
}
```



```swift
///主程读取B模块资源
    func todoReadBMoudleRes() {
        
        let imgv = UIImageView(frame: CGRect(x: 50,y: 400,width: 60,height: 60))
        imgv.image = BResProvider.image(name: "B")
        self.view.addSubview(imgv)
        
        
        let subimgv = UIImageView(frame: CGRect(x: 150,y: 400,width: 60,height: 60))
        /*
        let url = BResProvider.currentBundle.url(forResource: "BOthersRes", withExtension: "bundle")
        
        if let surl = url {
            let bd = Bundle(url:surl)
            subimgv.image = BResProvider.image(name: "B_bundles@3x",bundle: bd)
        }
        */
        
        let bd = BResProvider.subBundleInBundle(parenBundle: BResProvider.currentBundle, subBundlName: "BOthersRes")
        subimgv.image = BResProvider.image(name: "B_bundles",bundle: bd)
        self.view.addSubview(subimgv)
    }
    
    ///主程读取A模块资源
    func todoReadAMoudleRes() {
        
        let aTest = ATest()
        let imgv = UIImageView(frame: CGRect(x: 50,y: 600,width: 60,height: 60))
        imgv.image = aTest.getXcassetsImage("A")
        self.view.addSubview(imgv)
        
        
        let subimgv = UIImageView(frame: CGRect(x: 150,y: 600,width: 60,height: 60))
        subimgv.image = aTest.getSubBundleImage("A_bundles")
        self.view.addSubview(subimgv)
        
        let subimgvv = UIImageView(frame: CGRect(x: 250,y: 600,width: 60,height: 60))
        subimgvv.image = aTest.getOthersImage("other")
        self.view.addSubview(subimgvv)
    }
```





## Author

fengsh998@163.com, fengsh998@163.com

## License

AppResourceModule is available under the MIT license. See the LICENSE file for more info.
