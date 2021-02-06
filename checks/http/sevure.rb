module Intrigue
module Ident
module Check
module Private
class Sevure < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Sevure",
            :product => "Sevure",
            :website => "http://www.sevure.com/",
            :match_details => "Sevure web server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: sevure web server\/(\d+\.\d+\.\d+.\d+.\d+)$/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: sevure web server\/(\d+\.\d+\.\d+.\d+.\d+)$/i)
                    },
            :hide => false,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => true
        }
    ]
end

end
end
end
end
end