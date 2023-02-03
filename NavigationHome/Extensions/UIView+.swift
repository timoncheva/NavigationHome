//
//  UIView+.swift
//  NavigationHome
//
//  Created by Ella on 30.01.2023.
//

import UIKit

extension UIView {
    
    func shakeField(count: Float = 3, for duration: TimeInterval = 0.3, withTranslation translation: Float = 3) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shakeField")
    }
}
