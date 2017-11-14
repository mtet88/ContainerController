//
//  TabContainerViewController.swift
//  Example
//
//  Created by Hans Seiffert on 06.08.16.
//  Copyright © 2016 Hans Seiffert. All rights reserved.
//

import UIKit
import ContainerController

class TabContainerViewController: UIViewController {

	@IBAction private func didPressContentAButton(_ sender: AnyObject) {
		self.cc_containerController?.display(segue: "showContentA")
	}

	@IBAction private func didPressContentBButton(_ sender: AnyObject) {
		self.cc_containerController?.display(segue: "showContentB")
	}

	@IBAction private func didPressContentCButton(_ sender: AnyObject) {
		self.cc_containerController?.display(segue: "showContentC")
	}

	// MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		self.cc_setupContainerControllerIfNeeded(segue, default: "showContentA", didSetup: {
			self.cc_containerController?.delegate = self
		})
	}
}

extension TabContainerViewController: ContainerControllerDelegate {

	func containerController(_ containerController: ContainerController, willDisplay contentController: UIViewController, isReused: Bool) {
		guard !isReused else {
			return
		}

		if
			let _navigationController = contentController as? UINavigationController,
			let _contentController = _navigationController.viewControllers.first as? ContentViewController {
				_contentController.bottomText = "Text set from the calling UIViewController"
		} else if let _contentController = contentController as? ContentViewController {
			_contentController.bottomText = "Text set from the calling UIViewController"
		}
	}
}
