//
//  CoreTestReadRes.swift
//  Pods
//
//  Created by beantechs on 2020/8/26.
//

import Foundation

class BasicCore: BundleResourceAccess {
    static var bundleName: String { get { "BasicCore" } }
    // 这个是固定写法
    static var bundleClass: AnyClass { get { BasicCore.self } }
}
