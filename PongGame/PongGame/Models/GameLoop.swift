//  GameLoop.swift

import QuartzCore

public final class GameLoop {
    private var displayLink: CADisplayLink?
    private var lastTimestamp: CFTimeInterval = 0
    public var onTick: (Double) -> Void = { _ in }
    
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
        if lastTimestamp == 0 { lastTimestamp = link.timestamp }
        let dt = link.timestamp - lastTimestamp
        lastTimestamp = link.timestamp
        onTick(dt)
        //print("Last Timestamp = \(dt)")
    }
}

