class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def show
		@product = Product.find(params[:id])
		render json: @product
	end

	def create
		@product = Product.create(product_params)
		redirect_to "/products"
	end

	def body
		@product = Product.find(params[:id])
		render plain: @product.description
	end

	def avail
		@product = Product.find(params[:id])
		render plain: @product.inventory?
	end

private
	def product_params
		params.require(:product).permit(:name, :price, :description, :inventory)
	end

end
