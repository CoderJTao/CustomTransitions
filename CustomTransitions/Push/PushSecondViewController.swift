//
//  PushSecondViewController.swift
//  CustomTransitions
//
//  Created by JiangT on 2019/6/16.
//  Copyright © 2019 JiangT. All rights reserved.
//

import UIKit

class PushSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func popClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
