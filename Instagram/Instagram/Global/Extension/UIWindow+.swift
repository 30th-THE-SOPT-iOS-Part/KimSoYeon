//
//  UIViewController+.swift
//  Instagram
//
//  Created by 소연 on 2022/04/22.
//

import UIKit

extension UIWindow {
    func switchRootViewController(_ viewController: UIViewController,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.2,
                                  options: AnimationOptions = .transitionCrossDissolve,
                                  completion: (() -> Void)? = nil) {
        guard animated else {
            rootViewController = viewController
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }
    
    // async/await APIs 사용 ⬇️
    @MainActor
    func replaceRootViewController(_ newRootViewController: UIViewController, animated: Bool = true) async {
        guard animated else {
            rootViewController = newRootViewController
            return
        }
        
        await withCheckedContinuation({ (continuation: CheckedContinuation<Void, Never>) in
            UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve) {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                self.rootViewController = newRootViewController
                UIView.setAnimationsEnabled(oldState)
            } completion: { _ in
                continuation.resume()
            }
        })
    }
}
