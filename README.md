<p align="center">
  <img src="/Users/pmusolino/Desktop/logo_pmalertcontroller.png" alt="Icon"/>
</p>
  
 
  ![Language](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)
  [![GitHub license](https://img.shields.io/cocoapods/l/AFNetworking.svg)]()
  
----------------------

PMAlertController is a small library that allows you to substitute the uncustomizable UIAlertController of Apple, with a beautiful and totally customizable alert that you can use in your iOS app.
Enjoy!

<p align="center">
  <img src="/Users/pmusolino/Desktop/preview_pmalertacontroller.jpg" width=500 alt="Icon"/>
</p>

## Features

- [x] Header Image (Optional)
- [x] Title
- [x] Description message
- [x] Customizations: fonts, colors, dimensions & more
- [x] 1, 2 buttons (horizontally) or 3+ buttons (vertically)
- [x] Closure when a button is pressed
- [x] Similar implementation to UIAlertController

## Requirements

- iOS 9.0+
- Xcode 7.3+

## CocoaPods

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
The usage is very similar to UIAlertController.
PMAlertController has two style: Alert & Walkthrough.

**Alert Style:** with this style, the alert has the width of 270, like the UIAlertController of Apple

**Walkthrough Style:** with walkthrough, the alert has the width of the screen minus 18 from the left and the right bounds. This mode is designed to suggest to the user actions for accept localization, push notifications and more.

#### Show a simple alert with two button
```
let alertVC = PMAlertController(title: "A Title", description: "My Description", image: UIImage(named: "img.png"), style: .Alert)
        
alertVC.addAction(PMAlertAction(title: "Cancel", style: .Cancel, action: { () -> Void in
            print("Capture action Cancel")
        }))
        
alertVC.addAction(PMAlertAction(title: "Allow", style: .Default, action: { () in
            print("Capture action Allow")
        }))
        
self.presentViewController(alertVC, animated: true, completion: nil)
```


## Contributing

- If you **need help** or you'd like to **ask a general question**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## MIT License
----------------
The MIT License (MIT)

Copyright (c) 2016 Paolo Musolino

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.



## Acknowledgements

Made with ❤️ by [Paolo Musolino](https://github.com/Codeido)