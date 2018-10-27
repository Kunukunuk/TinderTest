//
//  ProfileViewController.swift
//  TinderTest
//
//  Created by Kun Huang on 10/26/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var personImageView: UIImageView!
    var profileImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let image = profileImage {
            personImageView.image = image
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
