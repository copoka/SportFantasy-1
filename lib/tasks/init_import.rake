#lib/tasks/import.rake
require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do
  CSV.foreach('myfile.csv', :headers => true) do |row|
    MyModel.create!(row.to_hash)
  end
end