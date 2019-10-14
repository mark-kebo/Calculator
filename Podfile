# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

target 'Calculator' do
  use_frameworks!

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
      end
    end
  end
  
    pod 'SwiftGen'
    pod 'Reusable'
    
    # Networking
    pod 'Alamofire'
    

end
