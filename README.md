<p align="center">
  <img src="https://raw.githubusercontent.com/Codeido/PMAlertController/master/logo_pmalertcontroller.png" alt="Icon"/>
</p>
  
 
  [![Language](https://img.shields.io/badge/Swift-2.3%20%26%203.0-orange.svg)]()
  [![GitHub license](https://img.shields.io/cocoapods/l/PMAlertController.svg)](https://github.com/Codeido/PMAlertController/blob/master/LICENSE)
  [![Pod version](https://img.shields.io/cocoapods/v/PMAlertController.svg?style=flat)](https://cocoapods.org/pods/PMAlertController)
  [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

PMAlertController is a small library that allows you to substitute Apple's uncustomizable `UIAlertController`, with a beautiful and totally customizable alert that you can use in your iOS app. Enjoy!

<p align="center">
  <img src="https://raw.githubusercontent.com/Codeido/PMAlertController/master/preview_pmalertacontroller.jpg" width=500 alt="Icon"/>
</p>

## Features
----------------

- [x] Header View
- [x] Header Image (Optional)
- [x] Title
- [x] Description message
- [x] Customizations: fonts, colors, dimensions & more
- [x] 1, 2 buttons (horizontally) or 3+ buttons (vertically)
- [x] Closure when a button is pressed
- [x] Similar implementation to UIAlertController
- [x] Cocoapods
- [x] Carthage
- [x] Animation with UIKit Dynamics
- [x] Objective-C compatibility
- [x] Swift 2.3 & Swift 3 support
- [ ] Swift Package Manager


## Requirements
----------------

- iOS 9.0+
- Xcode 8+

## CocoaPods
----------------

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate PMAlertController into your Xcode project using CocoaPods, specify it in your `Podfile`:


```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'PMAlertController'
```

Then, run the following command:

```bash
$ pod install
```

## Carthage
----------------

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate PMAlertController into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Codeido/PMAlertController"
```

Run `carthage update` to build the framework and drag the built `PMAlertController.framework` into your Xcode project.

## Manually
----------------
1. Download and drop ```/Library``` folder in your project.  
2. Congratulations!  

## Usage
----------------
The usage is very similar to `UIAlertController`.
`PMAlertController` has two styles: Alert & Walkthrough.

**Alert Style:** with this style, the alert has the width of 270 points, like Apple's `UIAlertController`.

**Walkthrough Style:** with walkthrough, the alert has the width of the screen minus 18 points from the left and the right bounds. This mode is intended to be used before authorization requests like the ones for position, push notifications and more.

#### Show a simple alert with two button

```swift
//This code works with Swift 3

let alertVC = PMAlertController(title: "A Title", description: "My Description", image: UIImage(named: "img.png"), style: .alert)

alertVC.addAction(PMAlertAction(title: "Cancel", style: .cancel, action: { () -> Void in
            print("Capture action Cancel")
        }))
        
alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { () in
            print("Capture action OK")
        }))
        
self.present(alertVC, animated: true, completion: nil)

```

## Swift compatibility
- If you use **Swift 3.0**, you can use the [latest release](https://github.com/Codeido/PMAlertController/releases).

- If you use **Swift 2.3**, you can use the [release 1.1.0](https://github.com/Codeido/PMAlertController/releases/tag/1.1.0)

- If you use **Swift 2.2**, you can use the [release 1.0.5](https://github.com/Codeido/PMAlertController/releases/tag/1.0.5)


## Contributing

- If you **need help** or you'd like to **ask a general question**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Acknowledgements

Made with ❤️ by [Paolo Musolino](https://github.com/Codeido).
The design is inspired by the [Musement App](https://itunes.apple.com/app/musement-tours-attractions/id828471190). The flag icon on the demo app is by [Freepik](http://freepik.com).


## MIT License
----------------
PMAlertController is available under the MIT license. See the LICENSE file for more info.
