#
# Be sure to run `pod lib lint IDMFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IDMFoundation'
  s.version          = '1.2.3'
  s.summary          = 'Base classes for new project which follows IDMCore'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  To install IDM Xcode Template: clone this repo run install-template.sh
                       DESC

  s.homepage         = 'https://github.com/congncif/IDMFoundation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'congncif' => 'congnc.if@gmail.com' }
  s.source           = { :git => 'https://github.com/congncif/IDMFoundation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'IDMFoundation/Classes/**/*'
  
  # s.resource_bundles = {
  #   'IDMFoundation' => ['IDMFoundation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Photos', 'MobileCoreServices', 'AVFoundation'
  s.dependency 'SiFUtilities'
  s.dependency 'IDMCore'
  s.dependency 'Alamofire'
  s.dependency 'ObjectMapper'
  s.dependency 'MBProgressHUD'
  s.dependency 'UIImage+FixOrientation'
  s.dependency 'CWStatusBarNotification'
  s.dependency 'Reachability'
end
