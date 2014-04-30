Pod::Spec.new do |s|

  s.name         = "MultiMagic"
  s.version      = "0.0.1"
  s.summary      = "Simple, block-using wrapper for Multipeer Connectivity."

  s.homepage     = "http://github.com/ZackMcBride/MultiMagic"

  s.license      = 'MIT'

  s.author       = { "Zack McBride" => "zackmcbride@gmail.com" }

  s.platform     = :ios, '7.0'

  s.source       = { :git => "https://github.com/ZackMcBride/MultiMagic.git", :tag => "0.0.1" }

  s.source_files  = 'Core/**/*.{h,m}'

  s.requires_arc = true

  s.framework  = 'MultipeerConnectivity'

end