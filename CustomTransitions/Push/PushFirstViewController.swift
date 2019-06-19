//
//  PushFirstViewController.swift
//  CustomTransitions
//
//  Created by JiangT on 2019/6/16.
//  Copyright © 2019 JiangT. All rights reserved.
//

import UIKit

class PushFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.delegate = self
    }
    

    @IBAction func pushClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PushSecondViewController")
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


extension PushFirstViewController: UINavigationControllerDelegate {
    //返回自定义过渡动画
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop && fromVC is PushFirstViewController {
            return nil
        }
        
        return NormalPushAnimator()
    }
}
