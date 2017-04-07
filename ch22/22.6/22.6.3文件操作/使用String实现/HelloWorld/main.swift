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

let dir = path + "/dir1"

do {
    try fileManager.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
    let filePath = dir + "/test1.txt"
    
    let content = "这是一个测试!"
    try content.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
    
    let copyFilePath = dir + "/test2.txt"
    
    try fileManager.copyItem(atPath: filePath, toPath: copyFilePath)
    
    let copyFileContent = try String(contentsOfFile: copyFilePath, encoding: String.Encoding.utf8)
    
    print("读取拷贝文件的内容 : \(copyFileContent)")
    
    if fileManager.fileExists(atPath: copyFilePath) {
        try fileManager.removeItem(atPath: copyFilePath)
        print("删除test2.txt 成功。")
    }
} catch let err as NSError {
    print(err.description)
}
