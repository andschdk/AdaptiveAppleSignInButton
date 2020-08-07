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

    private var isDarkMode: Bool {
        return traitCollection.userInterfaceStyle == .dark
    }

    private var activeButton: ASAuthorizationAppleIDButton? {
        get {
            if isDarkMode {
                return darkModeButton
            } else {
                return lightModeButton
            }
        }
        set {
            if isDarkMode {
                darkModeButton = newValue
            } else {
                lightModeButton = newValue
            }
        }
    }

    private var inactiveButton: ASAuthorizationAppleIDButton? {
        get {
            if isDarkMode {
                return lightModeButton
            } else {
                return darkModeButton
            }
        }
        set {
            if isDarkMode {
                lightModeButton = newValue
            } else {
                darkModeButton = newValue
            }
        }
    }

    private var activeButtonStyle: ASAuthorizationAppleIDButton.Style {
        return isDarkMode ? darkStyle : lightStyle
    }

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
        activeButton?.frame = bounds
    }

    public override var intrinsicContentSize: CGSize {
        return activeButton?.intrinsicContentSize ?? .zero
    }

    private func update() {
        if activeButton == nil {
            activeButton = ASAuthorizationAppleIDButton(authorizationButtonType: buttonType, authorizationButtonStyle: activeButtonStyle)
            activeButton?.constraints.forEach { $0.isActive = false }
            addSubview(activeButton!)
        }

        inactiveButton?.removeFromSuperview()
        inactiveButton = nil

        layoutIfNeeded()
    }
}
