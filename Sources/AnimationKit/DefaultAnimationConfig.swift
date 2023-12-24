//
//  DefaultAnimationConfig.swift
//
//
//  Created by Dimas on 24/12/23.
//

import AppKit

public var defaultAnimationConfig = DefaultAnimationConfig()

public struct DefaultAnimationConfig {
    public var duration: TimeInterval = 0.15
    public var timingFunction: TimingFunction = .default
}
