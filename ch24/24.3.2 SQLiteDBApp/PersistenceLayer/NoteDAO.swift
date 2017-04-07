//
//  NoteDAO.swift
//  SQLiteDBApp
//
//  Created by 关东升 on 2017-2-18.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import Foundation

#if arch(arm64) || arch(arm)
    import sqlite3        // iOS设备设备
#else
    import sqlite3simulator // iOS模拟器
#endif

public class NoteDAO {
    
    var db: OpaquePointer? = nil //sqlite3 *db
    
    public init() {
        print("构造NoteDAO...")
        self.createDatabase()
    }
    
    //创建数据库
    private func createDatabase() {
        let writableDBPath = "<数据文件路径>"
        let cpath = writableDBPath.cString(using: String.Encoding.utf8)

        if (sqlite3_open(cpath!, &db) != SQLITE_OK) {
            //TODO创建数据表
        }
    }

}
