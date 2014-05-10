require "rack"
require "rack/contrib/try_static"
require "./try_static_patch.rb"

use ::Rack::TryStatic,:root => "_site",
                      :urls => %w[/],
                      :try  => ['.html','index.html','/index.html']

run lambda { [301, {'Content-Type' => 'text/html', 'Location' => '/'}, []]}
