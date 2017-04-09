//
//  Paddle.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 3/29/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation

import SpriteKit

class Paddle: SKSpriteNode {
    
    let paddleTexture = SKTexture(imageNamed: "paddle")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        configPhysics()
    }
    
    func configPhysics() -> Void {
        
        self.physicsBody = SKPhysicsBody(texture: paddleTexture, size: self.size)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.linearDamping = 0
    }
}
