# Switch default editor for pry to sublime text
Pry.config.editor = ENV['PRY_EDITOR'] || 'sublime'

# History
Pry.config.history.file = '.pry_history'

# Support for debugger - remove aliases
Pry::Commands.delete 'c'
Pry::Commands.delete 'n'
Pry::Commands.delete 's'

# awesome_print gem
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError
end

# Prompt with app name
Pry.config.prompt_name = begin
  prompt_name = ENV['APP_NAME'] || File.basename(Rails.root)
  prompt_name << "#{Rails.env.to_s.first}" unless Rails.env.development?
  prompt_name
end

Pry.config.prompt = [
    # Default
    -> (target_self, nest_level, pry) {
      prompt = "[#{pry.input_array.size}]"
      prompt << " #{Pry.config.prompt_name}:"
      prompt << " #{Pry.view_clip(target_self)}"
      prompt << "#{":#{nest_level}" unless nest_level.zero?}> "
      prompt
    },

    # Nested under def, class etc.
    ->(target_self, nest_level, pry) {
      default_prompt = Pry.config.prompt[0].call(target_self, nest_level, pry)
      prompt = (' ' * default_prompt.length)[0...-(pry.input_array.size.to_s.length + 4)]
      prompt << " #{pry.input_array.size} "
      prompt << '> '
      prompt
    }
]
