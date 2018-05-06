//
//  FirstViewController.swift
//  AmericanTop40
//
//  Created by Mustafa Tunc on 10/23/17.
//  Copyright © 2017 Mustafa Tunc. All rights reserved.
//

import UIKit

class HomeTabController: UIViewController {

    
    @IBOutlet weak var slideShowView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var images = [UIImage]()
        images.append( UIImage(named:"slideShow/img1.png")!)
        images.append( UIImage(named:"slideShow/img2.jpg")!)
        images.append( UIImage(named:"slideShow/img3.jpg")!)
        images.append( UIImage(named:"slideShow/img4.jpg")!)
        images.append( UIImage(named:"slideShow/img5.jpg")!)
        
        slideShowView.animationImages = images
        slideShowView.animationDuration = Double(images.count)*5
        slideShowView.animationRepeatCount = 0
        slideShowView.startAnimating()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

