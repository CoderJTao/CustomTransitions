//
//  TabbarController.swift
//  CustomTransitions
//
//  Created by JiangT on 2019/6/16.
//  Copyright © 2019 JiangT. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    private lazy var panGesture: UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGesture(sender:)))
        return pan
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        self.view.addGestureRecognizer(self.panGesture)
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer) {
        // Do not attempt to begin an interactive transition if one is already ongoing
        guard self.transitionCoordinator == nil else {
            return
        }
        
        if sender.state == .began || sender.state == .changed {
            beginInteractiveTransitionIfPossible(sender: sender)
        }
    }
    
    private func beginInteractiveTransitionIfPossible(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        if translation.x > 0 && self.selectedIndex > 0 {
            self.selectedIndex -= 1
        } else if translation.x < 0 && self.selectedIndex + 1 < self.viewControllers!.count {
            self.selectedIndex += 1
        } else {
            if !translation.equalTo(CGPoint.zero) {
                sender.isEnabled = false
                sender.isEnabled = true
            }
        }
        
        self.transitionCoordinator?.animate(alongsideTransition: nil, completion: { (context) in
            if context.isCancelled && sender.state == .changed {
                self.beginInteractiveTransitionIfPossible(sender: sender)
            }
        })
    }
}


extension TabbarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if self.selectedIndex == 0 {
            return TabbarAnimator(edge: .right)
        } else {
            return TabbarAnimator(edge: .left)
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if self.panGesture.state == .began || self.panGesture.state == .changed {
            return TabbarInteractionTransition(pan: self.panGesture)
        } else {
            return nil
        }
    }
}
