# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'

def shared_pods
    
    inhibit_all_warnings!
    use_frameworks!
    
    # Pods for Trible
    pod 'Alamofire'
    pod 'Kingfisher'
    pod 'SwiftMessages'
    pod 'FBSDKLoginKit'
    pod 'GoogleSignIn'
    pod 'IQKeyboardManagerSwift'
    pod 'JTAppleCalendar'

    pod 'NVActivityIndicatorView'
    pod 'DKImagePickerController', :git => 'https://github.com/zhangao0086/DKImagePickerController.git', :branch => 'develop', :subspecs => ['PhotoGallery', 'Camera', 'InlineCamera']
end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
        
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_COMPILATION_MODE'] = 'wholemodule'
                if config.name == 'Debug'
                    config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
                    else
                    config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Osize'
                end
            end
        end
    end
end

target 'Trible_DEV' do
    shared_pods
end

target 'Trible_UAT' do
    shared_pods
end

