ActiveAdmin.register Item do

 permit_params :title, :description, :price, :image_url

  form do |f|
        f.inputs do
          f.input :title
          f.input :description
          f.input :price
          f.input :image_url
        end

        f.actions
      end

  index as: :grid, columns: 5 do |product|
  
    div do

      resource_selection_cell product
      a :href => admin_item_path(product) do
        image_tag(product.image_url,width:100,height:80)
      end
    
    end
    a truncate(product.title), :href => admin_item_path(product)

  end

end
