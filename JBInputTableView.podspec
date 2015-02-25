Pod::Spec.new do |s|
  s.name         = "JBInputTableView"
  s.version      = "1.0.1"
  s.summary      = "UITableView subclass which handles input text view. Suitable plugin for chat applications."
  s.homepage     = "https://github.com/josipbernat/JBInputTableView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             	= { "Josip Bernat" => "josip.bernat@gmail.com" }
  s.social_media_url	= "http://twitter.com/josipbernat"
  s.platform     		= :ios, "8.0"
  s.source       	= { :git => "https://github.com/josipbernat/JBInputTableView.git", :tag => "v1.0.1" }
  s.source_files  	= 'JBInputTableView/JBInputTableView/**/*.{h,m}'
  s.requires_arc 	= true 
  s.dependency 		'PHFComposeBarView', '~> 2.0'
end