//
//  GameScene.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 3/18/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    let center = SKSpriteNode(imageNamed: "center.png")
    let ball = SKSpriteNode(imageNamed: "ball.png")
    let paddle = SKSpriteNode(imageNamed: "paddle.png")
    var rolSpeed : CGFloat = 100
    
    var startTime : TimeInterval = -1
    
    override func didMove(to view: SKView) {
        addCenter()
        addPaddle(speed: rolSpeed)
        addBall()
        addBrick(row: 4, col: 4)
        configPhysics()
        
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        guard let nodeA = bodyA.node, let nodeB = bodyB.node else {
            return
        }
        
        if (bodyA.categoryBitMask | bodyB.categoryBitMask == 3) {
            if bodyA.categoryBitMask == 1 {
                nodeA.removeFromParent()
            }else{
                nodeB.removeFromParent()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        rolSpeed = -rolSpeed
    }
    
    override func update(_ currentTime: TimeInterval) {
        if startTime == -1 {
            startTime = currentTime
        }
    }
    
    func configPhysics() -> Void {
        self.physicsWorld.gravity = CGVector(dx : 0, dy : 0)
        self.physicsWorld.contactDelegate = self
    }
    
    func addCenter() -> Void {
        center.size = CGSize(width: self.size.width * 0.4, height: self.size.width * 0.4)
        center.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        center.physicsBody = SKPhysicsBody(rectangleOf: center.size)
        
        addChild(center)
    }
    
    func addBall() -> Void {
        
        ball.anchorPoint = CGPoint(x: 0.5, y: 0)
        ball.size = CGSize(width: self.size.width * 0.05, height: self.size.width * 0.05)
        //        ball.position = CGPoint(x: paddle.position.x , y: paddle.position.y + CGFloat(paddle.size.height * 0.5 ))
        ball.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 )
        
        ball.physicsBody = SKPhysicsBody(rectangleOf: ball.size)
        ball.physicsBody?.velocity = CGVector(dx: 100, dy: 100)
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.categoryBitMask = 2
        ball.physicsBody?.collisionBitMask = 1
        ball.physicsBody?.contactTestBitMask = 1
        
        addChild(ball)
    }
    
    func addPaddle(speed : CGFloat) -> Void {
        let paddle = SKSpriteNode(imageNamed: "paddle.png")
        let circleRect = CGRect(origin: center.position, size: center.size)
        
        paddle.position = CGPoint(x: center.position.x, y: center.position.y + CGFloat(center.size.height / 2))
        paddle.size = CGSize(width: self.size.width * 0.1, height: self.size.width * 0.05)
        
        paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
        paddle.physicsBody?.velocity = CGVector(dx: 50, dy: 0)
        paddle.physicsBody?.isDynamic = false
        paddle.physicsBody?.linearDamping = 0
        paddle.physicsBody?.categoryBitMask = 4
        paddle.physicsBody?.collisionBitMask = 2
        paddle.physicsBody?.contactTestBitMask = 2
        //        paddle.run(SKAction.follow(circle as! CGPath, speed: 100))
        
        addChild(paddle)
        
    }
    
    func addBrick(row : Int, col : Int) -> Void {
        let brickSizeX = self.size.width * 0.2
        let brickSizeY = self.size.width * 0.1
        
        for rowIndex in 0...row {
            for colIndex in 0...col {
                let brick = SKSpriteNode(imageNamed: "brick.png")
                brick.size = CGSize(width: brickSizeX, height: brickSizeY)
                brick.anchorPoint = CGPoint(x: 0, y: 1)
                brick.position = CGPoint(x: brickSizeX * CGFloat(colIndex), y: self.size.height - (brickSizeY * CGFloat(rowIndex) ))
                
                brick.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: brickSizeX * 1.5 , height: brickSizeY * 1.5))
                brick.physicsBody?.isDynamic = false
                brick.physicsBody?.linearDamping = 0
                brick.physicsBody?.categoryBitMask = 1
                brick.physicsBody?.collisionBitMask = 2
                brick.physicsBody?.contactTestBitMask = 2
                
                addChild(brick)
                
            }
        }
        
    }
    
}
