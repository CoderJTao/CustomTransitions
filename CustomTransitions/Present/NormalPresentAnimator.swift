//
//  NormalPresentAnimator.swift
//  CustomTransitions
//
//  Created by JiangT on 2019/6/16.
//  Copyright © 2019 JiangT. All rights reserved.
//

import Foundation
import UIKit

class NormalPresentAnimator: NSObject {
    
}

extension NormalPresentAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) {
            
            let oneView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            let twoView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            
            let fromView = (oneView != nil ? oneView : fromVC.view)!
            let toView = (twoView != nil ? twoView : toVC.view)!
            
            let containerView = transitionContext.containerView
            
            fromView.frame = transitionContext.initialFrame(for: fromVC)
            toView.frame = transitionContext.finalFrame(for: toVC)
            
            fromView.alpha = 1.0
            toView.alpha = 0.0
            
            containerView.addSubview(toView)
            
            let transitionDuration = self.transitionDuration(using: transitionContext)
            
            UIView.animate(withDuration: transitionDuration, animations: {
                fromView.alpha = 0.0
                toView.alpha = 1.0
            }) { (finished) in
                let wasCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!wasCancelled)
            }
        }
    }
}

