//
//  BaseAnimation.swift
//
//
//  Created by Dimas on 24/12/23.
//

import AppKit

public class BaseAnimation {
    
    public let layer: CALayer
    
    internal let delegate = AnimationDelegate()
    internal var duration: TimeInterval = defaultAnimationConfig.duration
    internal var timingFunction: TimingFunction = defaultAnimationConfig.timingFunction
    
    public init(for layer: CALayer) {
        self.layer = layer
    }
    
    public convenience init(for view: NSView) {
        if let layer = view.layer {
            self.init(for: layer)
        } else {
            view.wantsLayer = true
            self.init(for: view.layer!)
        }
    }
    
    public func duration(inSeconds duration: TimeInterval) -> Self {
        self.duration = duration
        return self
    }
    
    public func timingFunction(_ timingFunction: TimingFunction) -> Self {
        self.timingFunction = timingFunction
        return self
    }
    
    internal func makeAnimation(
        with keyPath: String,
        from startValue: Any,
        to endValue: Any
    ) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: keyPath)
        animation.delegate = delegate
        animation.duration = duration
        animation.timingFunction = timingFunction.mediaTimingFunction
        animation.fromValue = startValue
        animation.toValue = endValue
        return animation
    }
    
    public func onStart(_ startBlock: @escaping () -> Void) -> Self {
        delegate.onStart = startBlock
        return self
    }
    
    @discardableResult
    public func onComplete(_ completionBlock: @escaping () -> Void) -> Self {
        delegate.onComplete = completionBlock
        return self
    }
    
    @discardableResult
    public func onComplete(
        _ completionBlock: @escaping (CAAnimation, Bool) -> Void
    ) -> Self {
        delegate.onCompleteWithParams = completionBlock
        return self
    }
    
}
