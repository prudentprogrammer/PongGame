//  PongView.swift

import SwiftUI

struct PaddleView: View {
    let paddle: Paddle
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: paddle.size.width, height: paddle.size.height)
            .position(paddle.position)
    }
}

struct BallView: View {
    let ball: Ball
    var body: some View {
        Circle()
            .fill(Color.yellow)
            .frame(width: ball.radius * 2, height: ball.radius * 2)
            .position(ball.position)
    }
}

struct PongView: View {
    @State private var game = PongState(
        leftPaddle: Paddle(position: .zero),
        rightPaddle: Paddle(position: .zero),
        ball: Ball(position: .zero,
                   velocity: CGVector(dx: 100, dy: 50),
                   radius: 8)
    )
    
    private let loop = GameLoop()

    var body: some View {
        GeometryReader { geo in
            let (W, H) = (geo.size.width, geo.size.height)
            let halfH = H / 2
            
            ZStack {
                Color.black.ignoresSafeArea()
                
                // center line
                Rectangle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 2, height: H)
                
                // paddles
                PaddleView(paddle: game.leftPaddle)
                PaddleView(paddle: game.rightPaddle)
                // ball
                BallView(ball: game.ball)
            }.onAppear {
                // initialize paddles and ball based on arena size
               game.leftPaddle.position = CGPoint(x: 30, y: halfH)
               game.rightPaddle.position = CGPoint(x: W - 30, y: halfH)
               game.ball.position = CGPoint(x: W / 2, y: halfH)
                loop.onTick =  { dt in
                    game.update(dt: dt, arenaSize: geo.size)
                }
                loop.start()
            }
            .onDisappear {
                loop.stop()
            }
        }
    }
}

