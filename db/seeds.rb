## Taxonomy  category
## Taxons    artist ouvrage projet shop
Spree::Product.destroy_all
Spree::Taxon.destroy_all
Spree::Taxonomy.destroy_all

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)


## option 1
# category_taxonomy = Spree::Taxonomy.create!(name: 'Categorie')
# book_taxon = Spree::Taxon.last
# artists_taxon = Spree::Taxon.create!(taxonomy_id: category_taxonomy.id, parent_id: book_taxon.id, name: 'Artistes')
# books_taxon = Spree::Taxon.create!(taxonomy_id: category_taxonomy.id, parent_id: book_taxon.id, name: 'Ouvrages')
# projects_taxon = Spree::Taxon.create!(taxonomy_id: category_taxonomy.id, parent_id: book_taxon.id, name: 'Projets')
# shops_taxon = Spree::Taxon.create!(taxonomy_id: category_taxonomy.id, parent_id: book_taxon.id, name: 'Boutiques')

## option 2
artists_taxonomy = Spree::Taxonomy.create!(name: 'Artistes')
artists_taxon = Spree::Taxon.last
books_taxonomy = Spree::Taxonomy.create!(name: 'Ouvrages')
books_taxon = Spree::Taxon.last
projects_taxonomy = Spree::Taxonomy.create!(name: 'Projets')
projects_taxon = Spree::Taxon.last
shops_taxonomy = Spree::Taxonomy.create!(name: 'Boutiques')
shops_taxon = Spree::Taxon.last

a = Spree::Product.create!(name: "Cette vie qu'on mène" , price: 100, shipping_category_id: 1, available_on: Time.now)
a.taxons = [books_taxon, artists_taxon, projects_taxon]
b = Spree::Product.create!(name: "No way out" , price: 100, shipping_category_id: 1, available_on: Time.now)
b.taxons = [books_taxon, artists_taxon, projects_taxon]
c = Spree::Product.create!(name: "Teren Alchemia" , price: 100, shipping_category_id: 1, available_on: Time.now)
c.taxons = [books_taxon, artists_taxon]
d = Spree::Product.create!(name: "The greatest shitty?" , price: 100, shipping_category_id: 1, available_on: Time.now)
d.taxons = [books_taxon, artists_taxon, projects_taxon]

