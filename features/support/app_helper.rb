require 'activesupport'
require 'hpricot'
require 'fake_web'
require 'ostruct'

module OA
	class Namespace
    def initialize(app)
      @app = app
			before!
    end

		def before!; end


		def self.build(ivar,&block)
			define_method("make",&block)

			define_method("make!") do |*args|
				instance_variable_set("@#{ivar}", make(*args))
				self
			end

			define_method('made') do
				instance_variable_get("@#{ivar}") || raise("Please create the #{ivar} with #make!(...) first")
			end
		end

    attr_accessor :target

		def make!(*args)
			@target = make(*args)
			self
		end

		def target
			@target || raise("Please create the target #{self.class.to_s.underscore} with #make!(...) first")
		end
		alias :o :target

    def method_missing(method_id,*args,&block)
      @app.send(method_id,*args,&block)
    end
	end

	class AppBase
		def initialize(world)
      @world = world
			before!
    end

		def before!; end

		def self.namespace(name,klass_name)
			class_eval %{
				def #{name}
					@#{name} ||= #{klass_name}.new(self)
				end
			}
		end


    def method_missing(method_id,*args,&block)
      @world.send(method_id,*args,&block)
    end
	end

  require 'fileutils'
	class Fixtures < Namespace
		include FileUtils

		def path(name)
			File.expand_path(File.join(File.dirname(__FILE__),'..','fixtures',name))
		end

		def open(name)
			File.open(path(name))
		end
  end

  #here = File.dirname(__FILE__)
  #%w[member].each {|ns| load "#{here}/app_#{ns}.rb"}





	class App < AppBase
		def before!
      c = ActiveRecord::Base.connection
      (c.tables - %w{schema_migrations}).each {|t| c.execute "delete from #{t}"}
		end

		def after!
			if !@after_list.blank?
				@after_list.each {|block| block[]}
			end
		end

		def root
			@root ||= File.expand_path(File.dirname(__FILE__)+'/../..')
		end

		def do_after(&block)
			@after_list ||= []
			@after_list << block
		end

		namespace(:fixture,:Fixtures)
		namespace(:member,:Member)
		namespace(:house,:House)
	end

end

Before do
  @app = OA::App.new(self)
end
