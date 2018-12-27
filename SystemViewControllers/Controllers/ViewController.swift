//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Dylan Williamson on 12/27/18.
//  Copyright © 2018 Dylan Williamson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var safariButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.layer.borderWidth = 1
        shareButton.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        shareButton.layer.cornerRadius = 1
        safariButton.layer.borderWidth = 1
        safariButton.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        safariButton.layer.cornerRadius = 1
        cameraButton.layer.borderWidth = 1
        cameraButton.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        cameraButton.layer.cornerRadius = 1
        emailButton.layer.borderWidth = 1
        emailButton.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        emailButton.layer.cornerRadius = 1
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
    }
    
    @IBAction func emailButtonTapped(_ sender: Any) {
    }
    
}


