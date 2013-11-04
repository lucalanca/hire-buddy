# encoding: UTF-8
require 'httparty' 
require 'nokogiri'
require 'csv'

def get_email(page)
  result = HTTParty.get(page)
  noko = Nokogiri::HTML(result)
  email = noko.xpath('//*[@id="apply_details"]/a').inner_text.to_s
  title = noko.xpath('//*[@id="job_content"]/h1').inner_text.to_s
  company = noko.xpath('//*[@id="job_sidebar"]/h4/a').inner_text.to_s
  { company: company, title: title, email: email }
end

pages = ["http://londonstartupjobs.co.uk/mobile-app-development/mobile-app-developer-actionscript-haxe-openfl-appsbooth/", "http://londonstartupjobs.co.uk/back-end-development/junior-developer-stratajet/", "http://londonstartupjobs.co.uk/back-end-development/javascala-web-developer-shazam/", "http://londonstartupjobs.co.uk/tech-software/web-developer/", "http://londonstartupjobs.co.uk/tech-software/senior-infrastructure-engineer/", "http://londonstartupjobs.co.uk/front-end-development/senior-front-end-developer/", "http://londonstartupjobs.co.uk/back-end-development/senior-back-end-developer/", "http://londonstartupjobs.co.uk/tech-software/software-engineer-ruby-on-rails/", "http://londonstartupjobs.co.uk/tech-software/systems-administrator/", "http://londonstartupjobs.co.uk/tech-software/graduate-developer-skimlinks/", "http://londonstartupjobs.co.uk/front-end-development/javascript-html5-dev-head/", "http://londonstartupjobs.co.uk/back-end-development/leadsenior-server-side-web-developer-mind-candy/", "http://londonstartupjobs.co.uk/tech-software/apprentice-journeyman-and-master-programmers/", "http://londonstartupjobs.co.uk/tech-software/software-development-manager/", "http://londonstartupjobs.co.uk/tech-software/developer-internship-php-python/", "http://londonstartupjobs.co.uk/front-end-development/front-end-engineer/", "http://londonstartupjobs.co.uk/tech-software/developer-evangelist/", "http://londonstartupjobs.co.uk/tech-software/developer-evangelist/", "/companies/stripe", "http://londonstartupjobs.co.uk/tech-software/senior-php-developer/", "http://londonstartupjobs.co.uk/tech-software/senior-software-developer/", "http://londonstartupjobs.co.uk/tech-software/data-analytics-engineer-mendeley/", "http://londonstartupjobs.co.uk/front-end-development/javascript-developer/", "http://londonstartupjobs.co.uk/mobile-app-development/ios-android-developer/", "http://londonstartupjobs.co.uk/tech-software/web-application-software-developer/", "http://londonstartupjobs.co.uk/tech-software/build-configuration-engineer/", "http://londonstartupjobs.co.uk/tech-software/senior-developer-internal-apps-just-eat-com/", "http://londonstartupjobs.co.uk/front-end-development/htmlcss-web-developer/", "http://londonstartupjobs.co.uk/mobile-app-development/c-game-developers-mobile/", "http://londonstartupjobs.co.uk/tech-software/senior-application-developer-rubyrailsos/", "http://londonstartupjobs.co.uk/tech-software/business-intelligence-developer-analyst-qlikview/", "http://londonstartupjobs.co.uk/tech-software/developer-internal-apps-just-eat-com/", "http://londonstartupjobs.co.uk/front-end-development/front-end-developer/", "http://londonstartupjobs.co.uk/mobile-app-development/mobile-software-engineer-android/", "http://londonstartupjobs.co.uk/tech-software/senior-engineer/", "http://londonstartupjobs.co.uk/design-ux/senior-ux-practitioner-mobile-moo/", "http://londonstartupjobs.co.uk/design-ux/senior-ux-practitioner-mobile-moo/", "/companies/moo", "http://londonstartupjobs.co.uk/analytics-bi/data-scientist-games-analytics-king-com/", "http://londonstartupjobs.co.uk/analytics-bi/data-scientist-games-analytics-king-com/", "/companies/king-com", "http://londonstartupjobs.co.uk/design-ux/senior-illustrator-mind-candy/", "http://londonstartupjobs.co.uk/design-ux/senior-illustrator-mind-candy/", "/companies/mind-candy", "http://londonstartupjobs.co.uk/design-ux/senior-illustrator-mind-candy/", "http://londonstartupjobs.co.uk/tech-software/developer-api-just-eat-com/", "http://londonstartupjobs.co.uk/back-end-development/php-developer-symfony2/", "http://londonstartupjobs.co.uk/mobile-app-development/senior-developer-ios-just-eat-com/", "http://londonstartupjobs.co.uk/tech-software/ruby-developers/", "http://londonstartupjobs.co.uk/tech-software/game-developer-king-com/", "http://londonstartupjobs.co.uk/tech-software/ruby-developers-2/", "http://londonstartupjobs.co.uk/back-end-development/software-architect/", "http://londonstartupjobs.co.uk/mobile-app-development/mobile-developer-ios/", "http://londonstartupjobs.co.uk/tech-software/it-support-engineer/", "http://londonstartupjobs.co.uk/tech-software/software-engineer-lyst/", "http://londonstartupjobs.co.uk/tech-software/engineering-interns/", "http://londonstartupjobs.co.uk/back-end-development/senior-java-developer/", "http://londonstartupjobs.co.uk/tech-software/developer-evangelist/", "http://londonstartupjobs.co.uk/tech-software/partner-implementation-manager/", "http://londonstartupjobs.co.uk/tech-software/chief-technical-officer/", "http://londonstartupjobs.co.uk/product-management/senior-product-manager-consumer-shutl/", "http://londonstartupjobs.co.uk/product-management/senior-product-manager-consumer-shutl/", "/companies/shutl", "http://londonstartupjobs.co.uk/back-end-development/backend-developer/", "http://londonstartupjobs.co.uk/tech-software/engineer/", "http://londonstartupjobs.co.uk/tech-software/devops-engineer/", "http://londonstartupjobs.co.uk/tech-software/lead-unity-developer/", "http://londonstartupjobs.co.uk/back-end-development/senior-software-engineer-ruby/", "http://londonstartupjobs.co.uk/tech-software/support-engineer/", "http://londonstartupjobs.co.uk/tech-software/graduate-devops-engineer/", "http://londonstartupjobs.co.uk/tech-software/tools-developer/", "http://londonstartupjobs.co.uk/back-end-development/java-server-developer/", "http://londonstartupjobs.co.uk/tech-software/technical-team-lead-development/", "http://londonstartupjobs.co.uk/tech-software/linux-service-engineers-devops/", "http://londonstartupjobs.co.uk/tech-software/tech-lead/"]

CSV.open("companies.csv", "w") do |csv|
  pages.each do |page|
    begin
      csv << get_email(page).values
    rescue  
      puts "exception bro"
    end  
  end
end