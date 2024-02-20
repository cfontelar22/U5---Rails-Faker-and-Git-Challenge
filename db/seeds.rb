676.times do
    Product.create(
      title: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      stock_quantity: Faker::Number.between(from: 1, to: 100)
    )
  end
  