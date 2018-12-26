//
//  ContainerEmbedSegue.swift
//  Spending Tracker
//
//  Created by Waqas Mohammed on 2018-12-15.
//  Copyright © 2018 Waqas Mohammed. All rights reserved.
//

import Foundation
import UIKit

public class ContainerEmbedSegue : UIStoryboardSegue {
    public weak var containerView: UIView?
    
    public override func perform() {
        let container: UIView! = containerView ?? source.view
        
        source.children.forEach {
            guard $0.view.superview == container else { return }
            
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
        
        source.addChild(destination)
        let destinationView = destination.view!
        destinationView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        destinationView.frame = container.bounds
        container.addSubview(destinationView)
        destination.didMove(toParent: source)
    }
}

