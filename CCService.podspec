Pod::Spec.new do |spec|

  spec.name         = "CCService"
  spec.version      = "1.0.0"
  spec.summary      = "CCService"

  spec.description  = <<-DESC
		     CCService
                   DESC

  spec.homepage     = "https://github.com/cmwsssss/CCService"

  spec.license      = "MIT"

  spec.author       = { "cmw" => "cmwsssss@hotmail.com" }

  spec.platform     = :ios, "6.0"

  spec.source       = { :git => "https://github.com/cmwsssss/CCService.git", :tag => "1.0.0" }

  spec.source_files  = "CCService", "CCService/**/*.{m,h}"
  spec.exclude_files = "CCService/Exclude"

end
