#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'multi_media_picker'
  s.version          = '0.0.1'
  s.summary          = 'A fork of the official image_picker plugin that adds the functionality to pick multiple images&#x2F;videos.'
  s.description      = <<-DESC
A fork of the official image_picker plugin that adds the functionality to pick multiple images&#x2F;videos.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
end

