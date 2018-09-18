ActiveAdmin.register Question do
    permit_params :first_name, :last_name, :title, :suffix, :user_id

end