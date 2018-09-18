ActiveAdmin.register User do
    permit_params :first_name, :last_name, :title, :suffix, :superadmin_role, :instructor_role, :attendee_role

end
