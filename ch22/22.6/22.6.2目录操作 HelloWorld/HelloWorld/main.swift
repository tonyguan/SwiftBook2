//
//  main.swift
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

let fileManager = FileManager.default
let path = fileManager.currentDirectoryPath
print(path)

//在当前目录下创建dir1目录
let dir = path + "/dir1/dir0"

do {
    try fileManager.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
    
    if fileManager.fileExists(atPath: dir) {
        try fileManager.removeItem(atPath: dir)//删除dir0目录
    }
    
} catch let err as NSError {
    print(err.description)
}
