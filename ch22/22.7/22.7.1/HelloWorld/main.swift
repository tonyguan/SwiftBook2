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

let pngURL = "http://www.51work6.com/template/veikei_dz_com_20130920_color/images/logo.png"

let path = FileManager.default.currentDirectoryPath
print(path)

// 在当前目录下创建dir1目录
let dir = path.appendingFormat("/dir1")

do {
    try FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)

    let url = URL(string: pngURL)
    let data = NSData(contentsOf: url!)

    // 保存到本地的文件路径
    let pngFile = dir.appendingFormat("/logo.png")
    data!.write(toFile: pngFile, atomically: true)

    // NSString => NSData
    let content1: NSString = "这是一个测试1!\n"
    let data1 = content1.data(using: String.Encoding.utf8.rawValue)
    let content2: NSString = "这是一个测试2!\n"
    let data2 = content2.data(using: String.Encoding.utf8.rawValue)

    let dataOut = NSMutableData()
    dataOut.append(data1!)
    dataOut.append(data2!)

    let txtFile = dir.appendingFormat("/test.txt")
    // 将字节缓存数据写入文件
    dataOut.write(toFile: txtFile, atomically: true)

    // NSData => NSString
    // 从文件读取字节缓存数据
    let dataIn = NSData(contentsOfFile: txtFile)
    let str = NSString(data: dataIn! as Data, encoding: String.Encoding.utf8.rawValue)
    print("从文件读取内容 ：\n\(str!)")
} catch let err as NSError {
    print(err.description)
}


