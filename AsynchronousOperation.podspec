#
# Be sure to run `pod lib lint AsynchronousOperation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AsynchronousOperation'
  s.version          = '1.0.0'
  s.summary          = 'Operation subclasses to perfom asynchronously'
  s.swift_version    = '4.2'

  s.description      = <<-DESC
 AsynchronousOperation is a lightweight version of the sample code presented at the WWDC session https://developer.apple.com/videos/play/wwdc2015/226/.
 DESC

  s.homepage         = 'https://github.com/gaetanzanella/AsynchronousOperation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gaetanzanella' => 'gaetan.zanella@fabernovel.com' }
  s.source           = { :git => 'https://github.com/gaetanzanella/AsynchronousOperation.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'AsynchronousOperation/Classes/**/*'
end
