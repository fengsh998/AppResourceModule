//
//  Bundle+Library.swift
//  动态库/静态库，资源访问方式。
//
//  Created by fengsh998 on 2020/8/25.
//

import Foundation

/**
每个组件都可以写一个ModuleBundle类(类名自定)实现该协议即可。
⚠️:
当不想让外部访问，即只访问内部资源时,直接用默认权限, 不要用public!
如果想跨模块访问时则通过public 公开
```
[public] class ModuleBundle: BundleResourceAccess {
    static var bundleName: String { get { "YourModuleName" } }
    // 这个是固定写法
    static var bundleClass: AnyClass { get { ModuleBundle.self } }
}
```
*/


public protocol BundleResourceAccess {
    /// 需要读取的bundle的名字
    static var bundleName: String { get }
    /// framework 所处的位置
    static var bundleClass: AnyClass { get }
    
    /// 获取模块内Resources内的图片,不存bunlde默认为当前bundle
    static func image(name: String,bundle:Bundle?) -> UIImage?
    
    /// 获取模块内Resources内的Nib
    static func nib(name: String,bundle:Bundle?) -> UINib?
    
    /// 获取模块内Resources内的StoryBoard
    static func storyBoard(name: String,bundle:Bundle?) -> UIStoryboard?
    
    /// 获取模块内Resources文件夹内的资源文件
    static var currentBundle: Bundle { get }
    
    /// 获取当前Bundle下的扩展类型数量
    static func extResInBundle(bundle:Bundle,ext:String) -> [String]
    /// 获取当前资源包的子资源包
    static func subBundleInBundle(parenBundle:Bundle,subBundlName:String) -> Bundle?
}

///协议默认实现
public extension BundleResourceAccess {
    static func image(name: String,bundle:Bundle? = nil) -> UIImage? {
        UIImage(named: name, in: bundle ?? currentBundle, compatibleWith: nil)
    }
    
    static func nib(name: String,bundle:Bundle?  = nil) -> UINib? {
        UINib(nibName: name, bundle:bundle ?? currentBundle)
    }
    
    static func storyBoard(name: String,bundle:Bundle?  = nil) -> UIStoryboard? {
        UIStoryboard(name: name, bundle: bundle ?? currentBundle)
    }
    
    static var currentBundle: Bundle {
        get {
            let bundle: Bundle = Bundle(for: bundleClass)
            guard let url = bundle.url(forResource: bundleName, withExtension: "bundle") else { return bundle }
            return Bundle(url: url) ?? bundle
        }
    }
    
    static func extResInBundle(bundle:Bundle,ext:String) -> [String] {
        return bundle.paths(forResourcesOfType: ext, inDirectory: nil)
    }
    
    static func subBundleInBundle(parenBundle:Bundle,subBundlName:String) -> Bundle? {
        let suburl = parenBundle.url(forResource: subBundlName, withExtension: "bundle")
        guard let exsisturl = suburl else {
            return nil
        }
        return Bundle(url: exsisturl)
    }
}

