# Alyssa created the following code to keep track of items for a shopping
# cart application she's writing:

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

my_cart_items = InvoiceEntry.new('tuna', 5)
my_cart_items.update_quantity(10)
puts my_cart_items.quantity

# Alan looked at the code and spotted a mistake. "This will fail when
# update_quantity is called", he says.

# Can you spot the mistake and how to address it?
# In this case she will need to add the @ before quantity, because Ruby
# is creating a new variable named quantity, instead of calling the method.
