//
//  DrawingsViewController.swift
//  RSSchool_T8
//
//  Created by JohnO on 19.07.2021.
//

import UIKit

@objc class DrawingsViewController: UIViewController {
	@objc public var selectedDataUID = 0
	
	private let buttonsStack = UIStackView()
	
	// MARK: - VC delegates
	override func viewDidLoad() {
		super.viewDidLoad()
		initStyle()
		setupNavigationItem()
		setupViews()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		setupNavigationItem()
	}
	
	func initStyle() {
		self.view.backgroundColor = .white
	}
	
	func updateButtonsState() {
		for item in buttonsStack.subviews {
			if let button = item as? RSActionButton {
				button.isSelected = button.tag == selectedDataUID
			}
		}
	}
	
	// MARK: - Navigation item
	func setupNavigationItem() {
		// title
		navigationItem.title = "Drawings"
		
		// next
		if let barFont = UIFont(name: "Montserrat-Medium", size: 17) {
			navigationItem .backBarButtonItem?.setTitleTextAttributes([.font : barFont], for: .normal)
			navigationItem .leftBarButtonItem?.setTitleTextAttributes([.font : barFont], for: .normal)
			navigationItem.rightBarButtonItem?.setTitleTextAttributes([.font : barFont], for: .normal)
		}
	}
	
	func setupViews() {
		view.addSubview(buttonsStack)
		buttonsStack.axis = .vertical
		buttonsStack.distribution = .fillEqually
		buttonsStack.spacing = 15
		
		// constraints
		buttonsStack.translatesAutoresizingMaskIntoConstraints = false
		buttonsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
		buttonsStack.widthAnchor.constraint(equalToConstant: 200).isActive = true
		buttonsStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
		
		// buttons
		for item in RSDrawData.allData() {
			let button = RSActionButton()
			button.contentEdgeInsets = UIEdgeInsets(top: 9, left: 47, bottom: 9, right: 47);
			button.setTitle(item.name, for: .normal)
			button.tag = item.uid;
			button.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
			buttonsStack.addArrangedSubview(button)
		}
	}
	
	@objc func buttonTapped(_ sender: RSActionButton) {
		selectedDataUID = sender.tag;
		updateButtonsState()
		navigationController?.popViewController(animated: true)
	}
}
