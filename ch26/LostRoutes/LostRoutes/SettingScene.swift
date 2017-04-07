//
//  SettingScene.swift
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

class SettingScene: SKScene {

    let defaults = UserDefaults.standard

    override func didMove(to view: SKView) {

        self.setBackgroundTilesImageNamed("red_tiles")

        let settingHelpAtlas = SKTextureAtlas(named: "setting_help")

        // Ok按钮
        let okMenuItem = WKSpriteButton(normalTexture:
        settingHelpAtlas.textureNamed("buttonOk"),
                selectedTexture: settingHelpAtlas.textureNamed("buttonOkOn"),
                callback: #selector(touchedOkMenuItem))

        okMenuItem.position = CGPoint(x: 210, y: 54)
        self.addChild(okMenuItem)

        //把所有标签节点对象字体全部设置为【汉仪黛玉体简】
        for node in self.children where node is SKLabelNode {
            let labelNode = node as! SKLabelNode
            labelNode.fontName = "HYDaiYuJ"
        }

        let soundToggleStatus = defaults.bool(forKey: Configuration.SoundKey)
        let soundToggleButton = WKSpriteToggleButton(onTexture: settingHelpAtlas.textureNamed("checkOn"), offTexture: settingHelpAtlas.textureNamed("checkOff"),
                onCallback: #selector(touchSoundOn),
                offCallback: #selector(touchSoundOff),
                status: soundToggleStatus)

        soundToggleButton.position = CGPoint(x: 220, y: 400)
        self.addChild(soundToggleButton)

        let musicToggleStatus = defaults.bool(forKey: Configuration.MusicKey)
        let musicToggleButton = WKSpriteToggleButton(onTexture: settingHelpAtlas.textureNamed("checkOn"), offTexture: settingHelpAtlas.textureNamed("checkOff"),
                onCallback: #selector(touchMusicOn),
                offCallback: #selector(touchMusicOff),
                status: musicToggleStatus)

        musicToggleButton.position = CGPoint(x: 220, y: 330)
        self.addChild(musicToggleButton)

        //设置背景音乐
        if defaults.bool(forKey: Configuration.MusicKey) {
            WKSoundHelper.playMusic(self, fileNamed: Configuration.HomeMusic)
        }
    }

    func touchMusicOn() {
        print("touchMusicOn")
        if defaults.bool(forKey: Configuration.SoundKey) {
            WKSoundHelper.playSoundEffect(self, fileNamed: Configuration.TapSoundEffect)
        }
        //停止播放背景音乐
        WKSoundHelper.stopMusic(self)

        //状态 On->Off
        defaults.set(false, forKey: Configuration.MusicKey)
    }

    func touchMusicOff() {
        print("touchMusicOff")

        if defaults.bool(forKey: Configuration.SoundKey) {
            WKSoundHelper.playSoundEffect(self, fileNamed: Configuration.TapSoundEffect)
        }
        //播放背景音乐
        WKSoundHelper.playMusic(self, fileNamed: Configuration.HomeMusic)

        //状态 Off->On
        defaults.set(true, forKey: Configuration.MusicKey)
    }

    func touchSoundOn() {
        print("touchSoundOn")
        //已经是On状态
        if defaults.bool(forKey: Configuration.SoundKey) {
            WKSoundHelper.playSoundEffect(self, fileNamed: Configuration.TapSoundEffect)
        }
        //状态 On->Off
        defaults.set(false, forKey: Configuration.SoundKey)
    }

    func touchSoundOff() {
        print("touchSoundOff")
        //状态 Off->On
        defaults.set(true, forKey: Configuration.SoundKey)
    }

    func touchedOkMenuItem() {
        if defaults.bool(forKey: Configuration.SoundKey) {
            WKSoundHelper.playSoundEffect(self, fileNamed: Configuration.TapSoundEffect, completion: { () -> Void in
                let doors = SKTransition.doorsCloseHorizontal(withDuration: 1.0)
                let scene = HomeScene(fileNamed: "HomeScene")
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: doors)
            })
        } else {
            let doors = SKTransition.doorsCloseHorizontal(withDuration: 1.0)
            let scene = HomeScene(fileNamed: "HomeScene")
            scene!.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: doors)
        }
    }
}
