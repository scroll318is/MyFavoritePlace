//
//  MWAPageContentViewController.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/26/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import UIKit

class MWAPageContentViewController: UIViewController {
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var imageVC: UIImageView!
    
    var asset: Asset!
    var pageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageVC.image = UIImage(named:asset.imageName)
        descLabel.text = asset.description
        pageIndex = asset.index
        
        view.backgroundColor = UIColor.clearColor()
    }

}
