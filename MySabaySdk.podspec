Pod::Spec.new do |spec|

  spec.name         = "MySabaySdk"
  
  spec.version      = "0.0.1"
  
  spec.summary      = "Official MySabay SDK in Swift."
  
  spec.description  = "Official MySabay SDK in Swift to access MySabay platform."
  
  spec.homepage     = "https://kh.mysabay.com"
  
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  
  spec.author             = { "Lay Channara" => "lay.channara@sabay.com" }

  spec.ios.deployment_target = '11.0'

  spec.ios.vendored_frameworks = 'MySabaySdk.framework'
  
  spec.source       = { :http => "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public/raw/framework/MySabaySdk.framework.zip" }
  
  spec.exclude_files = "Classes/Exclude"

  spec.preserve_paths = 'MySabaySdk.framework'

end
