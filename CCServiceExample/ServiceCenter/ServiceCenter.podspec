Pod::Spec.new do |spec|

  spec.name         = "ServiceCenter"
  spec.version      = "1.0.0"
  spec.summary      = "ServiceCenter"

  spec.description  = <<-DESC
		     ServiceCenter
                   DESC

  spec.homepage     = "https://github.com/cmwsssss"

  spec.license      = "MIT"

  spec.author       = { "cmw" => "cmwsssss@hotmail.com" }

  spec.platform     = :ios, "6.0"

  spec.source       = { :git => "", :tag => "1.0.0" }

  spec.source_files  = "ServiceCenter", "**/*.{m,h}"
  spec.exclude_files = "ServiceCenter/Exclude"
  spec.dependency "CCService"

end
