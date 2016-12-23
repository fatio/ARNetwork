#
# Be sure to run `pod lib lint ARNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ARNetwork'
  s.version          = '0.2.1'
  s.summary          = 'A network framework in combination with HTTP and data cache. (AFNetworking+Realm)'
  s.description      = <<-DESC
                        A network framework in combination with HTTP and data cache. (AFNetworking+Realm)
                       DESC
  s.homepage         = 'https://github.com/dklinzh/ARNetwork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel' => 'linzhdk@gmail.com' }
  s.source           = { :git => 'https://github.com/dklinzh/ARNetwork.git', :tag => s.version.to_s, :submodules => true }

  s.requires_arc = true
  s.ios.deployment_target = '7.0'

  s.prefix_header_file = 'ARNetwork/Classes/ARNetwork-Prefix.pch'
  s.public_header_files = 'ARNetwork/Classes/ARNetwork.h'
  s.source_files = 'ARNetwork/Classes/ARNetwork.h'

  s.subspec 'HTTP' do |ss|
    ss.dependency 'AFNetworking', '~> 3.1'

    ss.source_files = 'ARNetwork/Classes/HTTP/*.{h,m}'
  end

  s.subspec 'HTTPDNS' do |ss|
    ss.dependency 'ARNetwork/HTTP'
    ss.libraries = 'resolv'
    ss.frameworks = 'CoreTelephony', 'SystemConfiguration'
    ss.vendored_frameworks = 'ARNetwork/Frameworks/HTTPDNS/*.framework'

    ss.source_files = 'ARNetwork/Classes/HTTP/HTTPDNS/*.{h,m}'
  end

  s.subspec 'Cache' do |ss|
    ss.dependency 'ARNetwork/HTTP'
    ss.dependency 'Realm', '~> 2.1'

    ss.source_files = 'ARNetwork/Classes/Cache/*.{h,m}'
  end

end
