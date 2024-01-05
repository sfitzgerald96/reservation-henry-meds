class ProvidersController < ApplicationController
  # GET /providers
  def index
    @providers = Provider.all

    render json: @providers
  end

  # GET /providers/1
  def show
    @provider = Provider.find(params[:id])
    render json: @provider
  end

  # POST /providers
  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      render json: @provider, status: :created, location: @provider
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /providers/1
  def update
    @provider = Provider.find(params[:id])
    if @provider.update(provider_params)
      render json: @provider
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /providers/1
  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy!
  end

  private

  # Only allow a list of trusted parameters through.
  def provider_params
    params.require(:provider).permit(:first_name, :last_name, :office_address, :phone_number)
  end
end
