Pod::Spec.new do |s|
  s.name             = 'RGSDotGridView'
  s.version          = '0.1.1'
  s.summary          = 'An UIBbutton animating between filter and close.'
  s.description      = <<-DESC
                        An UIBbutton Dribbble shot animating between filter and close.
                       DESC

  s.homepage         = 'https://github.com/RGSSoftware/RGSDotGridView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Randel Smith' => 'rs@randelsmith.com' }
  s.source           = { :git => 'https://github.com/RGSSoftware/RGSDotGridView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'RGSDotGridView/Classes/**/*'

end
