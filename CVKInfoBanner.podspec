#
# Be sure to run `pod lib lint CVKInfoBanner.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CVKInfoBanner"
  s.version          = "0.1.0"
  s.summary          = "Easy to use auto-hiding notice bar below Navigation Bar."
  s.description      = <<-DESC
                       Red or green banner with text sliding from below the Navigation Bar
                       and hiding itself after a small timeout.

                       Good for notices or error messages. Auto-sizes itself to fit all
                       text.
                       DESC
  s.homepage         = "https://github.com/coverback/CVKInfoBanner"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Romans Karpelcevs" => "karpelcev@gmail.com" }
  s.source           = { :git => "https://github.com/coverback/CVKInfoBanner.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/cvbk'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.frameworks = 'UIKit'
  s.dependency 'CVKHierarchySearcher', '~> 0.1'
end
