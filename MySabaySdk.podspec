Pod::Spec.new do |spec|

  spec.name         = "MySabaySdk"
  
  spec.version      = "0.0.10"
  
  spec.summary      = "Official MySabay SDK in Swift."
  
  spec.description  = "Official MySabay SDK in Swift to access MySabay platform."
  
  spec.homepage     = "https://kh.mysabay.com"
  
  spec.license      = { :type => "MIT", :file => "MySabaySdk/LICENSE" }
  
  spec.author             = { "Lay Channara" => "lay.channara@sabay.com" }

  spec.ios.deployment_target = '11.0'

  spec.ios.vendored_frameworks = 'MySabaySdk/MySabaySdk.framework'
  
  spec.source       = { :http => "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public/raw/0.0.10/MySabaySdk.zip" }
  
  spec.exclude_files = "Classes/Exclude"

end
