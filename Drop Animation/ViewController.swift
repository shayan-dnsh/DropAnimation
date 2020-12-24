//
//  ViewController.swift
//  Drop Animation
//
//  Created by shayan amindaneshpour on 12/24/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var circleButton: CircleButton!
    
    @IBOutlet weak var storyButton: RoundedButton!
    @IBOutlet weak var placeButton: RoundedButton!
    @IBOutlet weak var activityButton: RoundedButton!
    
    @IBOutlet weak var activityWidthConst: NSLayoutConstraint!
    @IBOutlet weak var storyWidthConst: NSLayoutConstraint!
    @IBOutlet weak var placeWidthConst: NSLayoutConstraint!
    
    @IBOutlet weak var storyDistanceFromCircleButtonConst: NSLayoutConstraint!
    @IBOutlet weak var placeDistanceFromCircleButtonConst: NSLayoutConstraint!
    @IBOutlet weak var activityDistanceFromCircleButtonConst: NSLayoutConstraint!
    
    var isMidleOfAnimating = false
    
    var buttonCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonsBorder()
        startAnimating()
        
    }
    
    
    @IBAction func animateButton(_ sender: CircleButton) {
        DispatchQueue.main.async {
            if !self.isMidleOfAnimating {
                self.startAnimating()
            }
        }
        
    }
    
    
    fileprivate func startAnimating() {
        self.isMidleOfAnimating = true
        let transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 4))
        UIView.animate(withDuration: 0.3, delay: 0.5, options: [.curveLinear], animations: {
            self.circleButton.transform = transform
        }, completion: nil)
        
        performAnimations(button: placeButton, buttonWidthConst: placeWidthConst, distanceFromCircleButton: placeDistanceFromCircleButtonConst.constant, titleAfterAnimating: "Place", delay: 0.5, duration: 0.1)
        
        performAnimations(button: activityButton, buttonWidthConst: activityWidthConst, distanceFromCircleButton: activityDistanceFromCircleButtonConst.constant, titleAfterAnimating: "Activity", delay: 0.6, duration: 0.2)
        
        performAnimations(button: storyButton, buttonWidthConst: storyWidthConst, distanceFromCircleButton: storyDistanceFromCircleButtonConst.constant, titleAfterAnimating: "Story", delay: 0.7, duration: 0.3)
    }
    
    fileprivate func setButtonsBorder() {
        self.storyButton.layer.cornerRadius = self.storyWidthConst.constant / 2
        self.placeButton.layer.cornerRadius = self.placeWidthConst.constant / 2
        self.activityButton.layer.cornerRadius = self.activityWidthConst.constant / 2
    }
    
    fileprivate func performAnimations(button: UIButton, buttonWidthConst: NSLayoutConstraint, distanceFromCircleButton: CGFloat, titleAfterAnimating: String, delay: TimeInterval, duration: TimeInterval) {
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseInOut, animations: {
            button.frame.origin.y += (distanceFromCircleButton + buttonWidthConst.constant)
            button.layoutIfNeeded()
        }) { _ in
            self.setupButtons(button: button, title: titleAfterAnimating, buttonWidthConst: buttonWidthConst)
        }
    }
    
    fileprivate func setupButtons(button: UIButton, title: String, buttonWidthConst: NSLayoutConstraint){
        UIView.animate(withDuration: 1.0, delay: 1.0, animations: {
            buttonWidthConst.constant = 100
        }) { _ in
            self.buttonCount += 1
            button.layer.cornerRadius = 10
            button.setTitle(title, for: .normal)
            if self.buttonCount == 3 {
                self.buttonCount = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.resetButtonToOval()
                }
            }
        }
    }
    
    fileprivate func resetButtonToOval() {
        UIView.animate(withDuration: 0.0, delay: 0.0, options: .curveLinear, animations: {
            self.storyButton.layer.cornerRadius = 15
            self.storyWidthConst.constant = 30
            self.storyButton.setTitle("", for: .normal)
        }) { _ in
            UIView.animate(withDuration: 0.0, delay: 0.1, options: .curveLinear, animations: {
                self.activityButton.layer.cornerRadius = 15
                self.activityWidthConst.constant = 30
                self.activityButton.setTitle("", for: .normal)
            }) { _ in
                UIView.animate(withDuration: 0.0, delay: 0.0, options: .curveLinear, animations: {
                    self.placeButton.layer.cornerRadius = 15
                    self.placeWidthConst.constant = 30
                    self.placeButton.setTitle("", for: .normal)
                }) { _ in
                    
                    self.storyButton.translatesAutoresizingMaskIntoConstraints    = false
                    self.activityButton.translatesAutoresizingMaskIntoConstraints = false
                    self.placeButton.translatesAutoresizingMaskIntoConstraints    = false
                    self.backToPreviousPositoin()
                }
            }
        }
        
    }
    
    fileprivate func backToPreviousPositoin() {
        let transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [.curveLinear], animations: {
            self.circleButton.transform = transform
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.9, options: .curveEaseOut, animations: {
            self.storyButton.center = self.view.center
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.9, options: .curveEaseOut, animations: {
                self.activityButton.center  = self.view.center
            }) { _ in
                UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.9, options: .curveEaseOut, animations: {
                    self.placeButton.center = self.view.center
                }) { _ in
                    
                    self.isMidleOfAnimating = false
                }
            }
        }
        
    }


}

