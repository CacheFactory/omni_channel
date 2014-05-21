module JsonModelHandeler

  def create_json_handeler model 
    if model
      render :json => model
    else
      render :json => {:errors =>model.errors.full_messages}, :status => 422
    end
  end
end