//
//  SKScene+Addon.swift
//  LostRoutes
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

import SpriteKit

extension SKScene {
    
    // 使用瓦片设置场景背景
    func setBackgroundTilesImageNamed(_ imageName: String) {
        
        var totW: CGFloat = 0  //水平方向已经覆盖距离
        var totH: CGFloat = 0  //垂直方向已经覆盖距离
        var i: CGFloat = 0     //水平方向循环变量
        var j: CGFloat = 0     //垂直方向循环变量
        
        let tile = SKTexture(imageNamed: imageName)
        
        let screenHeight = self.size.height
        let screenWidth = self.size.width
        
        while totH < screenHeight {
            
            if totW >= screenWidth {
                totW = 0
                i = 0
            }
            
            while totW < screenWidth {
                let bg = SKSpriteNode(texture: tile)
                bg.zPosition = -100
                bg.anchorPoint = CGPoint(x: 0.0, y: 0.0)  //设置锚点
                bg.position = CGPoint(x: i * tile.size().width, y: j * tile.size().height)
                
                self.addChild(bg)
                i += 1
                totW += tile.size().width
            }
            j += 1
            totH += tile.size().height
        }
    }
}
