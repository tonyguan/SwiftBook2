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

let predicate = NSPredicate(format: "salary > %d AND %K = %@", 1250, "job", "SALESMAN")

let array = NSArray(array: arrayEmployees)
let filteredArray = array.filtered(using: predicate)

for item in filteredArray {
    let emp = item as! Employee
    print("no: \(emp.no) name:  \(emp.name) salary: \(emp.salary)")
}

let predicateDept = NSPredicate(format: "SELF.dept.location = %@", "CHICAGO")
let depts = array.filtered(using: predicateDept)
for item in depts {
    let emp = item as! Employee
    print("no: \(emp.no) name:  \(emp.name) salary: \(emp.salary)")
}
