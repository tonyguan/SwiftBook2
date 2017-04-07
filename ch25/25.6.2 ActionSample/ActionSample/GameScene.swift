//
//  GameScene.swift
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

enum ActionTypes : Int {
    case kSequence = 100, kGroup, kRepeate, kRepeatForever, kReverse
}

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let labelSpace:CGFloat = 50
        
        let sequenceLabel = WKLabelButton(text: "Sequence", fontNamed:"Chalkduster", callback: #selector(touchSequenceLabel))
        sequenceLabel.position = CGPoint(x:self.frame.midX, y:self.frame.height - 60)
        self.addChild(sequenceLabel)
        
        let groupLabel = WKLabelButton(text: "Group", fontNamed:"Chalkduster", callback: #selector(touchGroupLabel))
        groupLabel.position = CGPoint(x:self.frame.midX, y:sequenceLabel.position.y - labelSpace)
        self.addChild(groupLabel)
        
        let repeateLabel = WKLabelButton(text: "Repeate", fontNamed:"Chalkduster", callback: #selector(touchRepeateLabel))
        repeateLabel.position = CGPoint(x:self.frame.midX, y:groupLabel.position.y - labelSpace)
        self.addChild(repeateLabel)
        
        let repeatForeverLabel = WKLabelButton(text: "RepeatForever", fontNamed:"Chalkduster", callback: #selector(touchRepeatForeverLabel))
        repeatForeverLabel.position = CGPoint(x:self.frame.midX, y:repeateLabel.position.y - labelSpace)
        self.addChild(repeatForeverLabel)
        
        let reverseLabel = WKLabelButton(text: "Reverse", fontNamed:"Chalkduster", callback: #selector(touchReverseLabel))
        reverseLabel.position = CGPoint(x:self.frame.midX,  y:repeatForeverLabel.position.y - labelSpace)
        self.addChild(reverseLabel)        
        
    }
    
    func touchSequenceLabel() {
        print("touchSequenceLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.scaleMode = .aspectFill
        actionScene?.selectedAction = .kSequence
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    func touchGroupLabel() {
        print("touchGroupLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.scaleMode = .aspectFill
        actionScene?.selectedAction = .kGroup
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    
    func touchRepeateLabel() {
        print("touchRepeateLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.scaleMode = .aspectFill
        actionScene?.selectedAction = .kRepeate
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    func touchRepeatForeverLabel() {
        print("touchRepeatForeverLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.scaleMode = .aspectFill
        actionScene?.selectedAction = .kRepeatForever
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    func touchReverseLabel() {
        print("touchReverseLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.scaleMode = .aspectFill
        actionScene?.selectedAction = .kReverse
        self.view?.presentScene(actionScene!, transition: doors)
    }
}
