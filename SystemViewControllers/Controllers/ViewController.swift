//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Dylan Williamson on 12/27/18.
//  Copyright © 2018 Dylan Williamson. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, MFMailComposeViewControllerDelegate {
    
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
    // MARK: - Activity Controller
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        // Unwrap the imageView's image
        guard let image = imageView.image else { return }
        
        // Create instance of UIActivityViewController
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        // Place popover over button that triggered the presentation(for iPads)
        activityController.popoverPresentationController?.sourceView = sender
        
        // Present activityController to user
        present(activityController, animated: true, completion: nil)
    }
    
    // MARK: - Safari View Controller
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        // Create URL from string
        if let url = URL(string: "http://www.apple.com") {
            
            // Create instance of SFSafariViewController
            let safariViewController = SFSafariViewController(url: url)
            
            // Present safariViewController to user
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIAlert and UIImagePicker Controller
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        // Create instance of UIImagePickerController
        let imagePicker = UIImagePickerController()
        
        // Set viewController as the delegate
        imagePicker.delegate = self
        
        // Create instance of UIAlertController
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        // Create cancel UIAlertAction object
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        // Add UIAlertAction object to alertController
        alertController.addAction(cancelAction)
        
        // Create camera UIAlertAction object if source is available
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
                // Set source type to camera
                imagePicker.sourceType = .camera
                // Present imagePickerController to user
                self.present(imagePicker, animated: true, completion: nil)
            }
            // Add UIAlert action object to alertController
            alertController.addAction(cameraAction)
        }
        
        
        // Create photo library UIAlertAction object if source is available
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (UIAlertAction) in
                // Set source type to photo library
                imagePicker.sourceType = .photoLibrary
                // Present imagePicker to user
                self.present(imagePicker, animated: true, completion: nil)
            }
            // Add UIAlertAction object to alert Controller
            alertController.addAction(photoLibraryAction)
        }
        
        // Place popover over button that triggered the presentation(for iPads)
        alertController.popoverPresentationController?.sourceView = sender
        
        // present alertController to user
        present(alertController, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - MFMailComposeViewController
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        // Check if user's device can send email
        guard MFMailComposeViewController.canSendMail() else { return }
        
        // Create MFMailViewController instance
        let mailComposer = MFMailComposeViewController()
        // Set viewController as delegate
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["example@example.com"])
        mailComposer.setSubject("Look at this")
        mailComposer.setMessageBody("Hello, this is an email from the app I made.", isHTML: false)
        
        present(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
}


