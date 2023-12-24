//
//  ScaleAnimation.swift
//
//
//  Created by Dimas on 24/12/23.
//

import AppKit

public class ScaleAnimation: BaseAnimation {
    private var startScale = Scale(x: 0.5, y: 0.5)
    private var endScale = Scale(x: 1, y: 1)
    
    public struct Scale {
        public let x: CGFloat
        public let y: CGFloat
        
        public static let identity = Scale(x: 1, y: 1)
        
        public init(x: CGFloat, y: CGFloat) {
            self.x = x
            self.y = y
        }
    }
    
    public func animateChanges(from startScale: Scale, to endScale: Scale) -> Self {
        self.startScale = startScale
        self.endScale = endScale
        return self
    }
 
    @discardableResult
    public func startAnimation() -> Self {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.delegate = delegate
        
        let layerWidth = layer.frame.width
        let startWidth = layerWidth * startScale.x
        let endWidth = layerWidth * endScale.x
        
        let layerHeight = layer.frame.height
        let startHeight = layerHeight * startScale.y
        let endHeight = layerHeight * endScale.y
        
        var startTransformation = CATransform3DMakeScale(
            startScale.x,
            startScale.y,
            1
        )
        
        var endTransformation = CATransform3DMakeScale(
            endScale.x,
            endScale.y,
            1
        )
        
        if startWidth <= endWidth && startHeight <= endHeight{
            startTransformation = CATransform3DTranslate(
                startTransformation,
                (endWidth - startWidth) / 2,
                (endHeight - startHeight) / 2,
                0
            )
            
            endTransformation = CATransform3DTranslate(
                endTransformation,
                (layerWidth - endWidth) / 2,
                (layerHeight - endHeight) / 2,
                0
            )
        }
        
        animation.fromValue = startTransformation
        animation.toValue = endTransformation
        animation.duration = duration
        
        layer.add(animation, forKey: UUID().uuidString)
        return self
    }
    
}
