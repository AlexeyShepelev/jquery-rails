require 'net/https'

module Jquery
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator downloads and installs jQuery, jQuery-ujs HEAD, and (optionally) the newest jQuery UI"
      class_option :ui, :type => :boolean, :default => false, :desc => "Include jQueryUI"
      class_option :version, :type => :string, :default => "1.5", :desc => "Which version of jQuery to fetch"
      class_option :jqgrid, :type => :boolean, :default => false, :desc => "Include jqGrid"
      class_option :jspdf, :type => :boolean, :default => false, :desc => "Include jsPDF"
      @@default_version = "1.5"

      def remove_prototype
        %w(controls.js dragdrop.js effects.js prototype.js).each do |js|
          remove_file "public/javascripts/#{js}"
        end
      end

      def download_jquery
        say_status("fetching", "jQuery (#{options.version})", :green)
        get_jquery(options.version)
      rescue OpenURI::HTTPError
        say_status("warning", "could not find jQuery (#{options.version})", :yellow)
        say_status("fetching", "jQuery (#{@@default_version})", :green)
        get_jquery(@@default_version)
      end

      def download_jquery_ui
        if options.ui?
          say_status("fetching", "jQuery UI (latest 1.x release)", :green)
          get "http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.js",     "public/javascripts/jquery-ui.js"
          get "http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js", "public/javascripts/jquery-ui.min.js"
        end
      end

      def download_jquery_jqgrid_base
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid base", :green)
          url = URI.parse('https://github.com/tonytomov/jqGrid/raw/master/js/grid.base.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.base.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end

      def download_jquery_jqgrid_common
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid common", :green)
          url = URI.parse('https://github.com/tonytomov/jqGrid/raw/master/js/grid.common.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.common.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end
      
      def download_jquery_jqgrid_custom
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid custom", :green)
          url = URI.parse('https://github.com/tonytomov/jqGrid/raw/master/js/grid.custom.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.custom.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end
      
      def download_jquery_jqgrid_formedit
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid formedit", :green)
          url = URI.parse('https://github.com/tonytomov/jqGrid/raw/master/js/grid.formedit.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.formedit.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end

      def download_jquery_jqgrid_inlinedit
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid inlineedit", :green)
          url = URI.parse('https://github.com/tonytomov/jqGrid/raw/master/js/grid.inlinedit.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.inlinedit.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end

      def download_jquery_jqgrid_celledit
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid celledit", :green)
          url = URI.parse('https://github.com/tonytomov/jqGrid/raw/master/js/grid.celledit.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.celledit.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end
      
      def download_jquery_jqgrid_subgrid
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid subgrid", :green)
          url = URI.parse('https://github.com/tonytomov/jqGrid/raw/master/js/grid.subgrid.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.subgrid.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end

      def download_jquery_jqgrid_fmatter
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid fmatter", :green)
          url = URI.parse('https://github.com/tonytomov/jqGrid/raw/master/js/jquery.fmatter.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/jquery.fmatter.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end
      
      def download_ujs_driver
        say_status("fetching", "jQuery UJS adapter (github HEAD)", :green)
        url = URI.parse('https://github.com/rails/jquery-ujs/raw/master/src/rails.js')
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
        resp = http.request_get(url.to_s)
        open("public/javascripts/rails.js", "wb") {|file| 
          file.write(resp.body)
        }
      end

      def download_jspdf_functions
        if options.jspdf?
          say_status("fetching", "jsPDF js.pdf", :green)
          url = URI.parse('https://github.com/MrRio/jsPDF/blob/master/jspdf.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jspdf"
            Dir.mkdir("public/javascripts/jspdf")
          end
          open("public/javascripts/jspdf/jspdf.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end
      
      def download_jspdf_base64
        if options.jspdf?
          say_status("fetching", "jsPDF base64.js", :green)
          url = URI.parse('https://github.com/MrRio/jsPDF/blob/master/libs/base64.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jspdf/libs"
            Dir.mkdir("public/javascripts/jspdf/libs")
          end
          open("public/javascripts/jspdf/libs/base64.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end

      def download_jspdf_sprintf
        if options.jspdf?
          say_status("fetching", "jsPDF sprintf.pdf", :green)
          url = URI.parse('https://github.com/MrRio/jsPDF/blob/master/libs/sprintf.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jspdf/libs"
            Dir.mkdir("public/javascripts/jspdf/libs")
          end
          open("public/javascripts/jspdf/libs/sprintf.js", "wb") {|file| 
            file.write(resp.body)
          }
        end
      end

    private

      def get_jquery(version)
        get "http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.js",     "public/javascripts/jquery.js"
        get "http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js", "public/javascripts/jquery.min.js"
      end

    end
  end
end
