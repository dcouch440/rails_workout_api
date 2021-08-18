module ParseParams

  def self.parse_location params
    {
      street_address: params[:street_address],
      state_province: params[:state_province],
      city: params[:city],
      postal_code: params[:postal_code]
    }
  end

  def self.parse_gym params
    {
      name: params[:name],
      established: params[:established]
    }
  end

  def self.parse_member params
    {
      name: params[:name],
      membership_active: params[:membership_active]
    }
  end

  def self.parse_employee params
    {
      name: params[:name],
      employment_active: params[:employment_active],
      hired: params[:hired]
    }
  end

end