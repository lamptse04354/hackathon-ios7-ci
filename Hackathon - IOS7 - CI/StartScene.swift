//
//  StartScene.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 3/19/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class StartScene : SKScene {
    let tapStartLabel = SKLabelNode(fontNamed: "STHeitiTC-Medium")
    
    override func didMove(to view: SKView) {
        //font scene tap to start
        backgroundColor = SKColor.white
        tapStartLabel.fontSize = 16
        tapStartLabel.fontColor = SKColor.black
        tapStartLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        tapStartLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        tapStartLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        tapStartLabel.text = "Tap to start"
        addChild(tapStartLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        let reveal = SKTransition.doorsOpenVertical(withDuration: 1)
        view!.presentScene(gameScene, transition: reveal)
    }
}
