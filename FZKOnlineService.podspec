
Pod::Spec.new do |s|

  s.name         = "FZKOnlineService"
  s.version      = "0.0.1"
  s.summary      = "FZKOnlineService is a kind of modular programming method"

  s.description  = <<-DESC
                      Developer can use FZKOnlineService make iOS programming easier
                    DESC

  s.homepage     = "https://github.com/fzk/FZKOnlineService/"

  s.license      = "GPL"

  s.platform = :ios, '8.0'

  s.author       = { "soxeon" => "devsongbo@gmail.com" }

  s.source       = { :git => "https://github.com/fzk/FZKOnlineService.git", :tag => "#{s.version}" }

  s.source_files = 'FZKOnlineService/*.{h,m}'
  # s.resource = 'BeeHive/*.bundle'
  #s.frameworks = 'QuartzCore','UIKit','CoreBluetooth'

  s.dependency "QIYU_iOS_SDK", "~> 3.7.1"
#s.dependency "BlocksKit", "~> 2.2.5"
# s.dependency "SAMKeychain"
#s.dependency "DateTools"






end
