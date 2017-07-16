class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    render json: @products, :except => [:created_at, :updated_at]
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render json: @product, :except => [:created_at, :updated_at]
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
  #  logger.debug "New article: #{@product.price_tax_excluded}"
    logger.debug "Article should be valid: #{@product.valid?}"
    if @product.update(product_params)
      render plain: "Successfully Updated!"
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:id, :extra_shipping_fee, :weight, :depth, :height, :width, :barcode, :sku, :compared_price, :tax_rate, :price_tax_included, :price_tax_excluded, :image, :company_name,:name, :description, :client_id, :category, :price_cents, :quantity, :active, :subcategory, :distribution, :unique_selling_propositions, :distribution_limitations, :distribution_channels, :approvals_certifications, :private_label_capability, :drop_ship_capability, :target_audience)
    end
end

 
