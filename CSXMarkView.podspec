

Pod::Spec.new do |s|
  s.name         = "CSXMarkView"
  s.version      = "0.0.7"
  s.summary      = "优惠券背景view视图."
  s.description  = "CSXMarkView优惠券初始版本，内容最初的可继承，可在内部当作背景view使用，建议继承使用."
  s.homepage     = "https://github.com/KirstenDunst/CSXMarkView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "曹世鑫" => "cao_shixin@yahoo.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/KirstenDunst/CSXMarkView.git", :tag => "v#{s.version}" }
  s.source_files  = "CSXMarkView", "CSXMarkView/Code/*.{h,m}"
  s.framework  = "UIKit"
  s.requires_arc = true
end

