module Api
  module V1
    class ProductsController < ApplicationController
      def index
        products = Product.limit(10).order('created_at DESC');
        render json: {status:'SUCCESS', message:'Products loaded', data:products}, status: :ok
      end

      def show
        product = Product.find(params[:id]);
        render json: {status:'SUCCESS', message:'Product loaded', data:product}, status: :ok
      end

      def destroy
        product = Product.find(params[:id]);
        product.destroy
        render json: {status:'SUCCESS', message:'Product deleted', data:product}, status: :ok
      end
    end
  end
end
