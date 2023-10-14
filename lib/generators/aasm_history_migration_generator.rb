# frozen_string_literal: true

class AasmHistoryMigrationGenerator < Rails::Generators::Base
  def generate
    create_file "db/migrate/#{timestamp}_create_state_histories.rb", <<~RUBY
       # frozen_string_literal: true

      class CreateStateHistories < ActiveRecord::Migration[#{migration_version}]
        def change
          create_table :state_histories do |t|
            t.string   :state
            t.string   :previous_state
            t.integer  :stateable_id
            t.string   :stateable_type
      
            t.timestamps
          end
        end
      end
    RUBY
  end

  private

  def migration_version
    "#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}"
  end

  def timestamp
    Time.now.strftime("%Y%m%d%H%M%S")
  end
end
