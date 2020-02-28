Pod::Spec.new do |spec|

  spec.name         = "MySabaySdk"
  
  spec.version      = "0.0.1"
  
  spec.summary      = "Official MySabay SDK in Swift."
  
  spec.description  = "Official MySabay SDK in Swift to access MySabay platform."
  
  spec.homepage     = "https://kh.mysabay.com"
  
  spec.license      = { :type => "MYSABAY PLATFORM LICENSE", :file => "LICENSE" }
  
  spec.author             = { "Lay Channara" => "lay.channara@sabay.com" }
  
  spec.source       = { :git => "https://git.sabay.com/mysabay/sdk/app.ios.sdk.mysabay.com.public.git", :tag => "#{spec.version}" }
  
  spec.exclude_files = "Classes/Exclude"

end
