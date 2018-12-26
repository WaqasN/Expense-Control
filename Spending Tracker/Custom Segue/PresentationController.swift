//
//  PresentationController.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-09-19.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    let dimmedView: UIView

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        self.dimmedView = UIView()
        self.dimmedView.alpha = 0
        self.dimmedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.4)

        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        self.dimmedView.addGestureRecognizer(recognizer)
    }

    override func presentationTransitionWillBegin() {
        self.dimmedView.frame = containerView?.bounds ?? presentingViewController.view.bounds
        containerView?.insertSubview(dimmedView, at: 0)

        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in self.dimmedView.alpha = 1 })
        } else {
            dimmedView.alpha = 1
        }
    }

    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in self.dimmedView.alpha = 0 })
        } else {
            dimmedView.alpha = 0
        }
    }

    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        guard let _ = containerView else { return }

        UIView.animate(withDuration: 0.25) {
            self.presentedView?.frame = self.frameOfPresentedViewInContainerView
        }
    }

    @objc func didTap(_ sender: Any) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerFrame = containerView?.frame else {
            return .zero
        }

        var size = presentedViewController.preferredContentSize
        size.height += presentingViewController.view.safeAreaInsets.bottom

        return CGRect(origin: CGPoint(x: 0, y: containerFrame.height - size.height), size: size)
    }
}
