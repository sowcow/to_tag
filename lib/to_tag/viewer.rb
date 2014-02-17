require 'rack'

module ToTag
  class Viewer
    def self.serve params
      dir = params.fetch :dir
      port = params.fetch :port

      app = Rack::Builder.new do
        use Rack::Static, root: dir,
          urls: [''], index: 'index.html'
        run proc { }
      end
      Rack::Server.start app: app, port: port
    end
  end
end
