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

let filteredArray1 = NSMutableArray()
for emp in arrayEmployees {
    if emp.salary < 1000 {
        filteredArray1.add(emp)
    }
}
print(filteredArray1.count)
//遍历
for item in filteredArray1 {
    let emp = item as! Employee
    print("no: \(emp.no) name:  \(emp.name) salary: \(emp.salary)")
}

let filteredArray2 = NSMutableArray()
for emp in arrayEmployees where emp.salary < 1000 {
    filteredArray2.add(emp)
}

print(filteredArray2.count)
//遍历
for item in filteredArray2 {
    let emp = item as! Employee
    print("no: \(emp.no) name:  \(emp.name) salary: \(emp.salary)")
}
