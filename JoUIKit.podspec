Pod::Spec.new do |spec|
  spec.name         = 'JoUIKit'
  spec.summary      = 'A iOS Kit'
  spec.version      = '0.0.8'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors      = { 'django' => 'djangolei@gmail.com' }
  spec.homepage     = 'https://github.com/djangolee/JoUIKit'
  spec.source       = { :git => 'https://github.com/djangolee/JoUIKit.git', :tag => spec.version.to_s }
  spec.requires_arc = true
  spec.ios.deployment_target = '8.0'
  spec.source_files = 'Source/**/*.{swift,h,m}'
  spec.pod_target_xcconfig = {
    'SWIFT_VERSION' => '4.0',
  }
end
