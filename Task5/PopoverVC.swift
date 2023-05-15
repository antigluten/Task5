//
//  PopoverVC.swift
//  Task5
//
//  Created by va-gusev on 15.05.2023.
//

import UIKit

final class PopoverVC: UIViewController {
    
    var segmentView = UISegmentedControl(items: ["280pt", "150"])
    lazy var button: UIButton = {
        return UIButton(type: .close, primaryAction: UIAction(handler: { _ in
            self.dismiss(animated: true)
        }))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6
        preferredContentSize = CGSize(width: 300, height: 280)
        
        segmentView.selectedSegmentIndex = 0
        segmentView.setAction(UIAction(title: "280pt", handler: { _ in
            UIView.animate(withDuration: 0.2) {
                self.preferredContentSize = CGSize(width: 300, height: 280)
            }
        }), forSegmentAt: 0)
        segmentView.setAction(UIAction(title: "150pt", handler: { _ in
            UIView.animate(withDuration: 0.2) {
                self.preferredContentSize = CGSize(width: 300, height: 150)
            }
        }), forSegmentAt: 1)
        
        view.addSubview(segmentView)
        view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segmentView.sizeToFit()
        segmentView.center = CGPoint(x: view.bounds.midX, y: 40)
        
        button.sizeToFit()
        button.center = CGPoint(x: view.bounds.width - button.bounds.midX - 5, y: 40)
    }
}

