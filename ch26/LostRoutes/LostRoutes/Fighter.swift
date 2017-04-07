//
//  Fighter.swift
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

class Fighter: SKSpriteNode {
    //当前的生命值
    var hitPoints: UInt = 0

    init(texture: SKTexture?) {

        super.init(texture: texture, color: UIColor.clear, size: texture!.size())
        ///构造完成

        //设置粒子系统，并放在飞机下面.
        if let particles = SKEmitterNode(fileNamed: "fire.sks") {
            particles.position = CGPoint(x: 0, y: (0 - self.size.height / 2))
            addChild(particles)
        }

        //设置物理引擎的物体
        let path = CGMutablePath()
        path.move(to: CGPoint(x: -43.5, y: 15.5))
        path.addLine(to: CGPoint(x: -23.5, y: 33))
        path.addLine(to: CGPoint(x: 28.5, y: 34))
        path.addLine(to: CGPoint(x: 48, y: 17.5))
        path.addLine(to: CGPoint(x: 0, y: -39.5))

        let body = SKPhysicsBody(polygonFrom: path)
        self.physicsBody = body

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
