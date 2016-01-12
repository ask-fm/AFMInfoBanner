Pod::Spec.new do |s|
  s.name             = "AFMInfoBanner"
  s.version          = "1.2.1"
  s.summary          = "Easy to use auto-hiding notice bar below Navigation Bar."
  s.description      = <<-DESC
                       Red or green banner with text sliding from below the Navigation Bar
                       and hiding itself after a small timeout.

                       Good for notices or error messages. Auto-sizes itself to fit all
                       text. Colours are customisable by UIAppearance.
                       DESC
  s.homepage         = "https://github.com/ask-fm/AFMInfoBanner"
  s.screenshots     = "https://raw.githubusercontent.com/ask-fm/AFMInfoBanner/master/res/red_banner.gif", "https://raw.githubusercontent.com/ask-fm/AFMInfoBanner/master/res/red_banner.png"
  s.license          = 'MIT'
  s.author           = { "Romans Karpelcevs" => "roman@ask.fm" }
  s.source           = { :git => "https://github.com/ask-fm/AFMInfoBanner.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/cvbk'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.frameworks = 'UIKit'
  s.dependency 'CVKHierarchySearcher', '~> 0.2'
end
