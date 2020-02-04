//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var duration: Double = 2
    private var distance: CGFloat = 100
    private var animationType: UIView.AnimationOptions? = nil
    
    lazy var blueSquare: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "cloud.sun") // change image
        view.backgroundColor = .green // change color 
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
    
    lazy var durationStepper: UIStepper = { // property intializer
        let stepper = UIStepper()
        stepper.minimumValue = 0.01
        stepper.maximumValue = 4.0
        stepper.value = duration
        stepper.stepValue = 0.2
        stepper.addTarget(self, action: #selector(durationChanged(sender:)), for: .touchUpInside)
        return stepper
    }()
    
    lazy var distanceStepper: UIStepper = { // property intializer
        let stepper = UIStepper()
        stepper.minimumValue = 10
        stepper.maximumValue = 150
        stepper.value = Double(distance)
        stepper.stepValue = 5
        stepper.addTarget(self, action: #selector(distanceChanged(sender:)), for: .touchUpInside)
        return stepper
    }()
    
        
    lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.text = "Current time: \(String(format: "%.2f", duration))"
        return label
    }()
    
    lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Current distance: \(String(format: "%.0f", distance))"
        return label
    }()
    
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
        setUpNavBar()
        view.backgroundColor = .white
        
        addSubviews()
        configureConstraints()
    }
    
    private func setUpNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.title = "Animation"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(showSettings(_:)))
    }
    
 @IBAction func showSettings(_ sender: UIBarButtonItem) {
    let settingsVC = SettingsController()
    settingsVC.delegate = self
    navigationController?.pushViewController(settingsVC, animated: true)
       }
    
    @IBAction func distanceChanged(sender: UIStepper) {
        distance = CGFloat(sender.value)
        distanceLabel.text =  "Current distance: \(String(format: "%.0f", sender.value))"
    }
    
    @IBAction func durationChanged(sender: UIStepper) {
        duration = sender.value
        durationLabel.text = "Current time: \(String(format: "%.2f", sender.value))"
    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - distance
        UIView.animate(withDuration: duration, delay: 0.0, options: [animationType ?? .repeat], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + distance
        
        UIView.animate(withDuration: duration, delay: 0.0, options: [animationType ?? .repeat], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    @IBAction func animateSquareLeft(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet - distance
        
        UIView.animate(withDuration: duration, delay: 0.0, options: [animationType ?? .repeat], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
        
    @IBAction func animateSquareRight(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
         self.blueSquareCenterXConstraint.constant = oldOffet + self.distance
        
        UIView.animate(withDuration: duration, delay: 0.0, options: [animationType ?? .repeat], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
            
    }
        private func addSubviews() {
            addStackViewSubviews()
            view.addSubview(blueSquare)
            view.addSubview(buttonStackView)
            view.addSubview(durationStepper)
            view.addSubview(durationLabel)
            view.addSubview(distanceStepper)
            view.addSubview(distanceLabel)
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
            constrainDurationStepper()
            constrainDurationLabel()
            constrainDistanceSteppr()
            constrainDistanceStepper()
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
    private func constrainDurationStepper() {
        durationStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            durationStepper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            durationStepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    private func constrainDurationLabel() {
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([durationLabel.leadingAnchor.constraint(equalTo: durationStepper.trailingAnchor, constant: 20), durationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)])
    }
    
    private func constrainDistanceSteppr() {
        distanceStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([distanceStepper.topAnchor.constraint(equalTo: durationStepper.bottomAnchor, constant: 20),distanceStepper.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: 20)])
    }
    
    private func constrainDistanceStepper() {
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            distanceLabel.leadingAnchor.constraint(equalTo: distanceStepper.trailingAnchor, constant: 20),
            distanceLabel.centerYAnchor.constraint(equalTo: distanceStepper.centerYAnchor)
            //distanceLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 20)
        ])
    }
}

extension ViewController: SettingsDelegate {
    func didSelectRow(selectedAnimation: UIView.AnimationOptions) {
        animationType =  selectedAnimation
    }
    
}


