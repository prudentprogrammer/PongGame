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
        ZStack {
            Color.black.ignoresSafeArea()
            
            // Draw the circle
            Circle().fill(Color.white).frame(width: 20, height: 20)
        }
    }
}
