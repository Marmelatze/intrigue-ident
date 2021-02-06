module Intrigue
  module Ident
    module Check
      module Private
        class Mikl < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "mikl",
                :product => "Typogrify",
                :website => "https://www.drupal.org/project/typogrify",
                :match_details => "mikl Typogrify - typogrify.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/typogrify\\\/|<link.*href=".*\/typogrify\/)typogrify.css/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
            ]
          end
        end
      end
    end
  end
end
