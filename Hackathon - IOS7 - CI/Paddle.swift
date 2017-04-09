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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        configPhysics()
    }
    
    func configPhysics() -> Void {
        let path = UIBezierPath(arcCenter: self.anchorPoint, radius: self.size.width, startAngle: 4 * CGFloat(M_PI) / 3, endAngle: 5 * CGFloat(M_PI) / 3, clockwise: false)
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.linearDamping = 0
    }
}
