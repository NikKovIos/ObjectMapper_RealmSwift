#
# Be sure to run `pod lib lint ObjectMapper_RealmSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ObjectMapper_RealmSwift'
  s.version          = '0.1.2'
  s.summary          = 'Helps to parse RealmSwift List<Class>() and RealmOptional<T>() properties with ObjectMapper framework.'
  s.description      = <<-DESC
ObjectMapper (https://github.com/Hearst-DD/ObjectMapper) is a great tool to map entities. 
But there are no functional to map directly to realm objects. 
ObjectMapper_RealmSwift helps to parse List<Class>() and RealmOptional<T>() properties with ObjectMapper framework and store them correctly 
without "Transforms".
                       DESC

  s.homepage         = 'https://github.com/NikKovIos/ObjectMapper_RealmSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nik Kov' => 'nikkovios@gmail.com' }
  s.source           = { 
    :git => 'https://github.com/NikKovIos/ObjectMapper_RealmSwift.git',
    :tag => s.version.to_s 
   }

  s.ios.deployment_target = '8.0'
  s.source_files = 'ObjectMapper_RealmSwift/Classes/**/*'
  s.frameworks = 'UIKit'
  s.dependency 'RealmSwift', '~> 2.3'
  s.dependency 'ObjectMapper', '~> 2.2'
  s.frameworks = 'UIKit'
 
end
