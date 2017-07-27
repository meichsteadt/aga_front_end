class Product
  attr_reader(:number, :name, :description, :image, :category, :product_items, :id, :related_products)

  def initialize(attributes)
    @number = attributes.fetch(:number)
    @name = attributes.fetch(:name)
    @description = attributes.fetch(:description)
    @image = attributes.fetch(:image)
    @category = attributes.fetch(:category)
    @product_items = attributes.fetch(:product_items)
    @id = attributes.fetch(:id)
    @related_products = attributes.fetch(:related_products)
  end

  def update_popularity
    RestClient.put("https://aga-api.herokuapp.com/products/#{self.id}", nil)
  end

  def self.get_products(category)
    if category == nil
      category = "products"
    end
    products = HTTParty.get("https://aga-api.herokuapp.com/#{category}").sort_by {|prod| prod["popularity"]}.reverse!
    returned_products = []
    products.each do |prod|
      if prod["image"] != "https://www.homelegance.com/wp-content/themes/h2/images/misc/shim.gif"
        returned_products.push(prod)
      end
    end
    return returned_products
  end

  def self.get_product(id)
    product = HTTParty.get("https://aga-api.herokuapp.com/products/#{id}")["product"]
    product_items = HTTParty.get("https://aga-api.herokuapp.com/products/#{id}")["product_items"]
    Product.new({id: product["id"], name: product["name"], number: product["number"], image: product["image"], description: product["description"], product_items: product_items, category: product["category"], related_products: product["related_products"]})
  end

end
