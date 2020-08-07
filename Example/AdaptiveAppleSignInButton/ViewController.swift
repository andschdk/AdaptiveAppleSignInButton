//
//  ViewController.swift
//  AdaptiveAppleSignInButton
//
//  Created by André Schmidt on 08/05/2020.
//  Copyright (c) 2020 André Schmidt. All rights reserved.
//

import UIKit
import AdaptiveAppleSignInButton

class ViewController: UIViewController {

    var button: AdaptiveAppleSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        button = AdaptiveAppleSignInButton()
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

}

