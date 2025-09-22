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
        // 1. Move ball
        ball.position.x += ball.velocity.dx * dt
        ball.position.y += ball.velocity.dy * dt

        // 2. Bounce top/bottom
        if ball.position.y - ball.radius < 0 || ball.position.y + ball.radius > arenaSize.height {
            ball.velocity.dy *= -1
        }

        // 3. Paddle collisions
        let leftRect = CGRect(
            x: leftPaddle.position.x - leftPaddle.size.width/2,
            y: leftPaddle.position.y - leftPaddle.size.height/2,
            width: leftPaddle.size.width,
            height: leftPaddle.size.height
        )
        if leftRect.contains(ball.position) {
            ball.velocity.dx = abs(ball.velocity.dx) // bounce right
        }

        let rightRect = CGRect(
            x: rightPaddle.position.x - rightPaddle.size.width/2,
            y: rightPaddle.position.y - rightPaddle.size.height/2,
            width: rightPaddle.size.width,
            height: rightPaddle.size.height
        )
        if rightRect.contains(ball.position) {
            ball.velocity.dx = -abs(ball.velocity.dx) // bounce left
        }

        // 4. Scoring (ball passes paddles)
        if ball.position.x - ball.radius < 0 || ball.position.x + ball.radius > arenaSize.width {
            ball.position = CGPoint(x: arenaSize.width/2, y: arenaSize.height/2)
            ball.velocity.dx *= -1
        }
    }
}


