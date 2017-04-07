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

//============== 1.常量指针 ===========
print("============== 1.常量指针 ===========")
func funConstIntPointer(x: UnsafePointer<Int8>) {
    print("调用funConstIntPointer...")
    print(x.pointee)//pointee指针指向的数据
    print(x.successor().pointee)//successor下一个内存地址
}

func funConstVoidPointer(x: UnsafeRawPointer) {
    print("调用funConstVoidPointer...")
    //如果是floatArray参数UInt8.self改为Float.self
    let i8x = x.assumingMemoryBound(to: UInt8.self)
    print(i8x.pointee)
}

var myInt: Int8 = 42
var intArray: [Int8] = [23, 45, 68]
var floatArray: [Float] = [23.0, 45.0, 68.0]

funConstIntPointer(x: &myInt)
funConstIntPointer(x: intArray)
//funConstIntPointer(x: floatArray)  //编译错误

funConstVoidPointer(x: &myInt)
funConstVoidPointer(x: intArray)
funConstVoidPointer(x: floatArray)

//============== 2.可变指针 ===========
print("============== 2.可变指针 ===========")
func funVarUnsignedIntPointer(x: UnsafeMutablePointer<Int32>) {
    print("调用funVarUnsignedIntPointer...")
    print(x.pointee)
    print(x.successor().pointee)
}

func funVarVoidPointer(x: UnsafeMutableRawPointer) {
    print("调用funVarVoidPointer...")
    let iu32x = x.assumingMemoryBound(to: UInt32.self)
    print(iu32x.pointee)
}

var myInt32: Int32 = 450
var int32Array: [Int32] = [230, 450, 80]

funVarUnsignedIntPointer(x: &myInt32)
funVarUnsignedIntPointer(x: &int32Array)

funVarVoidPointer(x: &myInt32)
funVarVoidPointer(x: &int32Array)

var p1 = UnsafeMutablePointer<UInt8>.allocate(capacity: 1)
p1.initialize(to: 10)
print("p1.pointee = \(p1.pointee)")

//UnsafeMutablePointer转换为UnsafePointer
var p2 = UnsafePointer(p1)
print("p2.pointee = \(p2.pointee)")

p1.deinitialize()
p1.deallocate(capacity: 1)

//============== 3. 自动释放指针 ===========
print("============== 2.可变指针 ===========")
func validateContent(ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>) {
    //实例化NSError错误对象
    let error = NSError(domain: "com.51work6", code: 999, userInfo: nil)
    if let content = ioValue.pointee as? String {
        if content == "" {
            print("Content is empty...")
            ioValue.pointee = error
        }
    } else {
        print("Content is nil...")
        ioValue.pointee = error
    }
}

var value: AnyObject? = nil
validateContent(ioValue: &value)
let error = value as! NSError
print(error.code)
