//
//  ViewController.swift
//  Task5
//
//  Created by va-gusev on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(presentVC), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40)
        ])
    }
                         
    @objc func presentVC(from view: UIView) {
        let modal = PopoverVC()
        modal.modalPresentationStyle = .popover
        modal.popoverPresentationController?.delegate = self
        modal.popoverPresentationController?.permittedArrowDirections = .up
        modal.popoverPresentationController?.sourceView = view
        present(modal, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        .none
    }
}
