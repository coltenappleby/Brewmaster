# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

require 'csv'

Rails.application.load_tasks

desc 'Export class to csv'
task  :create_csv do
    
    file = "#{Rails.root}/public/data.csv"

    table = Review.all;0 # ";0" stops output.  Change "User" to any model.
    
    CSV.open( file, 'w' ) do |writer|
    
        writer << table.first.attributes.map { |a,v| a }
        table.each do |s|
            writer << s.attributes.map { |a,v| v }
        end
    end
end
