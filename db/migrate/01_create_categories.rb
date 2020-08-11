class CreateCategories < ActiveRecord::Migration

    def change
        create_table(:categories) do |i|
            i.string(:name)
        end
    end


end