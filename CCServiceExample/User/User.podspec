Pod::Spec.new do |spec|

  spec.name         = "User"
  spec.version      = "1.0.0"
  spec.summary      = "User"

  spec.description  = <<-DESC
		     User
                   DESC

  spec.homepage     = "https://github.com/cmwsssss/User"

  spec.license      = "MIT"

  spec.author       = { "cmw" => "cmwsssss@hotmail.com" }

  spec.platform     = :ios, "6.0"

  spec.source       = { :git => "", :tag => "1.0.0" }

  spec.source_files  = "User", "**/*.{m,h}"
  spec.exclude_files = "User/Exclude"
  spec.dependency "ServiceCenter"

end
