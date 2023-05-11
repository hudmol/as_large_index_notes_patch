Rails.application.config.after_initialize do

  AppConfig[:large_index_notes_threshold] = 100 unless AppConfig.has_key?(:large_index_notes_threshold)

  unless AppConfig[:large_index_notes_threshold].is_a?(Integer)
    raise "large_index_notes plugin configuration error: AppConfig[:large_index_notes_threshold] must be an integer!"
  end

  module AspaceFormHelper
    def define_final_template(name, definition = nil, &block)
      @templates ||= {}

      @templates[name] = {
        :final => true,
        :block =>  block,
        :definition => (definition || BaseDefinition.new),
      }
    end

    def define_template(name, definition = nil, &block)
      @templates ||= {}

      return if @templates[name] && @templates[name][:final]

      @templates[name] = {
        :final => false,
        :block =>  block,
        :definition => (definition || BaseDefinition.new),
      }
    end
  end
end
