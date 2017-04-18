## Taxonomy  category
## Taxons    artist ouvrage projet shop
Spree::Product.delete_all
Spree::Taxon.delete_all
Spree::Taxonomy.delete_all

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

category_taxonomy = Spree::Taxonomy.create!(name: 'Categorie')
book_taxon = Spree::Taxon.last
artists_taxon = Spree::Taxon.create!(taxonomy_id: category_taxonomy.id, parent_id: book_taxon.id, name: 'Artistes')
books_taxon = Spree::Taxon.create!(taxonomy_id: category_taxonomy.id, parent_id: book_taxon.id, name: 'Ouvrages')
projects_taxon = Spree::Taxon.create!(taxonomy_id: category_taxonomy.id, parent_id: book_taxon.id, name: 'Projets')
shops_taxon = Spree::Taxon.create!(taxonomy_id: category_taxonomy.id, parent_id: book_taxon.id, name: 'Boutiques')

a = Spree::Product.create!(name: "Cette vie qu'on mène" , price: 100, shipping_category_id: 1, available_on: Time.now)
a.taxons = [books_taxon]
