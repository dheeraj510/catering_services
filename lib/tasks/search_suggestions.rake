namespace :search_suggestions do
  desc "Generate search suggestions from Businesses"
  task :index => :environment do
    SearchSuggestion.index_products
  end
end