//
//  BackgroundColorAnimation.swift
//  Polyform
//
//  Created by Dimas on 24/12/23.
//

import AppKit

public class BackgroundColorAnimation: BaseAnimation, AnimationProtocol {
    
    typealias Value = NSColor
    
    var startValue: NSColor = .clear
    var endValue: NSColor = .clear
    
    public func animateChanges(from startValue: NSColor, to endValue: NSColor) -> Self {
        self.startValue = startValue
        self.endValue = endValue
        
        return self
    }
    
    @discardableResult
    public func startAnimation() -> Self {
        let animation = makeAnimation(
            with: "backgroundColor",
            from: startValue.cgColor,
            to: endValue.cgColor
        )
        
        layer.add(animation, forKey: UUID().uuidString)
        
        return self
    }
    
}
