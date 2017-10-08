Pod::Spec.new do |spec|
  spec.name         = 'JoKit'
  spec.summary      = ''
  spec.version      = '0.0.1'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors      = { 'django' => 'djangolei@gmail.com' }
  spec.homepage     = 'https://github.com/djangolee/JoKit'
  spec.source       = { :git => 'https://github.com/djangolee/JoKit.git', :tag => spec.version.to_s }
  spec.requires_arc = true
  spec.ios.deployment_target = '8.0'
  spec.source_files = 'Source/**/*.{swift}'

end
