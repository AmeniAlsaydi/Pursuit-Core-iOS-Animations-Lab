//
//  SettingsController.swift
//  Animations-Lab
//
//  Created by Amy Alsaydi on 2/3/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func didSelectRow(selectedAnimation: UIView.AnimationOptions)
}

class SettingsController: UIViewController {
    
    var delegate: SettingsDelegate? // should be weak ?? but returns error
    
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    private var animationOptions: [UIView.AnimationOptions] = [.repeat, .curveEaseIn, .transitionCurlUp, .transitionFlipFromLeft, .transitionCrossDissolve]
    private var animationsTitles = ["repeat", "curveEaseIn", "transitionCurlUp", "transitionFlipFromLeft", "transitionCrossDissolve"]

    private var selectedAnimation: UIView.AnimationOptions!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.7639057636, blue: 0.7822543979, alpha: 1)
        pickerView.dataSource = self
        pickerView.delegate = self
        constrainPickerView()
        
 
    }
    
    private func constrainPickerView() {
        
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}

extension SettingsController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animationOptions.count
    }
}

extension SettingsController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        animationsTitles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAnimation = animationOptions[row]
        delegate?.didSelectRow(selectedAnimation: selectedAnimation)
    }
}

