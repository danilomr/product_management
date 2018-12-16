module Api
  module V1
    class ProductsController < ApplicationController
      def index
        products = Product.limit(10).order('created_at DESC');
        render json: {status:'SUCCESS', message:'Products loaded', data:products}, status: :ok
      end

      def show
        if !is_number?(params[:id])
          render json: {status:'ERROR', message:'Product id is not a numeric value', data:params[:id]}, status: :unprocessable_entity
          return;
        end
        product = Product.find_by_id(params[:id]);
        if product.nil?
          render json: {status:'ERROR', message:'Product id does not exist', data:params[:id]}, status: :unprocessable_entity
        else
          render json: {status:'SUCCESS', message:'Product loaded', data:product}, status: :ok
        end
      end

      def destroy
        if !is_number?(params[:id])
          render json: {status:'ERROR', message:'Product id is not a numeric value', data:params[:id]}, status: :unprocessable_entity
          return;
        end
        product = Product.find_by_id(params[:id]);
        if product.nil?
          render json: {status:'ERROR', message:'Product id does not exist', data:params[:id]}, status: :unprocessable_entity
        else
          product.destroy
          render json: {status:'SUCCESS', message:'Product deleted', data:product}, status: :ok
        end
      end

      def update
        product = Product.find_by_id(params[:id]);
        if product.nil?
          render json: {status:'ERROR', message:'Product id does not exist', data:params[:id]}, status: :unprocessable_entity
          return;
        end
        if product.update_attributes(product_params)
          render json: {status:'SUCCESS', message:'Product updated', data:product}, status: :ok
        else
          render json: {status:'ERROR', message:'Product not updated', data:product.errors}, status: :unprocessable_entity
        end
      end

      def create
        product = Product.new(product_params)
        if product.save
          render json: {status:'SUCCESS', message:'Product saved', data:product}, status: :ok
        else
          render json: {status:'ERROR', message:'Product not saved', data:product.errors}, status: :unprocessable_entity
        end
      end

      def is_number?(obj)
        (obj.to_s == obj.to_i.to_s) || (obj.to_s == obj.to_f.to_s)
      end

      private
      def product_params
        params.permit(:number, :name, :price, :description)
      end
    end
  end
end
