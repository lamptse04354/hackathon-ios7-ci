//
//  MatrixAdapter.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 3/29/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation

import SpriteKit

class MatrixAdapter{
    
    var topBricks : [Brick] = []
    var botBricks : [Brick] = []
    
    var spawnTime : Double = 20
    
    var startTime : TimeInterval =  -1
    var spawnTimeCount : TimeInterval = -1
    
    
    
    let scene : SKScene
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    let brickSize = UIScreen.main.bounds.width / 8
    
    //Get Node add StartGame
    
    
    func getBotBricks() -> Void{
        for rowIndex in 0...2 {
            for colIndex in 0...6 {
                let brickNode = SKSpriteNode(imageNamed: "brick.png")
                brickNode.size = CGSize(width: brickSize, height: brickSize / 3)
                brickNode.position = CGPoint(x: 5 + (brickSize / 2) + brickSize * CGFloat(colIndex) + 5 * CGFloat(colIndex) , y: (brickSize / 6) + brickSize / 3 * CGFloat(rowIndex) + 5 * CGFloat(rowIndex) )
                
                self.scene.addChild(brickNode)
                botBricks.append(brickNode as! Brick)
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
                topBricks.append(brickNode as! Brick)
            }
        }
        
    }
    
    // get Node when player is playing
    
    func getNodeBot(dataOfMatrix : [Int]) -> Void{
        for colIndex in 0...6 {
            if (dataOfMatrix[colIndex] == 1 ) {
                let brickNode = SKSpriteNode(imageNamed: "brickType1.png")
                                    brickNode.position = CGPoint(x: 5 + (brickSize / 2) + brickSize * CGFloat(colIndex) + 5 * CGFloat(colIndex) , y: (brickSize / 6))
                brickNode.size = CGSize(width: brickSize, height: brickSize / 3)
                brickNode.physicsBody = SKPhysicsBody(rectangleOf: brickNode.size)
                brickNode.physicsBody?.isDynamic = false
                brickNode.physicsBody?.linearDamping = 0
                brickNode.physicsBody?.categoryBitMask = BitMask.brickType1Catelogy
                brickNode.physicsBody?.collisionBitMask = 1
                brickNode.physicsBody?.contactTestBitMask = BitMask.ballCatelogy
                
                self.scene.addChild(brickNode)
                
                botBricks.append(brickNode as! Brick)
                
            }else if(dataOfMatrix[colIndex] == 2){
                let brickNode = SKSpriteNode(imageNamed: "brickType2.png")
                                    brickNode.position = CGPoint(x: 5 + (brickSize / 2) + brickSize * CGFloat(colIndex) + 5 * CGFloat(colIndex) , y: (brickSize / 6) )
                brickNode.size = CGSize(width: brickSize, height: brickSize / 3)
                brickNode.physicsBody = SKPhysicsBody(rectangleOf: brickNode.size)
                brickNode.physicsBody?.isDynamic = false
                brickNode.physicsBody?.linearDamping = 0
                brickNode.physicsBody?.categoryBitMask = BitMask.brickType2Catelogy
                brickNode.physicsBody?.collisionBitMask = 1
                brickNode.physicsBody?.contactTestBitMask = BitMask.ballCatelogy
                
                self.scene.addChild(brickNode)
                
                botBricks.append(brickNode as! Brick)
            }
        }
    }
    
    func getNodeTop(dataOfMatrix : [Int]) -> Void{
        for colIndex in 0...6 {
            if (dataOfMatrix[colIndex] == 1 ) {
                let brickNode = SKSpriteNode(imageNamed: "brickType1.png")
                brickNode.position = CGPoint(x: 5 + (brickSize / 2) + brickSize * CGFloat(colIndex) + 5 * CGFloat(colIndex) , y: self.scene.size.height - (brickSize / 6))
                brickNode.size = CGSize(width: brickSize, height: brickSize / 3)
                brickNode.physicsBody = SKPhysicsBody(rectangleOf: brickNode.size)
                brickNode.physicsBody?.isDynamic = false
                brickNode.physicsBody?.linearDamping = 0
                brickNode.physicsBody?.categoryBitMask = BitMask.brickType1Catelogy
                brickNode.physicsBody?.collisionBitMask = 1
                brickNode.physicsBody?.contactTestBitMask = BitMask.ballCatelogy
                
                self.scene.addChild(brickNode)
                
                topBricks.append(brickNode as! Brick)
                
            }else if(dataOfMatrix[colIndex] == 2){
                let brickNode = SKSpriteNode(imageNamed: "brickType2.png")
                brickNode.position = CGPoint(x: 5 + (brickSize / 2) + brickSize * CGFloat(colIndex) + 5 * CGFloat(colIndex) , y: self.scene.size.height - (brickSize / 6) )
                brickNode.size = CGSize(width: brickSize, height: brickSize / 3)
                brickNode.physicsBody = SKPhysicsBody(rectangleOf: brickNode.size)
                brickNode.physicsBody?.isDynamic = false
                brickNode.physicsBody?.linearDamping = 0
                brickNode.physicsBody?.categoryBitMask = BitMask.brickType2Catelogy
                brickNode.physicsBody?.collisionBitMask = 1
                brickNode.physicsBody?.contactTestBitMask = BitMask.ballCatelogy
                
                self.scene.addChild(brickNode)
                
                topBricks.append(brickNode as! Brick)
            }
        }
    }
    
     func update(_ currentTime: TimeInterval) {
        if startTime == -1 {
            startTime = currentTime
            spawnTimeCount = currentTime
        }
        
        if (currentTime - spawnTimeCount) > spawnTime {
            for node in botBricks {
                node.run(.moveBy(x: 0, y: node.size.height, duration: 0.5))
            }
            for node in topBricks {
                node.run(.moveBy(x: 0, y: -( node.size.height), duration: 0.5))
            }
        }
    }
}
