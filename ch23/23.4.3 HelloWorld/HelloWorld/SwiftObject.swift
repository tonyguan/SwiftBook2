//
//  SwiftObject.swift
//  HelloWorld
//
//  Created by 关东升 on 2017/1/20.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import Foundation

@objc class SwiftObject: NSObject {

    private var name: String
    private var greeting: String

    init(greeting aGreeting: String, name aName: String) {
        self.greeting = aGreeting
        self.name = aName
    }

    override var description: String {
        let string = String(format: "desc -> name:%@, greeting:%@", name, greeting)
        return string
    }

    func sayHello(_ aGreeting: String, name aName: String) -> String {
        var string = "Hi," + aName + " "
        string += aGreeting + "."
        return string
    }
}
