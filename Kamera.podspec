Pod::Spec.new do |s|
    s.name                  = 'Kamera'
    s.summary               = 'Camera library written with SwiftUI'
    s.description           = 'Camera library written with SwiftUI'
                            
    s.version               = '3.0.1'
    s.ios.deployment_target = '14.0'
    s.swift_version         = '6.0'
    s.source_files          = 'Sources/**/*.{swift}'
    s.resources             = 'Sources/Internal/Assets/*.{xcassets, json}'
    s.frameworks            = 'SwiftUI', 'Foundation', 'AVKit', 'AVFoundation'
    s.homepage              = 'https://github.com/kavinbh/Kamera.git'
    s.license               = { :type => 'Apache License 2.0', :file => 'LICENSE' }
    s.author                = { 'Kavin Bharathi' => 'kavinbharathi@gmail.com' }
    s.source                = { :git => 'https://github.com/kavinbh/Kamera.git', :tag => s.version.to_s }
end
