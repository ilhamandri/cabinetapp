class DocumentsController < ApplicationController
	before_action :find_doc, only: [:show, :edit, :update, :destroy]

	def index
		@docs = Document.all.order("created_at DESC")
	end

	def show
	end

	def new
		@doc = current_user.documents.build
	end

	def edit
	end

	def update
		if @doc.update(doc_params)
			redirect_to @doc
		else
			render 'edit'
		end
	end

	def create
		@doc = current_user.documents.build(doc_params)

		if @doc.save
			redirect_to @doc
		else
			render 'new'
		end
	end

	def destroy
		@doc.destroy
		redirect_to documents_path
	end

	private

		def find_doc
			@doc = Document.find(params[:id])
		end

		def doc_params
			params.require(:document).permit(:title,:content)
		end
end
