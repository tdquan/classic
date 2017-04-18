## Taxonomy  category
## Taxons    artist ouvrage projet shop
Spree::Product.delete_all
Spree::Taxon.delete_all
Spree::Taxonomy.delete_all

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

category = Spree::Taxonomy.create!(name: 'Categorie')
books_taxon = Spree::Taxon.last
artists_taxon = Spree::Taxon.create!(taxonomy_id: category.id, parent_id: books_taxon.id, name: 'Artistes')
books_taxon = Spree::Taxon.create!(taxonomy_id: category.id, parent_id: books_taxon.id, name: 'Ouvrages')
projects_taxon = Spree::Taxon.create!(taxonomy_id: category.id, parent_id:books_taxon.id, name: 'Projets')
shops_taxon = Spree::Taxon.create!(taxonomy_id: category.id, parent_id:books_taxon.id, name: 'Boutiques')
