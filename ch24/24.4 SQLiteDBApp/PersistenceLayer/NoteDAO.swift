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


//自定义数据访问错误类型
enum DAOError: Error {
    case dbOpenFailure      //数据库打开失败
    case tableCreateFailure //数据表创建失败
    case dataInsertFailure  //数据插入失败
    case dataSelectFailure  //数据查询失败
    case dataDeleteFailure  //数据删除失败
    case dataUpdateFailure  //数据更新失败
}

public class NoteDAO {

    let dbFileName = "NotesList.sqlite3"

    var db:OpaquePointer? = nil //sqlite3 *db

    let dateFormatter = DateFormatter()

    public init() throws {
        print("构造NoteDAO...")

        try self.createDatabase()

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }

    //创建数据库
    private func createDatabase() throws {

        let path = self.applicationDocumentsDirectoryFile()
        let cpath = path.cString(using: String.Encoding.utf8)

        if sqlite3_open(cpath!, &db) != SQLITE_OK {
            //数据库打开失败。
            throw DAOError.dbOpenFailure
        } else {
            let sql = "CREATE TABLE IF NOT EXISTS Note (cdate TEXT PRIMARY KEY, content TEXT)"
            let cSql = sql.cString(using: String.Encoding.utf8)

            if (sqlite3_exec(db,cSql!, nil, nil, nil) != SQLITE_OK) {
                //建表失败。
                throw DAOError.tableCreateFailure
            }
        }
        defer {
            print("关闭数据库")
            sqlite3_close(db)
        }
    }

    //插入Note方法
    public func create(_ model: Note) throws -> Int {

        let path = self.applicationDocumentsDirectoryFile()
        let cpath = path.cString(using: String.Encoding.utf8)

        var statement: OpaquePointer? = nil

        if sqlite3_open(cpath!, &db) != SQLITE_OK {
            //数据库打开失败。
            throw DAOError.dbOpenFailure
        } else {
            let sql = "INSERT OR REPLACE INTO note (cdate, content) VALUES (?,?)"
            let cSql = sql.cString(using: String.Encoding.utf8)
            //预处理过程
            if sqlite3_prepare_v2(db, cSql!, -1, &statement, nil) == SQLITE_OK {

                let strDate = dateFormatter.string(from: model.date! as Date)
                let cDate = strDate.cString(using: String.Encoding.utf8)

                let cContent = model.content!.cString(using: String.Encoding.utf8)

                //绑定参数开始
                sqlite3_bind_text(statement, 1, cDate!, -1, nil)
                sqlite3_bind_text(statement, 2, cContent!, -1, nil)

                //执行插入
                if sqlite3_step(statement) != SQLITE_DONE {
                    //插入数据失败。
                    throw DAOError.dataInsertFailure
                }
            }
        }

        defer {
            print("释放语句对象")
            sqlite3_finalize(statement)
        }

        defer {
            print("关闭数据库")
            sqlite3_close(db)
        }

        return 0
    }

    //查询所有数据方法
    public func findAll() throws -> [Note] {

        var listData = [Note]()

        let path = self.applicationDocumentsDirectoryFile()
        let cpath = path.cString(using: String.Encoding.utf8)

        var statement:OpaquePointer? = nil

        if sqlite3_open(cpath!, &db) != SQLITE_OK {
            //数据库打开失败。
            throw DAOError.dbOpenFailure
        } else {
            let sql = "SELECT cdate,content FROM Note"
            let cSql = sql.cString(using: String.Encoding.utf8)
            //预处理过程
            if sqlite3_prepare_v2(db, cSql!, -1, &statement, nil) == SQLITE_OK {

                //执行
                while sqlite3_step(statement) == SQLITE_ROW {

                    let note = Note()
                    if let strDate = getColumnValue(index:0, stmt:statement!) {
                        let date : Date = self.dateFormatter.date(from: strDate)!
                        note.date = date
                    }
                    if let strContent = getColumnValue(index:1, stmt:statement!) {
                        note.content = strContent
                    }
                    listData.append(note)
                }
            }
        }

        defer {
            print("关闭数据库")
            sqlite3_close(db)
        }
        defer {
            print("释放语句对象")
            sqlite3_finalize(statement)
        }

        return listData
    }

    //获得数据库文件路径
    private func applicationDocumentsDirectoryFile() ->String {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let path = (documentDirectory[0] as AnyObject).appendingPathComponent(dbFileName) as String
        print("path : \(path)")
        return path
    }

    //获得字段数据
    private func getColumnValue(index: CInt, stmt: OpaquePointer)->String? {

        if let ptr = UnsafeRawPointer.init(sqlite3_column_text(stmt, index)) {
            let uptr = ptr.bindMemory(to:CChar.self, capacity:0)
            let txt = String(validatingUTF8:uptr)
            return txt
        }
        return nil
    }

}
