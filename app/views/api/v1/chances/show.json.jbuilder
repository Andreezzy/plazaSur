json.partial! "api/v1/chances/chance", chance: @chance
json.products do
    json.array!(@products) do |product|
      json.name product.product.name
    end
end
