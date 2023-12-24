//
//  GroupAnimation.swift
//
//
//  Created by Dimas on 24/12/23.
//

import AppKit

public class GroupAnimation: BaseAnimation {
    private var animations: [AnimationModel] = []
    
    public func animateBackgroundColor(from startColor: NSColor, to endColor: NSColor) -> Self {
        animations.append(
            .init(
                keypath: .backgroundColor,
                fromValue: startColor.cgColor,
                toValue: endColor.cgColor
            )
        )
        return self
    }
    
    public func animateOpacity(from startOpacity: CGFloat, to endOpacity: CGFloat) -> Self {
        animations.append(
            .init(
                keypath: .opacity,
                fromValue: startOpacity,
                toValue: endOpacity
            )
        )
        return self
    }
    
    public func startAnimation() {
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = animations.map {
            let animation = CABasicAnimation(keyPath: $0.keypath.rawValue)
            animation.fromValue = $0.fromValue
            animation.toValue = $0.toValue
            animation.duration = duration
            return animation
        }
        
        animationGroup.duration = duration
        animationGroup.timingFunction = timingFunction.mediaTimingFunction
        animationGroup.delegate = delegate
        layer.add(animationGroup, forKey: UUID().uuidString)
    }
    
}

private struct AnimationModel {
    let keypath: Keypath
    let fromValue: Any
    let toValue: Any
}

enum Keypath: String {
    case backgroundColor
    case opacity
}
