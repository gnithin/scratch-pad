#
# Be sure to run `pod lib lint scratch-pad.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'scratch-pad'
  s.version          = '0.1.0'
  s.summary          = 'A short description of scratch-pad.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/gnithin/scratch-pad'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gnithin' => 'nithin.linkin@gmail.com' }
  s.source           = { :git => 'https://github.com/gnithin/scratch-pad.git', :branch => 'master'}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'scratch-pad/Classes/**/*'
  
  # s.resource_bundles = {
  #   'scratch-pad' => ['scratch-pad/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '3.1.0'
  s.dependency 'MNetJSONModeller', '1.1.5'
  s.dependency 'Google-Mobile-Ads-SDK', '>= 7.0'


end
