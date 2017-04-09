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
    
    let ball = Ball(imageNamed: "ball.png")
    let paddle = Paddle(imageNamed: "paddle.png")
    let center = Center(imageNamed: "center.png")
    
    
    var startNode  : StartNode!
    
    
    
    
    var scoreLabel : UILabel!
    var highScoreLabel : UILabel!
    
    var score : Int = 0
    var highScore : Int = 0
       
    
    var startTime : TimeInterval = -1
    
    
    
    
    override func didMove(to view: SKView) {
        
        addPaddle()
        addBall()
        //addCenter()
        configPhysics()
        
        startNode = StartNode(scene: self)
        startNode.getBotBricks()
        startNode.getTopBricks()
        
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        
        scoreLabel = UILabel(frame: CGRect(x: self.size.width / 2, y: self.size.height / 2, width: 100, height: 20))
        scoreLabel.text = "\(score)"
        scoreLabel.textColor = UIColor.red
        self.view?.addSubview(scoreLabel)
//        
//        highScoreLabel = UILabel(frame: CGRect(x: self.size.width / 6 * 3, y: self.size.height - 20, width: 100, height: 20))
//        highScoreLabel.text = "Top : \(highScore)"
//        highScoreLabel.textColor = UIColor.blue
//        self.view?.addSubview(highScoreLabel)

    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        guard let nodeA = bodyA.node, let nodeB = bodyB.node else {
            return
        }
        
        if let contactDelegateA = nodeA as? ContactDelegate {
            contactDelegateA.didContact(other: nodeB)
        }
        
        if let contactDelegateB = nodeB as? ContactDelegate {
            contactDelegateB.didContact(other: nodeA)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let location = firstTouch.location(in: self)
            paddle.position.x = location.x
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
        ball.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ball.size = CGSize(width: self.size.width * 0.03, height: self.size.width * 0.03)
        ball.position = CGPoint(x: (self.size.width / 2), y: (self.size.height / 2) + paddle.size.height / 2 + ball.size.height / 2)
        ball.configPhysics()
        
        ball.run(.repeatForever(.rotate(byAngle: CGFloat(M_PI), duration: 0.1)))
        addChild(ball)
    }
    
    func addPaddle() -> Void {
        paddle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        paddle.size = CGSize(width: self.size.width * 0.2, height: self.size.width * 0.2)
        paddle.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        paddle.configPhysics()
        
        paddle.run(.repeatForever(.rotate(byAngle: CGFloat(M_PI), duration: 1)))
        
        addChild(paddle)
    }
    
    func addCenter() -> Void {
        center.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        center.position = paddle.position
        
        center.size = CGSize(width: self.size.width * 0.4 - 10, height: self.size.width * 0.4 - 10)
        
        addChild(center)
    }
    
}
