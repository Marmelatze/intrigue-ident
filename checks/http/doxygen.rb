module Intrigue
    module Ident
    module Check
    module Private
    class Doxygen < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Documentation"],
                :vendor => "Doxygen",
                :product => "Doxygen",
                :website => "http://www.doxygen.nl/",
                :match_details =>"Doxygen - comment page reference ",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<!-- Generated by Doxygen.*-->/i,
                :dynamic_version => lambda {|x| 
                    puts x
                    version = _first_body_capture(x,/<!-- Generated by Doxygen (\d+(\.\d+)*)\ -->/i)
                },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Documentation"],
                :vendor => "Doxygen",
                :product => "Doxygen",
                :website => "http://www.doxygen.nl/",
                :match_details =>"Doxygen - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<meta name="generator" content="Doxygen.*"\/>/i,
                :dynamic_version => lambda {|x| 
                    version = _first_body_capture(x,/<meta name="generator" content="Doxygen (\d+(\.\d+)*)"\/>/i)
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
    