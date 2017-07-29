//
//  DetailViewController.swift
//  Project3
//
//  Created by Shaun Duffus on 2017-07-11.
//  Copyright © 2017 DuffCo. All rights reserved.
//

import UIKit
import Social


class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
    if let imageToLoad = selectedImage {
        imageView.image = UIImage(named: imageToLoad)
        }
    }


        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
   
    // ** shareTapped used to send photos via AirDrop, post to Twitter, and much more.
     func shareTapped() {
            // let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
            // vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            // present(vc, animated: true)
    
    // SLComposerViewController is designed to post to social networks like Facebook and Twitter.
    
    if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
        vc.setInitialText("Look at this great picture")
        vc.add(imageView.image!)
        vc.add(URL(string: "http://www.photolib.noaa.gov/nss1"))
        present(vc, animated: true)
    
    if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
            vc.setInitialText("Look at this great picture")
            vc.add(imageView.image!)
            vc.add(URL(string: "http://www.photolib.noaa.gov/nss1"))
            present(vc, animated: true)
        
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
