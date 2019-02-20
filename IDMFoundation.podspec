#
# Be sure to run `pod lib lint IDMFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IDMFoundation'
  s.version          = '2.1.0'
  s.summary          = 'Base classes for new project which follows IDMCore'
  s.swift_version    = '4.2'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
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
  
  # s.resource_bundles = {
  #   'IDMFoundation' => ['IDMFoundation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Photos', 'MobileCoreServices', 'AVFoundation'
  
  s.default_subspec = 'Default'
  
  s.subspec 'Default' do |co|
      co.dependency 'IDMFoundation/Core'
      co.dependency 'IDMFoundation/Alamofire'
      co.dependency 'IDMFoundation/Networking'
      co.dependency 'IDMFoundation/ObjectMapper'
      co.dependency 'IDMFoundation/MBProgressHUD'
      co.dependency 'IDMFoundation/CameraAsset'
      #co.dependency 'IDMFoundation/ViewState'
      #co.dependency 'IDMFoundation/ModuleX'
  end
  
  s.subspec 'Core' do |co|
      co.source_files = 'IDMFoundation/Core/**/*'
      
      co.dependency 'SiFUtilities'
      co.dependency 'IDMCore'
  end

  s.subspec 'ViewState' do |co|
    co.dependency 'ViewStateCore'
  end

  s.subspec 'ModuleX' do |co|
    co.dependency 'ModuleX'
  end

  s.subspec 'Alamofire' do |co|
      co.source_files = 'IDMFoundation/Alamofire/**/*'
      
      co.dependency 'IDMFoundation/Networking'
      co.dependency 'SiFUtilities'
      co.dependency 'IDMCore'
      co.dependency 'Alamofire'
  end
  
  s.subspec 'Networking' do |co|
      co.source_files = 'IDMFoundation/Networking/**/*'
      
      co.dependency 'IDMFoundation/Core'
      co.dependency 'SiFUtilities'
      co.dependency 'IDMCore'
      co.dependency 'UIImage+FixOrientation'
  end
  
  s.subspec 'ObjectMapper' do |co|
      co.source_files = 'IDMFoundation/Response/Shared/*.swift', 'IDMFoundation/Response/ObjectMapper/*.swift'
      
      co.dependency 'IDMFoundation/Core'
      co.dependency 'IDMCore'
      co.dependency 'ObjectMapper'
  end
  
  s.subspec 'Codable' do |co|
      co.source_files = 'IDMFoundation/Response/Shared/*.swift', 'IDMFoundation/Response/Codable/*.swift'
      
      co.dependency 'IDMFoundation/Core'
      co.dependency 'IDMCore'
  end
  
  s.subspec 'MBProgressHUD' do |co|
      co.source_files = 'IDMFoundation/MBProgressHUD/**/*'
      
      co.dependency 'SiFUtilities'
      co.dependency 'IDMCore'
      co.dependency 'MBProgressHUD'
  end
  
  s.subspec 'Reachability' do |co|
      co.source_files = 'IDMFoundation/Reachability/**/*'
      
      co.dependency 'CWStatusBarNotification'
      co.dependency 'Reachability'
      co.dependency 'SiFUtilities'
  end
  
  s.subspec 'JGProgressHUD' do |co|
      co.source_files = 'IDMFoundation/JGProgressHUD/**/*'
      
      co.dependency 'JGProgressHUD'
      co.dependency 'SiFUtilities'
      co.dependency 'IDMCore'
  end
  
  s.subspec 'CameraAsset' do |co|
      co.source_files = 'IDMFoundation/CameraAsset/**/*'
      
      co.dependency 'IDMFoundation/Networking'
      co.dependency 'SiFUtilities'
  end
  
  #  s.subspec 'DKAsset' do |co|
  #      co.source_files = 'IDMFoundation/DKAsset/**/*'
  #
  #      co.dependency 'DKImagePickerController'
  #      co.dependency 'SiFUtilities'
  #      co.dependency 'IDMFoundation/Core'
  # end
  
end
