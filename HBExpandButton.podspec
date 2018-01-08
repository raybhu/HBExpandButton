Pod::Spec.new do |s|
  s.name = 'HBExpandButton'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'A button that can pop up sub button'
  s.homepage = 'https://github.com/Raizo7777/HBExpandButton'
  s.authors = { 'Raizo' => 'raizo.cn@gmail.com' }
  s.source = { :git => 'https://github.com/Raizo7777/HBExpandButton.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'HBExpandButton/HBExpandButton/*.swift'
end