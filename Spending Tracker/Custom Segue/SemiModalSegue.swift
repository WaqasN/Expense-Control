//
//  ContainerEmbedSegue.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-12-15.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import Foundation
import UIKit

public class SemiModalSegue: UIStoryboardSegue, UIViewControllerTransitioningDelegate {
    override public func perform() {
        destination.transitioningDelegate = self
        destination.modalPresentationStyle = .custom
        
        source.present(destination, animated: true, completion: nil)
    }

    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
