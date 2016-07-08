json.array!(@products) do |product|
  json.extract! product, :id, :name, :desc, :img, :price, :quantity, :props
  json.url product_url(product, format: :json)
end
