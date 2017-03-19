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
    let ball = SKSpriteNode(imageNamed: "ball.png")
    let paddle = SKSpriteNode(imageNamed: "paddle.png")
    var startTime : TimeInterval = -1
    
    override func didMove(to view: SKView) {
        addPaddle()
        addBall()
        addBrick(row: 4, col: 2)
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
        if let  firstTouch = touches.first {
            let location = firstTouch.location(in: self)
            
        }
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
    
    func addBall() -> Void {
        
        ball.anchorPoint = CGPoint(x: 0.5, y: 0)
        ball.size = CGSize(width: self.size.width * 0.05, height: self.size.width * 0.05)
//        ball.position = CGPoint(x: paddle.position.x , y: paddle.position.y + CGFloat(paddle.size.height * 0.5 ))
        ball.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 )
        
        ball.physicsBody = SKPhysicsBody(rectangleOf: ball.size)
        ball.physicsBody?.velocity = CGVector(dx: 300, dy: 300)
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.categoryBitMask = 2
        ball.physicsBody?.collisionBitMask = 1
        ball.physicsBody?.contactTestBitMask = 1
        
        addChild(ball)
    }
    
    func addPaddle() -> Void {
        let paddle = SKSpriteNode(imageNamed: "paddle.png")
        
        paddle.position = CGPoint(x: self.size.width / 2, y: 20)
        paddle.size = CGSize(width: self.size.width * 0.1, height: self.size.width * 0.05)
        
        paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
        paddle.physicsBody?.velocity = CGVector(dx: 50, dy: 0)
        paddle.physicsBody?.friction = 0
        paddle.physicsBody?.restitution = 1
        paddle.physicsBody?.allowsRotation = false
//        paddle.physicsBody?.isDynamic = false
        paddle.physicsBody?.linearDamping = 0
        paddle.physicsBody?.categoryBitMask = 4
        paddle.physicsBody?.collisionBitMask = 2
        paddle.physicsBody?.contactTestBitMask = 2
        
        addChild(paddle)
        
    }
    
    func addBrick(row : Int, col : Int) -> Void {
        for rowIndex in 0...row {
            for colIndex in 0...col {
                let brick = SKSpriteNode(imageNamed: "brick.png")
                
                brick.size = CGSize(width: self.size.width * 0.1, height: self.size.width * 0.1)
                brick.anchorPoint = CGPoint(x: 0, y: 1)
                brick.position = CGPoint(x: CGFloat((self.size.width - 50) / CGFloat(col)) * CGFloat(colIndex), y: self.size.height - brick.size.height * CGFloat(rowIndex))
                
                brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
                brick.physicsBody?.linearDamping = 0
                brick.physicsBody?.categoryBitMask = 1
                brick.physicsBody?.collisionBitMask = 2
                brick.physicsBody?.contactTestBitMask = 2
                
                addChild(brick)
                
            }
        }
        
    }
    
}
