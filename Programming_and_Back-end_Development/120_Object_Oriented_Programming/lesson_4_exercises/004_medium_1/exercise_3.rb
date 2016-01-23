# In the last question Alyssa showed Alan this code which keeps track of items 
# for a shopping cart application:

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end
end

# Alan noticed that this will fail when update_quantity is called. Since quantity
# is an instance variable, it must be accessed with the @quantity notation when
# setting it. One way to fix this to change attr_reader to attr_accessor.

# Is there anything wrong with fixing it this way?
# No, but still if you put the attr_accessor, you need to replace quantity
# with self.quantity or @quantity in order to make it work

my_cart = InvoiceEntry.new('tuna', 5)
my_cart.update_quantity(10)
puts my_cart.quantity

# Nothing incorrect syntactically. However, you are altering the public
# interfaces of the class. In other words, you are now allowing clients of
# the class to change the quantity directly (calling the accessor with the
# instance.quantity = <new value> notation) rather than by going through the
# update_quantity method. It means that the protections built into the
# update_quantity method can be circumvented and potentially pose problems down the line.