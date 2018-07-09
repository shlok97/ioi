# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
# platform :ios, '9.0'

target 'ioi' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ioi

  target 'ioiTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ioiUITests' do
    inherit! :search_paths
    # Pods for testing
  end

pod 'Material', '~> 2.0'
pod 'FoldingCell'
pod 'ElongationPreview', '~> 1.1'
pod 'Segmentio', '~> 3.0'
pod 'EMAlertController'
pod 'LGButton'
pod 'QRCodeReader.swift', '~> 8.2.0'
pod "SwiftRangeSlider"
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings.delete('CODE_SIGNING_ALLOWED')
    config.build_settings.delete('CODE_SIGNING_REQUIRED')
  end
end
