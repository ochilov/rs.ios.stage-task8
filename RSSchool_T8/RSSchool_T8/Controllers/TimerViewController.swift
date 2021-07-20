//
//  TimerViewController.swift
//  RSSchool_T8
//
//  Created by JohnO on 19.07.2021.
//

import UIKit

@objc class TimerViewController: UIViewController {
	fileprivate let slider = UISlider()
	fileprivate let sliderValue = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		initStyle();
		setupViews();
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		let doubleType = NSNumber(value: RSSettings.default().drawDuration)
		slider.value = doubleType.floatValue
	}
	
	func initStyle() {
		view.backgroundColor = .white
		
		view.layer.cornerRadius = 40
		view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
		
		view.layer.shadowRadius = 4
		view.layer.shadowOffset = .zero
		view.layer.shadowColor  = UIColor.defaultShadow().cgColor
		view.layer.shadowOpacity = 1
	}
	
	func setupViews() {
		// save button
		let saveButton = RSActionButton()
		saveButton.frame = .init(x: 250, y: 20, width: 85, height: 32)
		saveButton.setTitle("Save", for: .normal)
		saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
		view.addSubview(saveButton)
		
		
		// slider block
		let sliderContainder = UIView()
		view.addSubview(sliderContainder)
		sliderContainder.translatesAutoresizingMaskIntoConstraints = false
		sliderContainder.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 26).isActive = true
		sliderContainder.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -26).isActive = true
		sliderContainder.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 92).isActive = true
		sliderContainder.heightAnchor.constraint(equalToConstant: 44).isActive = true
		
		// slider
		sliderContainder.addSubview(slider)
		slider.minimumValue = 1
		slider.maximumValue = 5
		slider.addTarget(self, action: #selector(self.sliderChanged(slider:)), for: .valueChanged)
		
		// slider - min/max
		let sliderMin = UILabel()
		sliderContainder.addSubview(sliderMin)
		sliderMin.text = String(format: "%.f", slider.minimumValue)
		let sliderMax = UILabel()
		sliderContainder.addSubview(sliderMax)
		sliderMax.text = String(format: "%.f", slider.maximumValue)
		
		sliderMin.translatesAutoresizingMaskIntoConstraints = false
		sliderMax.translatesAutoresizingMaskIntoConstraints = false
		slider   .translatesAutoresizingMaskIntoConstraints = false
		sliderMin.leadingAnchor.constraint(equalTo: sliderContainder.leadingAnchor, constant: 0).isActive = true
		sliderMax.trailingAnchor.constraint(equalTo: sliderContainder.trailingAnchor, constant: 0).isActive = true
		sliderMin.centerYAnchor.constraint(equalTo: sliderContainder.centerYAnchor).isActive = true
		sliderMax.centerYAnchor.constraint(equalTo: sliderContainder.centerYAnchor).isActive = true
		slider.centerYAnchor.constraint(equalTo: sliderContainder.centerYAnchor).isActive = true
		slider.leadingAnchor.constraint(equalTo: sliderMin.trailingAnchor, constant: 41).isActive = true
		slider.trailingAnchor.constraint(equalTo: sliderMax.leadingAnchor, constant: -41).isActive = true
		
		
		// slider - value
		view.addSubview(sliderValue)
		sliderValue.text = String(format: "%.2f s", slider.value)
		sliderValue.translatesAutoresizingMaskIntoConstraints = false
		sliderValue.centerXAnchor.constraint(equalTo: sliderContainder.centerXAnchor).isActive = true
		sliderValue.topAnchor.constraint(equalTo: sliderContainder.bottomAnchor, constant: 25).isActive = true
		
		
		// set styles
		slider.tintColor = UIColor.lightGreenSea()
		for label in [sliderMin, sliderMax, sliderValue] {
			label.font = UIFont(name:"Montserrat-Regular", size:18);
		}
	}
	
	private var onSaveTarget: NSObject? = nil
	private var onSaveAction: Selector? = nil
	@objc func addOnSave(target: NSObject?, action: Selector) {
		onSaveTarget = target;
		onSaveAction = action;
	}
	
	@objc func saveButtonTapped() {
		let timeintervalType = NSNumber(value: slider.value)
		RSSettings.default().drawDuration = timeintervalType.doubleValue
		
		if let target = onSaveTarget, let action = onSaveAction {
			target.perform(action)
		}
	}
	
	@objc func sliderChanged(slider: UISlider) {
		sliderValue.text = String(format: "%.2f s", slider.value)
	}
}
