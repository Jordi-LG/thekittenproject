ActiveAdmin.register User do

  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :guest
  

  filter :first_name
  filter :last_name
  filter :email
  filter :password
  filter :created_at

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :password
    column :created_at
    actions
  end


    form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :password, input_html: { autocomplete: "new-password" }
      f.input :email
    end
    f.actions
  end

end
