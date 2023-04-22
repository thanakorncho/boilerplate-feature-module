#
# Be sure to run `pod lib lint Feature.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'Feature'
    s.version          = '0.1.0'
    s.summary          = 'A short description of Feature.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/Thanakorn Chongcharoenthanakul/Feature'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Thanakorn Chongcharoenthanakul' => 'thanakorn.c@ookbee.com' }
    s.source           = { :git => 'https://github.com/foundation-ios/boilerplate-feature-module.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.swift_version = '5.4'
    s.ios.deployment_target = '13.0'
    #  s.static_framework = true
    
    s.source_files = 'Feature/Classes/**/*.{swift,h}'
    s.resources = ['Feature/Classes/**/*.{storyboard,xib,xcassets}']
    # s.prepare_command = 'sh run-swift-gen-script.sh'
    
    # s.public_header_files = 'Feature/Classes/Headers/Public/*.h'
    # s.project_header_files = 'Feature/Classes/Headers/Project/*.h'
    
    s.resource_bundles = {
        'Feature-Assets' => ['Feature/Assets/**/*.{ttf,xcassets,strings}']
    }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'SwifterSwift'
    
    s.dependency 'SnapKit'
    s.dependency 'IQKeyboardManagerSwift'
    s.dependency 'Swinject'
    
    s.dependency 'RxSwift'
    s.dependency 'RxCocoa'
    s.dependency 'RxSwiftExt'
    s.dependency 'RxGesture'
    
    #    s.dependency 'SwiftLint'
    s.dependency 'Kingfisher'
    s.dependency 'lottie-ios'
    s.dependency 'SwiftEntryKit'
    s.dependency 'SkeletonView'
    
    # View
    s.dependency 'NVActivityIndicatorView'
    
    # Generated
#    s.dependency 'Sourcery'
    
    # Firebase
    #  s.dependency 'Firebase/Core'
    #  s.dependency 'FirebaseAnalytics'
    
end
