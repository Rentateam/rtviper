#
# Be sure to run `pod lib lint RTViper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RTViper'
  s.version          = '1.0.4'
  s.summary          = 'Viper version of Rentateam, including coordinators'

  s.description      = <<-DESC
Viper version of Rentateam, including coordinators
                       DESC

  s.homepage         = 'https://github.com/Rentateam/rtviper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rentateam' => 'info@rentateam.ru' }
  s.source           = { :git => 'https://github.com/Rentateam/RTViper.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'RTViper/Classes/**/*'
end
