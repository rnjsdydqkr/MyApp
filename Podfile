# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

def shared_pods
  pod 'Alamofire', '5.6.2'
#  pod 'RealmSwift', '~>10', :modular_headers => true
#  pod 'Realm', '~>10', :modular_headers => true
end

target 'MyApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MyApp

  target 'MyAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MyAppUITests' do
    # Pods for testing
  end

  shared_pods

end

target 'MyApp DEV' do
  shared_pods
end

target 'MyApp TEST' do
  shared_pods
end
