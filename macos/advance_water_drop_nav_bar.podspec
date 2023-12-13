#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint advance_water_drop_nav_bar.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'advance_water_drop_nav_bar'
  s.version          = '0.0.1'
  s.summary          = 'It is advance flutter plugin for navigation which is inherit from water_drop_nav_bar'
  s.description      = <<-DESC
It is advance flutter plugin for navigation which is inherit from water_drop_nav_bar
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
