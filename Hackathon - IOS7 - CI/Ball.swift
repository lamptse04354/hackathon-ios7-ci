//
//  self.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 3/29/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation

import SpriteKit

class Ball: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        configPhysics()
    }
    
    func configPhysics() -> Void{
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width / 2)
        self.physicsBody?.friction = 0
        self.physicsBody?.restitution = 1
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.velocity = CGVector(dx: 100, dy: 100)
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.categoryBitMask = BitMask.ballCatelogy
        self.physicsBody?.collisionBitMask = 2
        self.physicsBody?.contactTestBitMask = BitMask.paddleCatelogy
        
    }
    
    
}
