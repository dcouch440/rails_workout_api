class V1::MembersController < ApplicationController

  def index
    json_response(Member.all)
  end

  def show
    json_response(Member.find(params[:id]))
  end

  def update
    member = Member.find(params[:id])
    if member.update!(update_params)
      json_response(member)
    end
  end

  def destroy
    Member.find(params[:id]).destroy!
    json_response({ message: 'deleted' }, :no_content)
  end

  def create
    json_response(Member.create_member_with_location(member_creation_params), :created)
  end

  private

  def update_params
    params.permit %i[
      name
      membership_active
    ]
  end

  def member_creation_params
    params.permit %i[
      street_address
      state_province
      city
      postal_code
      name
      membership_active
      gym_id
    ]
  end

end