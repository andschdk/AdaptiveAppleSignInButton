//
//  AdaptiveAppleSignInButton.swift
//  AdaptiveAppleSignInButton
//
//  Created by André Schmidt on 05/08/2020.
//

import Foundation
import AuthenticationServices
import UIKit

public class AdaptiveAppleSignInButton: UIControl {
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            darkModeButton?.cornerRadius = cornerRadius
            lightModeButton?.cornerRadius = cornerRadius
        }
    }

    private var darkModeButton: ASAuthorizationAppleIDButton?
    private var lightModeButton: ASAuthorizationAppleIDButton?

    private let lightStyle: ASAuthorizationAppleIDButton.Style
    private let darkStyle: ASAuthorizationAppleIDButton.Style
    private let buttonType: ASAuthorizationAppleIDButton.ButtonType


    public init(authorizationButtonType: ASAuthorizationAppleIDButton.ButtonType = .signIn, lightStyle: ASAuthorizationAppleIDButton.Style = .black, darkStyle: ASAuthorizationAppleIDButton.Style = .white) {
        buttonType = authorizationButtonType
        self.lightStyle = lightStyle
        self.darkStyle = darkStyle
        super.init(frame: .zero)

        update()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.userInterfaceStyle == previousTraitCollection?.userInterfaceStyle {
            return
        }

        update()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        darkModeButton?.frame = bounds
        lightModeButton?.frame = bounds
    }

    public override var intrinsicContentSize: CGSize {
        if traitCollection.userInterfaceStyle == .dark {
            return darkModeButton?.intrinsicContentSize ?? .zero
        } else {
            return lightModeButton?.intrinsicContentSize ?? .zero
        }
    }

    private func update() {
        switch traitCollection.userInterfaceStyle {
        case .dark:
            if darkModeButton == nil {
                darkModeButton = ASAuthorizationAppleIDButton(authorizationButtonType: buttonType, authorizationButtonStyle: darkStyle)
                darkModeButton?.constraints.forEach { $0.isActive = false }
                addSubview(darkModeButton!)
            }

            lightModeButton?.removeFromSuperview()
            lightModeButton = nil
        default:
            if lightModeButton == nil {
                lightModeButton = ASAuthorizationAppleIDButton(authorizationButtonType: buttonType, authorizationButtonStyle: lightStyle)
                lightModeButton?.constraints.forEach { $0.isActive = false }
                addSubview(lightModeButton!)
            }

            darkModeButton?.removeFromSuperview()
            darkModeButton = nil
        }

        layoutIfNeeded()
    }
}
