//
//  TabbarAnimator.swift
//  CustomTransitions
//
//  Created by JiangT on 2019/6/16.
//  Copyright © 2019 JiangT. All rights reserved.
//

import UIKit

class TabbarAnimator: NSObject {
    var targetEdge: UIRectEdge
    
    init(edge: UIRectEdge) {
        self.targetEdge = edge
    }
}

extension TabbarAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) {
            
            let oneView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            let twoView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            
            let fromView = (oneView != nil ? oneView : fromVC.view)!
            let toView = (twoView != nil ? twoView : toVC.view)!
            
            let containerView = transitionContext.containerView
            
            let fromFrame = transitionContext.initialFrame(for: fromVC)
            let toFrame = transitionContext.finalFrame(for: toVC)
            
            var offset: CGVector
            if self.targetEdge == UIRectEdge.left {
                offset = CGVector(dx: -1.0, dy: 0)
            } else {
                offset = CGVector(dx: 1.0, dy: 0.0)
            }
            
            fromView.frame = fromFrame
            toView.frame = toFrame.offsetBy(dx: toFrame.size.width * offset.dx, dy: 0)
            
            containerView.addSubview(toView)
            
            let transitionDuration = self.transitionDuration(using: transitionContext)
            
            UIView.animate(withDuration: transitionDuration, animations: {
                fromView.frame = fromFrame.offsetBy(dx: fromFrame.size.width * offset.dx * -1, dy: 0)
                toView.frame = toFrame
            }) { (finished) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}
