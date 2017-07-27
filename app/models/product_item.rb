class ProductItem

  def self.get_product_items
    api = HTTParty.get("https://aga-api.herokuapp.com/product_items")
    api.each do |item|
      product = Product.where(number: item['product_number']).first
      product.product_items.create(description: item["description"], number: item["number"], price: item["price"].to_i, dimensions: item["dimensions"])
    end
  end
end
