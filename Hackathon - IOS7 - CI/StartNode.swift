//
//  BrickManager.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 3/29/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation

import SpriteKit

class StartNode {
    
    
    let scene : SKScene
    
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    let brickSize = UIScreen.main.bounds.width / 8

    func getBotBricks() -> Void{
        for rowIndex in 0...2 {
            for colIndex in 0...6 {
                    let brickNode = SKSpriteNode(imageNamed: "brick.png")
                    brickNode.size = CGSize(width: brickSize, height: brickSize / 3)
                    brickNode.position = CGPoint(x: 5 + (brickSize / 2) + brickSize * CGFloat(colIndex) + 5 * CGFloat(colIndex) , y: (brickSize / 6) + brickSize / 3 * CGFloat(rowIndex) + 5 * CGFloat(rowIndex) )
                
                self.scene.addChild(brickNode)
            }
        }
    }
    
    func getTopBricks() -> Void{
        for rowIndex in 0...2 {
            for colIndex in 0...6 {
                let brickNode = SKSpriteNode(imageNamed: "brick.png")
                brickNode.size = CGSize(width: brickSize, height: brickSize / 3)
                brickNode.position = CGPoint(x: 5 + (brickSize / 2) + brickSize * CGFloat(colIndex) + 5 * CGFloat(colIndex) , y: self.scene.size.height - (brickSize / 6) - brickSize / 3 * CGFloat(rowIndex) - 5 * CGFloat(rowIndex) )
                
                self.scene.addChild(brickNode)
            }
        }

    }
}
