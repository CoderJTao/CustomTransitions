//
//  PresentFirstViewController.swift
//  CustomTransitions
//
//  Created by JiangT on 2019/6/16.
//  Copyright © 2019 JiangT. All rights reserved.
//

import UIKit

class PresentFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func presentClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PresentSecondViewController")
        
        vc?.modalPresentationStyle = .fullScreen
        
        vc?.transitioningDelegate = self
        
        self.present(vc!, animated: true) {}
    }
}

extension PresentFirstViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return NormalPresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return NormalPresentAnimator()
    }
}
