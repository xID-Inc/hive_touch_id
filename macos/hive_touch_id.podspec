#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_desctop_touchID.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'hive_touch_id'
  s.version          = '1.0.0'
  s.summary          = 'TouchID implementation for flutter desktop on macos'
  s.description      = <<-DESC
TouchID implementation for flutter desktop on macos.
                       DESC
  s.homepage         = 'https://github.com/blockhive-JP'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Vitaly Migunov' => 'vitaly@blockhive.ee' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.12.2'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
