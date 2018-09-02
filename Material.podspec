
Pod::Spec.new do |s|

  s.name         = "Material"
  s.version      = "2.15.2"
  s.summary      = "Size-reduced Material library"

  s.description  = <<-DESC
                  Size-reduced Material library
                   DESC

  s.homepage     = "https://github.com/Aenterhy/Material"

  s.license      = { :type => "MIT" }


  s.author       = { "" => "" }
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/Aenterhy/Material.git", :tag => "#{s.version}" }

  s.subspec 'Swift' do |sp|
    sp.source_files  = ["Pod/Swift/*.swift"]
    s.resource_bundles = {
      'com.ftband.material.icons' => ['Pod/*.xcassets'],
    }

  end

  s.default_subspecs = 'Swift'

end
