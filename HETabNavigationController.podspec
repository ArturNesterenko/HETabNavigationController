	Pod::Spec.new do |s|
  s.name         = "HETabNavigationController"
  s.version      = "0.0.1"
  s.summary      = "Navigation bar tabs."
  s.homepage     = "https://github.com/AFNetworking/AFIncrementalStore"
  s.author       = { "How Else" => "elseisgone@gmail.com" }
  s.license      = "MIT"

  s.platform     = :ios, '5.0'

  s.source       = { :git => "https://github.com/ArturNesterenko/HETabNavigationController.git", :commit => "1200aa4727" }
  s.source_files = "HETabNavigationController/*.{h,m}"

  s.requires_arc = true
end
