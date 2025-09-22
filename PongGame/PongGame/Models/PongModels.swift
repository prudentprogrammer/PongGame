//  PongModels.swift
import CoreGraphics

// A Paddle will have a position and size
public struct Paddle {
    var position: CGPoint
    let size = CGSize(width: 20, height: 100)
}

// A Ball will have a position, velocity, and a radius
public struct Ball {
    public var position: CGPoint
    public var velocity: CGVector
    public var radius: CGFloat = 8
}

public struct PongState {
    public var leftPaddle: Paddle
    public var rightPaddle: Paddle
    public var ball: Ball
}

public extension PongState {
    mutating func update(dt: Double, arenaSize: CGSize) {
        // distance = velocity * time
        let (newVelocityX, newVelocityY) = (ball.velocity.dx * dt, ball.velocity.dy * dt)
        ball.position.x += newVelocityX
        ball.position.y += newVelocityY
        
        if ball.position.y - ball.radius < 0 || ball.position.y + ball.radius > arenaSize.height {
            ball.velocity.dy *= -1
        }
    }
}

