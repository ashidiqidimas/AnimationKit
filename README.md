# AnimationKit

AnimationKit is a wrapper for Core Animation that focus on safety and developer experience.

```swift
BackgroundColorAnimation(for: dragLabelView)
    .animateChanges(from: .clear, to: .systemRed)
    .timingFunction(.easeOut)
    .duration(inSeconds: 0.15)
    .onComplete {
        print("Animating background has finished!")
    }
    .startAnimation()
```

It uses chainable syntax to make it easier to create animations.
You can even run code when the animation is finished without using a delegate.

## Disclaimer
I created this package for my own needs when I'm working with AppKit in macOS.
So this package may not suitable for your needs. I will only update this package
as needed according to my needs.
