# frozen_string_literal: true

class AasmHistoryModelGenerator < Rails::Generators::Base
  desc 'This generator created model AssmHistory'
  def generate
    create_file 'app/models/state_history.rb', <<~RUBY
      # frozen_string_literal: true

      class StateHistory < ApplicationRecord
        belongs_to :stateable, polymorphic: true
      end
    RUBY
  end
end
