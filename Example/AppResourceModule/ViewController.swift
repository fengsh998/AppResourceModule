//
//  ViewController.swift
//  AppResourceModule
//
//  Created by fengsh998@163.com on 08/24/2020.
//  Copyright (c) 2020 fengsh998@163.com. All rights reserved.
//

import UIKit
import AppResourceModule
import BModule
import AModule

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(NSHomeDirectory())
        
        self.testloadMainAppRes()
        self.todoReadBMoudleRes()
        self.todoReadAMoudleRes()
    }
    
    ///主程读取主程的资源
    func testloadMainAppRes() {
        let imgv = UIImageView(frame: CGRect(x: 50,y: 200,width: 60,height: 60))
        imgv.image = UIImage(named: "warning_24x24_")
        self.view.addSubview(imgv)
    }
    
    ///主程读取framework的资源
    ///framework资源读取主程中的资源
    ///framework之间的资源读取
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

