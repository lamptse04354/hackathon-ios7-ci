//
//  Invisible.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 4/8/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation

import SpriteKit

class InvisiblePaddle: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    func configPhysics() -> Void{
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width)
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.categoryBitMask = BitMask.InvisiblePaddleCatelogy
        self.physicsBody?.contactTestBitMask = BitMask.paddleCatelogy
        
    }
}
