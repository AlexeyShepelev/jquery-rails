require 'net/https'

module Jquery
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator downloads and installs jQuery, jQuery-ujs HEAD, and (optionally) the newest jQuery UI"
      class_option :ui, :type => :boolean, :default => false, :desc => "Include jQueryUI"
      class_option :version, :type => :string, :default => "1.5", :desc => "Which version of jQuery to fetch"
      class_option :jqgrid, :type => :boolean, :default => false, :desc => "Include jqGrid"
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
          url = URI.parse('https://raw.github.com/tonytomov/jqGrid/master/js/grid.base.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.base.min.js", "wb") {|file| 
            file.write(js_compress(resp.body))
          }
        end
      end

      def download_jquery_jqgrid_common
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid common", :green)
          url = URI.parse('https://raw.github.com/tonytomov/jqGrid/master/js/grid.common.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.common.min.js", "wb") {|file| 
            file.write(js_compress(resp.body))
          }
        end
      end
      
      def download_jquery_jqgrid_custom
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid custom", :green)
          url = URI.parse('https://raw.github.com/tonytomov/jqGrid/master/js/grid.custom.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.custom.min.js", "wb") {|file| 
            file.write(js_compress(resp.body))
          }
        end
      end
      
      def download_jquery_jqgrid_formedit
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid formedit", :green)
          url = URI.parse('https://raw.github.com/tonytomov/jqGrid/master/js/grid.formedit.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.formedit.min.js", "wb") {|file| 
            file.write(js_compress(resp.body))
          }
        end
      end

      def download_jquery_jqgrid_inlinedit
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid inlineedit", :green)
          url = URI.parse('https://raw.github.com/tonytomov/jqGrid/master/js/grid.inlinedit.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.inlinedit.min.js", "wb") {|file| 
            file.write(js_compress(resp.body))
          }
        end
      end

      def download_jquery_jqgrid_celledit
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid celledit", :green)
          url = URI.parse('https://raw.github.com/tonytomov/jqGrid/master/js/grid.celledit.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.celledit.min.js", "wb") {|file| 
            file.write(js_compress(resp.body))
          }
        end
      end
      
      def download_jquery_jqgrid_subgrid
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid subgrid", :green)
          url = URI.parse('https://raw.github.com/tonytomov/jqGrid/master/js/grid.subgrid.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/grid.subgrid.min.js", "wb") {|file| 
            file.write(js_compress(resp.body))
          }
        end
      end

      def download_jquery_jqgrid_fmatter
        if options.jqgrid?
          say_status("fetching", "jQuery jqGrid fmatter", :green)
          url = URI.parse('https://raw.github.com/tonytomov/jqGrid/master/js/jquery.fmatter.js')
          http = Net::HTTP.new(url.host, url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
          resp = http.request_get(url.to_s)
          if !File.directory? "public/javascripts/jqgrid"
            Dir.mkdir("public/javascripts/jqgrid")
          end
          open("public/javascripts/jqgrid/jquery.fmatter.min.js", "wb") {|file| 
            file.write(js_compress(resp.body))
          }
        end
      end
      
      def download_ujs_driver
        say_status("fetching", "jQuery UJS adapter (github HEAD)", :green)
        url = URI.parse('https://raw.github.com/rails/jquery-ujs/master/src/rails.js')
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http.ca_file = File.join(File.dirname(__FILE__), "cacert.pem")
        resp = http.request_get(url.to_s)
        open("public/javascripts/rails.js", "wb") {|file| 
          file.write(resp.body)
        }
      end

    private

      def get_jquery(version)
        get "http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.js",     "public/javascripts/jquery.js"
        get "http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js", "public/javascripts/jquery.min.js"
      end

      def js_compress(code)
        res = Net::HTTP.post_form(URI.parse('http://closure-compiler.appspot.com/compile'),
                                  {'js_code' => code,
                                   'compilation_level' => 'WHITESPACE_ONLY',
                                   'output_format' => 'text',
                                   'output_info' => 'compiled_code'})
        return res.body
      end

    end
  end
end
