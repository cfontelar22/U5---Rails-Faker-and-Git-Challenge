require "csv"

# Clear existing data
Product.destroy_all
Category.destroy_all

# Seed products from CSV
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |product_data|
  category_name = product_data["category"]
  category = Category.find_or_create_by(name: category_name)

  # Set a default stock quantity if it's missing in the CSV
  stock_quantity = product_data["stock quantity"].presence || 0

  # Create the product
  Product.create!(
    title: product_data["name"],
    description: product_data["description"],
    price: product_data["price"],
    stock_quantity: stock_quantity.to_i, # Convert to integer
    category: category
  )
end

puts "Seed completed successfully!"
