Pod::Spec.new do |spec|

  spec.name         = "MySabaySdk"
  
  spec.version      = "1.0.21"
  
  spec.summary      = "Official MySabay SDK in Swift."
  
  spec.description  = "Official MySabay SDK in Swift to access MySabay platform."
  
  spec.homepage     = "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public"
  
  spec.license      = { :type => "MIT", :file => "MySabaySdk/LICENSE" }
  
  spec.author             = { "Lay Channara" => "lay.channara@sabay.com" }

  spec.ios.deployment_target = '11.0'

  spec.ios.vendored_frameworks = 'MySabaySdk/MySabaySdk.framework'
  
  spec.source       = { :http => "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public/raw/1.0.21/MySabaySdk.zip" }
  
  spec.exclude_files = "Classes/Exclude"

end
