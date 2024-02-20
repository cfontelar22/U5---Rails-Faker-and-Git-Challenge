# db/seeds.rb

require 'csv'

# Clear out existing data
Product.destroy_all
Category.destroy_all

# Read the CSV file
csv_file = Rails.root.join('db', 'products.csv')
csv_data = File.read(csv_file)

# Parse CSV and create products with associated categories
CSV.parse(csv_data, headers: true) do |row|
  puts "Row: #{row}" 
  category_name = row['category']
  category = Category.find_or_create_by(name: category_name)
  
  product = Product.new(
    title: row['name'],
    description: row['description'],
    price: row['price'],
    stock_quantity: row['stock quantity']
  )
  product.category = category
  product.save!
end
