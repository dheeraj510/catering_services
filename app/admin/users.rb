ActiveAdmin.register User do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :phone_number
      f.input :alternate_number, :label => "Alternate phone number"
      f.input :address
    end
    f.inputs "login credentials" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
