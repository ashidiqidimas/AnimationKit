//
//  AnimationProtocol.swift
//
//
//  Created by Dimas on 24/12/23.
//

import AppKit

protocol AnimationProtocol {
    associatedtype Value
    
    var startValue: Value { get }
    var endValue: Value { get }
    
    func animateChanges(from startValue: Value, to endValue: Value) -> Self
    func startAnimation() -> Self
}
