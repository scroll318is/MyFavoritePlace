//
//  SecondViewController.swift
//  MyFavoritePlace
//
//  Created by Stoyan Yordanov Kostov on 10/28/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var blrView: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        blrView.layer.cornerRadius = 25.0
    }

}

