Spree::Taxon.class_eval do
  translates :name, :description, :meta_description, :meta_keywords, :meta_title, :permalink
end
