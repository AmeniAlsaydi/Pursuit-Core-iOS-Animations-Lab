//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 10
        return buttonStack
    }()
    
    lazy var upButton: UIButton = {
        let button = UIButton()
        button.setTitle("Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareUp(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var downButton: UIButton = {
        let button = UIButton()
        button.setTitle("Down", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareDown(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Left", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Right", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        return button
    }()
    
    // TODO: change this for animate square left and right method !
    
    
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + 150
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareLeft(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet - 100
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
        
    @IBAction func animateSquareRight(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet + 100
        UIView.animate(withDuration: 2) { [unowned self] in
            self.view.layoutIfNeeded()
        }
            
    }
        private func addSubviews() {
            view.addSubview(blueSquare)
            addStackViewSubviews()
            view.addSubview(buttonStackView)
        }
        
        private func addStackViewSubviews() {
            buttonStackView.addSubview(upButton)
            buttonStackView.addSubview(downButton)
            buttonStackView.addSubview(leftButton)
            buttonStackView.addSubview(rightButton)
        }
        
        private func configureConstraints() {
            constrainBlueSquare()
            constrainUpButton()
            constrainDownButton()
            constrainLeftButton()
            constrainRightButton()
            constrainButtonStackView()
        }
        
        private func constrainUpButton() {
            upButton.translatesAutoresizingMaskIntoConstraints = false
            upButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            upButton.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor, constant: 10).isActive = true
            upButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        }
        
        private func constrainLeftButton() {
            leftButton.translatesAutoresizingMaskIntoConstraints = false
            leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            leftButton.leadingAnchor.constraint(equalTo: upButton.trailingAnchor, constant: 10).isActive = true
            leftButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        }
        private func constrainRightButton() {
            rightButton.translatesAutoresizingMaskIntoConstraints = false
            rightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            rightButton.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 10).isActive = true
            rightButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        }
        private func constrainDownButton() {
            downButton.translatesAutoresizingMaskIntoConstraints = false
            downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            downButton.leadingAnchor.constraint(equalTo: rightButton.trailingAnchor, constant: 10).isActive = true
            downButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        }
        
        private func constrainBlueSquare() {
            blueSquare.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                blueSquareHeightConstaint,
                blueSquareWidthConstraint,
                blueSquareCenterXConstraint,
                blueSquareCenterYConstraint
            ])
        }
        
        private func constrainButtonStackView() {
            buttonStackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
                buttonStackView.heightAnchor.constraint(equalToConstant: 50),
                buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            ])
        }
}


