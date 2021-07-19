//
//  TimerViewController.swift
//  RSSchool_T8
//
//  Created by JohnO on 19.07.2021.
//

import UIKit

@objc class TimerViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		initStyle();
		setupViews();
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
	
	fileprivate let saveButton = RSActionButton();
	func setupViews() {
		// save button
		saveButton.frame = .init(x: 250, y: 20, width: 85, height: 32)
		saveButton.setTitle("Save", for: .normal)
		saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpOutside)
		view.addSubview(saveButton)
	}
	
	private var onSaveTarget: NSObject? = nil
	private var onSaveAction: Selector? = nil
	@objc func addOnSave(target: NSObject?, action: Selector) {
		onSaveTarget = target;
		onSaveAction = action;
	}
	
	@IBAction func saveButtonTapped() {
		if let target = onSaveTarget, let action = onSaveAction {
			target.perform(action)
		}
	}
}
