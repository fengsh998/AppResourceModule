//
//  AResProvider.swift
//  Pods
//
//  Created by beantechs on 2020/8/26.
//

import Foundation
import BasicCore

// A 模块内部资源访问，不对外提供
class AResProvider: BundleResourceAccess {
     static var bundleName: String { get { "AModule" } }
     static var bundleClass: AnyClass { get { AResProvider.self } }
}
