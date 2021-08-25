//
//  ViewController.swift
//  HeartLikeAnimation
//
//  Created by Rodrigo Ryo Aoki on 24/08/21.
//

import UIKit

class ViewController: UIViewController {
	
	let heartImg: UIImage = {
		let img = UIImage(named: "heart")
		
		return img!
	}()
	
	let heartFillImg: UIImage = {
		let img = UIImage(named: "heartFill")
		
		return img!
	}()
	
	//MARK: - Instances
	let heartSparkles: UIImageView = {
		let img = UIImage(named: "sparkles")
		let view = UIImageView(image: img)
		
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var heartBtn: UIButton = {
		let view = UIButton()
		
		view.setImage(heartImg, for: .normal)
		
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	var checked: Bool = false
	
	override func loadView() {
		let img = UIImage(named: "viewBackground")
		let view = UIView()
		view.backgroundColor = UIColor(patternImage: img!)

		self.view = view
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.addSubview(heartSparkles)
		self.view.addSubview(heartBtn)
		
		
		NSLayoutConstraint.activate([
			heartBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
			heartBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			
			heartSparkles.centerYAnchor.constraint(equalTo: heartBtn.centerYAnchor),
			heartSparkles.centerXAnchor.constraint(equalTo: heartBtn.centerXAnchor)
		])
		
		heartBtn.addTarget(self, action: #selector(action), for: .touchUpInside)
		heartSparkles.layer.transform = CATransform3DMakeScale(0, 0, 0)
	}
	
	@objc func action() {
		if !checked {
			checkAnimation()
		} else {
			uncheckAnimation()
		}
		checked.toggle()
	}
	
	
	func checkAnimation() {
		self.heartBtn.setImage(self.heartFillImg, for: .normal)
		UIView.transition(with: heartBtn, duration: 1, options: .transitionCrossDissolve, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
				self.heartSparkles.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1.3)
				self.heartBtn.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1.3)
			}, completion: nil)
			DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
				UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
					self.heartSparkles.layer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01)
					self.heartBtn.layer.transform = CATransform3DMakeScale(1, 1, 1)
				}, completion: nil)
			}
		}
	}
	
	func uncheckAnimation() {
		
		UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
			self.heartBtn.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
		}, completion: nil)
		
		self.heartBtn.setImage(self.heartImg, for: .normal)
		UIView.transition(with: heartBtn, duration: 0.5, options: .transitionCrossDissolve, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
	
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
				self.heartBtn.layer.transform = CATransform3DMakeScale(1, 1, 1)
			}, completion: nil)
		}
	}
}

