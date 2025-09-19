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


