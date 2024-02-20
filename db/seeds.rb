

require "csv"

# Clear existing data
Product.destroy_all
Category.destroy_all

# Read data from CSV
csv_file = Rails.root.join('db', 'products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

# Create products and categories
products.each do |row|
  category = Category.find_or_create_by(name: row['category'])
  category.products.create(
    title: row['title'],
    description: row['description'],
    price: row['price'],
    stock_quantity: row['stock_quantity']
  )
end

puts "Seed data loaded successfully!"
