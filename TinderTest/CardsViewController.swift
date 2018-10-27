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
        let translation = sender.translation(in: view)

        if sender.state == .began {
            if translation.x > 0 {
                if location.y < cardInitialCenter.y {
                    cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(10 * Double.pi / 180))
                } else {
                    cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(-10 * Double.pi / 180))
                }
            } else {
                if location.y < cardInitialCenter.y {
                    cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(-10 * Double.pi / 180))
                } else {
                    cardImageView.transform = cardImageView.transform.rotated(by: CGFloat(10 * Double.pi / 180))
                }
            }
        } else if sender.state == .changed {
            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
            print("Gesture is changing")
        } else if sender.state == .ended {
            
            animateOffScreen(xValue: translation.x)
            print("Gesture ended")
        }
        
    }
    
    func animateOffScreen(xValue: CGFloat) {
        
        if xValue > 50 {
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                self.cardImageView.transform = CGAffineTransform(translationX: self.cardImageView.center.x + 200, y: self.cardImageView.center.y)
            }, completion: nil)
        } else if xValue < 50 {
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                self.cardImageView.transform = CGAffineTransform(translationX: self.cardImageView.center.x - 200, y: self.cardImageView.center.y)
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                self.cardImageView.transform = .identity
            }, completion: nil)
        }
        
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        performSegue(withIdentifier: "profileview", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileview" {
            let destinationVC = segue.destination as! ProfileViewController
            destinationVC.profileImage = cardImageView.image
        }
    }

}
