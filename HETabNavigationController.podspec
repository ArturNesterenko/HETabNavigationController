Pod::Spec.new do |s|
  s.name         = "HETabNavigationController"
  s.version      = "0.0.1"
  s.summary      = "Navigation bar tabs."
  s.homepage     = "https://github.com/itomych/HETabNavigationController"
  s.author       = { "How Else" => "elseisgone@gmail.com" }
  s.license      = "MIT"

  s.platform     = :ios, '5.0'

  s.source       = { :git => "https://github.com/itomych/HETabNavigationController.git", :commit => "cadfedee5f8c9fc68ff03084c158e4b38eca72f9" }
  s.source_files = "HETabNavigationController/*.{h,m}"

  s.requires_arc = true
end
