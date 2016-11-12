Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "FloatingNavigator"
s.summary = ""
s.requires_arc = true

s.version = "0.1.0"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Yeltsin Lobato" => "yeltsin.lobato@gmail.com" }

s.homepage = "https://github.com/Yeltsinn/FloatingNavigator"

s.source = { :git => "https://github.com/Yeltsinn/FloatingNavigator.git", :tag => "#{s.version}"}

s.source_files = "FloatingNavigator/**/*.{swift}"

end
