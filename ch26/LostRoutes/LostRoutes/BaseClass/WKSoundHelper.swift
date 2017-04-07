//
//  WKSoundHelper.swift
//  Hero
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

struct WKSoundHelper {
    
    // 播放音效
    static func playSoundEffect(_ parent: SKNode, fileNamed: String, completion:@escaping () -> Void) {
        
        let soundNode = SKAudioNode(fileNamed: fileNamed)
        
        soundNode.isPositional = true
        soundNode.position = CGPoint(x: -1024, y: 0)
        soundNode.autoplayLooped = false
        
        parent.addChild(soundNode)
        
        let moveAction = SKAction.moveTo(x: 1024, duration: 0.5)
        let group = SKAction.group([moveAction, SKAction.play()])
        
        soundNode.run(group, completion: completion)
    
    }
    
    // 播放音效
    static func playSoundEffect(_ parent: SKNode, fileNamed: String) {
        
        let soundNode = SKAudioNode(fileNamed: fileNamed)
        
        soundNode.isPositional = true
        soundNode.position = CGPoint(x: -1024, y: 0)
        soundNode.autoplayLooped = false
        
        parent.addChild(soundNode)
        
        let moveAction = SKAction.moveTo(x: 1024, duration: 0.5)
        let group = SKAction.group([moveAction, SKAction.play()])
        
        soundNode.run(group)
        
    }
    
    // 播放背景音乐
    static func playMusic(_ parent: SKNode, fileNamed: String) {
        
        if let node = parent.childNode(withName: "BackgroundMusic_Key") {
            node.removeFromParent()
        }
        let soundNode = SKAudioNode(fileNamed: fileNamed)
        soundNode.name = "BackgroundMusic_Key"

        parent.addChild(soundNode)
    }
    
    // 停止播放背景音乐
    static func stopMusic(_ parent: SKNode) {
        if let node = parent.childNode(withName: "BackgroundMusic_Key") {
            node.run(SKAction.stop())
            node.removeFromParent()
        }
    }
}
