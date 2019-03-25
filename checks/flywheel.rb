module Intrigue
module Ident
module Check
    class Flywheel < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["APM","Javascript"],
            :vendor => "Flywheel",
            :product =>"Hosted Wordpress",
            :references => [
             "https://getflywheel.com/wordpress-support/a-description-of-the-flywheel-technology-stack/"
            ],
            :match_details =>"server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Flywheel\/[\d\.]+$/i,
            :dynamic_version => lambda {|d| _first_header_capture(d,/^server: Flywheel\/([\d\.]+)$/i)},
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
