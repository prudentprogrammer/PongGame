//
//  GameView.swift
//  PongGame
//
//  Created by Arjun Bharadwaj on 9/19/25.
//
import UIKit
import SwiftUI

struct GameView : View {
    var body: some View {
        GeometryReader { geo in
            let (W, H) = (geo.size.width, geo.size.height)
            let (halfW, halfH) = (W / 2, H / 2)
            ZStack {
                Color.black.ignoresSafeArea()
                
                // center line
                Rectangle().fill(.white.opacity(0.2)).frame(width: 2)
                
                // paddles
                Rectangle().fill(.white).frame(width: 16, height: 100).offset(x: -halfW + 30, y: 0)
                Rectangle().fill(.white).frame(width: 16, height: 100).offset(x: halfW - 30, y: 0)
                
                // ball
                Circle().fill(.white).frame(width: 18, height: 18).offset(x: 0, y: 0)
            }
        }
    }
}
