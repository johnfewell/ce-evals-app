ActiveAdmin.register Question do
    permit_params :content, :created_at, :updated_at, :text
  
end