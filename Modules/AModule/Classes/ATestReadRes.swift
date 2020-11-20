//
//  ATestReadRes.swift
//  Pods
//
//  Created by fengsh998 on 2020/8/26.
//

import Foundation

public class ATest {
    public init() {
        
    }
    ///取出xcasset打包压后成asset.car包的图片
    public func getXcassetsImage(_ imagename: String) -> UIImage? {
        return AResProvider.image(name: imagename)
    }
    ///取出放在xcasset外部的其它资源图片
    public func getOthersImage(_ imagename: String) -> UIImage? {
        return AResProvider.image(name: imagename)
    }
    
    public func getSubBundleImage(_ imagename: String) -> UIImage? {
        let bd = AResProvider.subBundleInBundle(parenBundle: AResProvider.currentBundle, subBundlName: "AOthersRes")
        return AResProvider.image(name: imagename,bundle: bd)
    }
}
