module Capistrano
  module Template
    module Plugin
      def render(template)
        content = File.read(File.join(template_path, template))
        ERB.new(content).result(chain.instance_eval { binding })
      end

      def publish(template, location, options={})
        raise ArgumentError.new("location must be an absolute path") unless location =~ %r(^/)
        published_files.push(:template => template, :location => location, :options => options)
      end

      private
      def published_files
        set(:__template_published_files, []) unless exists?(:__template_published_files)
        fetch(:__template_published_files)
      end

      def template_path
        fetch(:template_path, File.join('config', 'deploy', 'templates'))
      end

      def template_bindings
        fetch(:template_bindings, [Bindings::CapistranoBinding.new(self)])
      end

      def chain
        @__template_chain ||= Bindings::Chain.new(*template_bindings)
      end
    end
  end
end
