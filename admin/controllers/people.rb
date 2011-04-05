Admin.controllers :people do

  get :index do
    @people = Person.all
    render 'people/index'
  end

  get :new do
    @person = Person.new
    @person.addresses << Address.new
    render 'people/new'
  end

  post :create do
    @person = Person.new(params[:person])
    if @person.save
      flash[:notice] = 'Person was successfully created.'
      redirect url(:people, :edit, :id => @person.id)
    else
      render 'people/new'
    end
  end

  get :edit, :with => :id do
    @person = Person.find(params[:id])
    @person.addresses << Address.new
    render 'people/edit'
  end

  put :update, :with => :id do
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      flash[:notice] = 'Person was successfully updated.'
      redirect url(:people, :edit, :id => @person.id)
    else
      render 'people/edit'
    end
  end

  delete :destroy, :with => :id do
    person = Person.find(params[:id])
    if person.destroy
      flash[:notice] = 'Person was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Person!'
    end
    redirect url(:people, :index)
  end
end
