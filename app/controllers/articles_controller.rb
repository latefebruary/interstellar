# frozen_string_literal: true

class ArticlesController < ApplicationController
  # GET /api/articles
  def index
    @articles = Article.order(published_at: :desc).limit(per_page).offset(page)

    render json: @articles
  end
end
