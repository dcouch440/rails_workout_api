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

end