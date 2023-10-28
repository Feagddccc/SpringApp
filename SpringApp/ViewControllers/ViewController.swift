//
//  ViewController.swift
//  SpringApp
//
//  Created by Андрей Платунов on 26.10.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

// MARK: - IBOutlet
    @IBOutlet weak var animationView: SpringView! 
    @IBOutlet weak var animationLabel: SpringLabel! {
        didSet {
            animationLabel.text = animation.description
        }
    }
    
// MARK: - Privat properties
    private var animation = Animation.getRandomAnimation()
    
// MARK: - IBAction
    @IBAction func animationButtonPressed(_ sender: UIButton) {
        setAnimationToLabel()
        
        animationView.animation = animation.name
        animationView.force = animation.force
        animationView.duration = animation.duration
        animationView.delay = animation.delay
        animationView.curve = animation.curve
        animationView.animate()
        
        animation = Animation.getRandomAnimation()
        sender.setTitle("Run \(animation.name)", for: .normal)
    }
    
    private func setAnimationToLabel() {
        animationLabel.animation = "fall"
        animationLabel.animate()
        animationLabel.text = animation.description
        animationLabel.animateNext { [unowned self] in
            animationLabel.animation = "slideDown"
            animationLabel.animate()
        }
    }


}

