# AdaptiveAppleSignInButton
A better `ASAuthorizationAppleIDButton` that supports dark mode.

## Problem
`ASAuthorizationAppleIDButton` does not update its appearance when toggling between light and dark mode. Aditionally it is not possible to update the appearance manually. You will have to create a new instance of `ASAuthorizationAppleIDButton`, initialising it with the correct style.

## Solution
`AdaptiveAppleSignInButton` is wrapping an `ASAuthorizationAppleIDButton` with the correct style. When `userInterfaceStyle` changes a new instance will replace the previous one.

## Preview
To run the example project, clone the repo, and run `pod install` from the Example directory first.
Dark | Light | -
-----|-----|---
![Iphone in dark mode](https://github.com/andschdk/AdaptiveAppleSignInButton/blob/master/Example/dark.png?raw=true) | ![Iphone in light mode](https://github.com/andschdk/AdaptiveAppleSignInButton/blob/master/Example/light.png?raw=true) | <<<<<<<<<<<<<<<<<<<<<<<<<<

## Usage
Use `AdaptiveAppleSignInButton` like any other `UIButton`
```swift
let appleSignInButton = AdaptiveAppleSignInButton(authorizationButtonType: .signIn, lightStyle: .black, darkStyle: .white)
```

## Installation
AdaptiveAppleSignInButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AdaptiveAppleSignInButton'
```

## License

AdaptiveAppleSignInButton is available under the MIT license. See the LICENSE file for more info.
