module Spree
  class TaxonsController < Spree::StoreController
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    helper 'spree/products'

    respond_to :html

    def show
      @taxon = Taxon.friendly.find(params[:id])
      if @taxon.parent
        @taxon = @taxon.parent
      end
      return unless @taxon

      @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
      @products = @searcher.retrieve_products.order({ created_at: :desc }).reverse
      @taxonomies = Spree::Taxonomy.includes(root: :children)


      # if @taxon.name == "Artists" || "Projects" || "Shop"
      #   @products = @products.sort_by  &:name
      # else
      #   @products = @products.sort_by  &:created_at
      # end

    end

    private

    def accurate_title
      @taxon.try(:seo_title) || super
    end
  end
end
