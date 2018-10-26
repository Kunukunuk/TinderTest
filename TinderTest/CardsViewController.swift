//
//  CardsViewController.swift
//  TinderTest
//
//  Created by Kun Huang on 10/24/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "nav_bar")
        let imageView = UIImageView(image: image)
        self.navigationItem.titleView = imageView
        
        cardInitialCenter = cardImageView.center
        
    }
    
    @IBAction func panImage(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        
        if sender.state == .began {
            print("Gesture began")
        } else if sender.state == .changed {
            cardImageView.center = location
            print("Gesture is changing")
        } else if sender.state == .ended {
            
            print("translation: \(translation)")
            if velocity.x > 0 {
                
                if translation.x > 50 {
                    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                        self.cardImageView.transform = CGAffineTransform(translationX: self.cardImageView.center.x + 200, y: self.cardImageView.center.y)
                    }, completion: nil)
                } else if translation.x < 50 {
                    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                        self.cardImageView.transform = CGAffineTransform(translationX: self.cardImageView.center.x - 200, y: self.cardImageView.center.y)
                    }, completion: nil)
                } else {
                    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                        self.cardImageView.transform = .identity
                    }, completion: nil)
                }
                if location.y < cardInitialCenter.y {
                    cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(45 * Double.pi / 180))
                } else {
                    cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(-45 * Double.pi / 180))
                }
            } else {
                if location.y > cardInitialCenter.y {
                    cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(45 * Double.pi / 180))
                } else {
                    cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(-45 * Double.pi / 180))
                }
            }
            print("Gesture ended")
        }
        
    }
    
    
    @IBAction func buttonTap(_ sender: UIButton) {
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
