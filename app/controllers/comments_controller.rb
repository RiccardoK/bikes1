class CommentsController < ApplicationController


validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

	

  	def destroy
	  @product = Product.find(params[:product_id])
	  @comment = @product.comments.find(params[:id])
	  @comment.destroy

	  redirect_to product_path(@product)
	end

	def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def comment_params 
    params.require(:comment).permit(:user_id, :body, :rating)
  end


end
