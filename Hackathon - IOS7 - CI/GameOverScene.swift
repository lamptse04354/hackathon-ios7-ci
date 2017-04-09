//
//  GameOverScene.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 3/19/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene : SKScene {
    let gameOverLabel = SKLabelNode(fontNamed: "STHeitiTC-Medium")
    override func didMove(to view: SKView) {
        //font scene tap to start
        backgroundColor = SKColor.white
        gameOverLabel.fontSize = 16
        gameOverLabel.fontColor = SKColor.black
        gameOverLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        gameOverLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        gameOverLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameOverLabel.text = "Game over"
        addChild(gameOverLabel)
    }
    


}
