//  GameLoop.swift

import QuartzCore

public final class GameLoop {
    private var displayLink: CADisplayLink?
    
    
    public init() {}
    
    public func start() {
        displayLink = CADisplayLink(target: self, selector: #selector(step))
        displayLink?.add(to: .main, forMode: .common)
    }
    
    public func stop() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    @objc func step(link: CADisplayLink) {
        print("Timestamp = \(link.timestamp)")
    }
}

