Spree::LineItem.class_eval do
  def to_conekta
    {
      :name        => variant.name,
      :description => variant.description,
      :sku         => variant.sku,
      :unit_price  => ((variant.price + adjustment_total).to_f * 100).to_i - ((order.payments.store_credits.valid.last.amount / order.products.count).to_f * 100).ceil,
      :quantity    => quantity
    }
  end
end
