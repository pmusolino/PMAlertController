Pod::Spec.new do |s|
  s.name         = "PMAlertController"
  s.version      = "2.0.1"
  s.summary      = "PMAlertController is a great and customizable substitute to UIAlertController"
  s.description  = <<-DESC
  					PMAlertController is a small library that allows you to substitute the uncustomizable UIAlertController of Apple, with a beautiful and totally customizable alert that you can use in your iOS app. Enjoy!
                   DESC
  s.homepage     = "https://github.com/Codeido/PMAlertController"
  s.screenshots  = "https://raw.githubusercontent.com/Codeido/PMAlertController/master/preview_pmalertacontroller.jpg"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Paolo Musolino" => "info@codeido.com" }
  s.social_media_url   = "http://twitter.com/pmusolino"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/Codeido/PMAlertController.git", :tag => s.version }
  s.source_files  = "Library/**/*"
  s.resource_bundles = {
    'PMAlertController' => ['Library/Resources/*.png', 'Library/**/*.xib']
  }
  s.framework  = "UIKit"
  s.requires_arc = true
end
