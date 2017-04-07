//
//  MyActionScene.swift
//  ActionSample
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

class MyActionScene: SKScene {
    
    var selectedAction: ActionTypes?
    
    override func didMove(to view: SKView) {
        
        let backButton = WKSpriteButton(normalImageName: "Back-up",
            selectedImageName: "Back-down",
            callback: #selector(touchBackButton))
        
        backButton.position = CGPoint(x:70, y:290)
        self.addChild(backButton)
        
        let goButton = WKSpriteButton(normalImageName: "Go-up",
            selectedImageName: "Go-down",
            callback: #selector(touchGoButton))
        
        goButton.position = CGPoint(x:480, y:60)
        self.addChild(goButton)
        
        let sprite = SKSpriteNode(imageNamed: "hero")
        sprite.name = "hero"
        sprite.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        self.addChild(sprite)
        
    }
    
    func touchBackButton() {
        let doors = SKTransition.doorsCloseHorizontal(withDuration: 0.6)
        let gameScene = GameScene(fileNamed: "GameScene")
        gameScene!.scaleMode = .aspectFill
        self.view?.presentScene(gameScene!, transition: doors)
    }
    
    func touchGoButton() {
        
        switch selectedAction! {
        case .kSequence:
            self.runSequenceAction()
        case .kGroup :
            self.runGroupAction()
        case .kRepeate:
            self.runRepeateAction()
        case .kRepeatForever:
            self.runRepeatForeverAction()
        case .kReverse:
            self.runReverseAction()
        }
        
    }
    
    //执行顺序动作方法
    func runSequenceAction() {
        
        if let sprite = self.childNode(withName: "hero") {
            
            let scale = SKAction.scale(to: 0.5, duration: 1.5)
            let fade = SKAction.fadeOut(withDuration: 1.5)
            let sequence = SKAction.sequence([scale, fade])
            
            sprite.run(sequence)
        }
    }
    
    //执行并列动作方法
    func runGroupAction() {
        
        if let sprite = self.childNode(withName: "hero") {
            
            let scale = SKAction.scale(to: 0.5, duration: 1.5)
            let fade = SKAction.fadeOut(withDuration: 1.5)
            let group = SKAction.group([scale, fade])
            
            sprite.run(group)
        }
    }
    
    //执行有限次数重复动作方法
    func runRepeateAction() {
        
        if let sprite = self.childNode(withName: "hero") {
            
            let rotate = SKAction.rotate(byAngle: CGFloat(M_PI/2), duration:1)
            let repeate3 = SKAction.repeat(rotate, count: 3)
            
            sprite.run(repeate3)
        }
        
    }
    
    //执行无限次数重复动作方法
    func runRepeatForeverAction() {
        
        if let sprite = self.childNode(withName: "hero") {
            
            let rotate = SKAction.rotate(byAngle: CGFloat(M_PI/2), duration:1)
            let forever = SKAction.repeatForever(rotate)
            
            sprite.run(forever)
        }
    }
    
    //执行反动作方法
    func runReverseAction() {
        
        if let sprite = self.childNode(withName: "hero") {
            
            let scale = SKAction.scale(by: 0.5, duration: 1.5)
            let reverseScale = scale.reversed()
            let sequence = SKAction.sequence([scale, reverseScale])
            
            let forever = SKAction.repeatForever(sequence)
            
            sprite.run(forever)
        }
    }
}
