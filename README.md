<p align="center">
  <img src="https://raw.githubusercontent.com/Codeido/PMAlertController/master/logo_pmalertcontroller.png" alt="Icon"/>
</p>
  
 
  ![Language](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)
  [![GitHub license](https://img.shields.io/cocoapods/l/AFNetworking.svg)]()

PMAlertController is a small library that allows you to substitute the uncustomizable UIAlertController of Apple, with a beautiful and totally customizable alert that you can use in your iOS app. Enjoy!

<p align="center">
  <img src="https://raw.githubusercontent.com/Codeido/PMAlertController/master/preview_pmalertacontroller.jpg" width=500 alt="Icon"/>
</p>

## Features
----------------

- [x] Header Image (Optional)
- [x] Title
- [x] Description message
- [x] Customizations: fonts, colors, dimensions & more
- [x] 1, 2 buttons (horizontally) or 3+ buttons (vertically)
- [x] Closure when a button is pressed
- [x] Similar implementation to UIAlertController
- [x] Cocoapods
- [] Carthage

## Requirements
----------------

- iOS 9.0+
- Xcode 7.3+

## CocoaPods
----------------

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate PMAlertController into your Xcode project using CocoaPods, specify it in your `Podfile`:


```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'PMAlertController', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```


## Usage
----------------
The usage is very similar to UIAlertController.
PMAlertController has two style: Alert & Walkthrough.

**Alert Style:** with this style, the alert has the width of 270, like the UIAlertController of Apple

**Walkthrough Style:** with walkthrough, the alert has the width of the screen minus 18 from the left and the right bounds. This mode is designed to suggest to the user actions for accept localization, push notifications and more.

#### Show a simple alert with two button
```swift
let alertVC = PMAlertController(title: "A Title", description: "My Description", image: UIImage(named: "img.png"), style: .Alert)
        
alertVC.addAction(PMAlertAction(title: "Cancel", style: .Cancel, action: { () -> Void in
            print("Capture action Cancel")
        }))
        
alertVC.addAction(PMAlertAction(title: "OK", style: .Default, action: { () in
            print("Capture action OK")
        }))
        
self.presentViewController(alertVC, animated: true, completion: nil)
```


## Contributing

- If you **need help** or you'd like to **ask a general question**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Acknowledgements

Made with ❤️ by [Paolo Musolino](https://github.com/Codeido).
The design is inspired on [Musement App](https://itunes.apple.com/app/musement-tours-attractions/id828471190). The flag icon on the demo app is by [Freepik](http://freepik.com).


## MIT License
----------------
PMAlertController is available under the MIT license. See the LICENSE file for more info.