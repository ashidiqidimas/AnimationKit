//
//  AnimationDelegate.swift
//
//
//  Created by Dimas on 24/12/23.
//

import AppKit

public class AnimationDelegate: NSObject, CAAnimationDelegate {
    var onStart: (() -> Void)?
    var onComplete: (() -> Void)?
    var onCompleteWithParams: ((CAAnimation, Bool) -> Void)?
    
    public func animationDidStart(_ anim: CAAnimation) {
        onStart?()
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if onCompleteWithParams != nil && onComplete != nil {
            SharedLogger.warning("Both onComplete and onCompleteWithParams are set. onCompleteWithParams will take precedence..")
        }
        
        onCompleteWithParams?(anim, flag)
        onComplete?()
    }
}
