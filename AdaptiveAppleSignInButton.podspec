Pod::Spec.new do |s|
  s.name             = 'AdaptiveAppleSignInButton'
  s.version          = '0.1.0'
  s.summary          = 'ASAuthorizationAppleIDButton` does not update its appearance when toggling between light and dark mode. This Pod solves this.'

  s.description      = <<-DESC
  `ASAuthorizationAppleIDButton` does not update its appearance when toggling between light and dark mode. Aditionally it is not possible to update the appearance manually. You will have to create a new instance of `ASAuthorizationAppleIDButton`, initialising it with the correct style.
  `AdaptiveAppleSignInButton` is wrapping an `ASAuthorizationAppleIDButton` with the correct style. When `userInterfaceStyle` changes a new instance will replace the previous one.
                       DESC

  s.homepage         = 'https://github.com/andschdk/AdaptiveAppleSignInButton'
  s.screenshots      = 'https://github.com/andschdk/AdaptiveAppleSignInButton/blob/master/Example/dark.png?raw=true', 'https://github.com/andschdk/AdaptiveAppleSignInButton/blob/master/Example/light.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'André Schmidt' => 'andre@andsch.com' }
  s.source           = { :git => 'https://github.com/andschdk/AdaptiveAppleSignInButton.git', :tag => s.version.to_s }

  s.platform = :ios, "9.0"

  s.swift_versions = ['5.0', '5.1', '5.2']

  s.source_files = 'AdaptiveAppleSignInButton/Classes/**/*'
end
