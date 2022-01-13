Pod::Spec.new do |spec|

  spec.name         = "Register"
  spec.version      = "1.0.0"
  spec.summary      = "Register"

  spec.description  = <<-DESC
		     Register
                   DESC

  spec.homepage     = "https://github.com/cmwsssss"

  spec.license      = "MIT"

  spec.author       = { "cmw" => "cmwsssss@hotmail.com" }

  spec.platform     = :ios, "6.0"

  spec.source       = { :git => "", :tag => "1.0.0" }

  spec.source_files  = "Register", "**/*.{m,h}"
  spec.exclude_files = "Register/Exclude"
  spec.dependency "ServiceCenter"

end
