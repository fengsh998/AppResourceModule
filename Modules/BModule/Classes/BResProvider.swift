//
//  BResProvider.swift
//  Pods
//
//  Created by fengsh998 on 2020/8/26.
//

import Foundation
import BasicCore

/// B 模块内部资源访问，可以外提供
public class BResProvider: BundleResourceAccess {
    public static var bundleName: String { get { "BModule" } }
    // 这个是固定写法
    public static var bundleClass: AnyClass { get { BResProvider.self } }
}
