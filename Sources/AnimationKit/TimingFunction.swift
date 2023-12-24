//
//  TimingFunction.swift
//
//
//  Created by Dimas on 24/12/23.
//

import AppKit

public enum TimingFunction {
    case `default`
    case linear
    case easeIn
    case easeOut
    case easeInEaseOut
    case custom(c1x: Float, c1y: Float, c2x: Float, c2y: Float)
    
   public var mediaTimingFunction: CAMediaTimingFunction {
        switch self {
        case.default:
            return CAMediaTimingFunction(name: .default)
        case .linear:
            return CAMediaTimingFunction(name: .linear)
        case .easeIn:
            return CAMediaTimingFunction(name: .easeIn)
        case .easeOut:
            return CAMediaTimingFunction(name: .easeOut)
        case .easeInEaseOut:
            return CAMediaTimingFunction(name: .easeInEaseOut)
        case .custom(let c1x, let c1y, let c2x, let c2y):
            return CAMediaTimingFunction(controlPoints: c1x, c1y, c2x, c2y)
        }
    }
}
