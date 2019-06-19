//
//  LottieFirstViewController.swift
//  TestLottie
//
//  Created by 江涛 on 2019/6/19.
//  Copyright © 2019 江涛. All rights reserved.
//

import UIKit
import Lottie

class LottieFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func presentClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LottieSecondViewController")
        
        vc?.transitioningDelegate = self
        
        self.present(vc!, animated: true) {}
    }
}

extension LottieFirstViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let transitionController = LOTAnimationTransitionController(animationNamed: "Count",
                                                                    fromLayerNamed: "",
                                                                    toLayerNamed: "",
                                                                    applyAnimationTransform: false)
        return transitionController
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transitionController = LOTAnimationTransitionController(animationNamed: "Three",
                                                                    fromLayerNamed: "",
                                                                    toLayerNamed: "",
                                                                    applyAnimationTransform: false)
        return transitionController
    }
}
