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

//自定义错误类型
enum DAOError: Error {
    case noData
    case primaryKeyNull
}

//保存数据列表
var listData = [Note]()


//删除Note方法
func remove(_ model: Note) throws {
    
    guard let date = model.date else {
        //抛出"主键为空"错误
        throw DAOError.primaryKeyNull
    }
    //比较日期主键是否相等
    for (index, note) in listData.enumerated() where note.date == date {
        listData.remove(at: index)
    }
}

//查询所有数据方法
func findAll() throws -> [Note] {
    
    guard listData.count > 0 else {
        //抛出"没有数据"错误。
        throw DAOError.noData
    }
    return listData
}

func printNotes() throws {
    
    let datas  = try findAll()
    for note in datas {
        print("date : \(note.date!) - content: \(note.content!)")
    }
}

try printNotes()
