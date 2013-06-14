Pod::Spec.new do |s|
  s.name         = "HETabNavigationController"
  s.version      = "0.0.1"
  s.summary      = "Navigation bar tabs."
  s.homepage     = "https://github.com/itomych/HETabNavigationController"
  s.author       = { "How Else" => "elseisgone@gmail.com" }
  s.license      = "MIT"

  s.platform     = :ios, '5.0'

  s.source       = { :git => "https://github.com/itomych/HETabNavigationController.git", :commit => "1200aa4727" }
  s.source_files = "HETabNavigationController/*.{h,m}"

  s.requires_arc = true
end
