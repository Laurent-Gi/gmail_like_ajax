class EmailsController < ApplicationController
  def index
    @emails = Email.all.sort_by(&:created_at).reverse
    # @emails = Email.all ... c'est mieux en les classant dernier arrivé en haut de la pile
  end

  def create
    @email = Email.create_fake
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  def show
    @email = Email.find(params[:id])
    if !@email.read # Si l'email n'est pas encore lu, on le passe à lu
      @email.update(read: true) # puisqu'on vient de le show !
    end
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.update(read: !@email.read)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

end
