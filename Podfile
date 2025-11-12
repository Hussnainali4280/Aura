platform :ios, '13.0'

target 'Aura' do
  use_frameworks!

  # Pods for AuraTranslate
	
	 pod 'FirebaseFirestore' 
	pod 'FirebaseFirestoreSwift'
	pod 'Firebase/Storage'
	pod 'Firebase/Auth'
	pod 'Firebase/Analytics'
	pod 'Firebase/Crashlytics'
	pod 'Firebase/RemoteConfig'
	pod 'RealmSwift'
	pod 'AMPopTip'
	pod 'SwipeCellKit'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'BoringSSL-GRPC'
      target.source_build_phase.files.each do |file|
        if file.settings && file.settings['COMPILER_FLAGS']
          flags = file.settings['COMPILER_FLAGS'].split
          flags.reject! { |flag| flag == '-GCC_WARN_INHIBIT_ALL_WARNINGS' }
          file.settings['COMPILER_FLAGS'] = flags.join(' ')
        end
      end
    end
  end
end 