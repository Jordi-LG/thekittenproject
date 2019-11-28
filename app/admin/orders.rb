ActiveAdmin.register Order do

  permit_params :user_id


  index do
    column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
    column("Date", :created_at)
    column("Customer", :user, :sortable => :user_id)
    column("Total")     {|order|  a = []
     order.items.each do |x|
      a << x.price
          end
number_to_currency(a.sum, unit: "€", format: "%n %u")  }            
  end


    show do
    panel "Invoice" do
      table_for(order.items) do |t|
        t.column("Product") {|item| auto_link item    }
        t.column("Price")   {|item| number_to_currency(item.price, unit: "€", format: "%n %u") }
        tr :class => "odd" do
          td "Total:", :style => "text-align: right;"
          a = []
          order.items.each do |x|
            a << x.price
          end
td number_to_currency(a.sum, unit: "€", format: "%n %u") 
        end
      end
    end
  end


    sidebar :customer_information, :only => :show do
    attributes_table_for order.user do
      row("User") { auto_link order.user }
      row :email
    end
  end
end
