Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
## Taxonomy  category
## Taxons    artist ouvrage projet shop
Spree::Product.destroy_all
Spree::Taxon.destroy_all
Spree::Taxonomy.destroy_all
puts "Destroyed!"

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
p "1"
e = Spree::Product.create!(name: "Cette vie" , price: 100, shipping_category_id: 1, available_on: Time.now)
e.taxons = [books_taxon, artists_taxon, projects_taxon]
f = Spree::Product.create!(name: "No way" , price: 100, shipping_category_id: 1, available_on: Time.now)
f.taxons = [books_taxon, artists_taxon, projects_taxon]
g = Spree::Product.create!(name: "Teren" , price: 100, shipping_category_id: 1, available_on: Time.now)
g.taxons = [books_taxon, artists_taxon]
h = Spree::Product.create!(name: "The greatest ?" , price: 100, shipping_category_id: 1, available_on: Time.now)
h.taxons = [books_taxon, artists_taxon, projects_taxon]
p "2"
i = Spree::Product.create!(name: "La qu'on mène" , price: 100, shipping_category_id: 1, available_on: Time.now)
i.taxons = [books_taxon, artists_taxon, projects_taxon]
j = Spree::Product.create!(name: "way out" , price: 100, shipping_category_id: 1, available_on: Time.now)
j.taxons = [books_taxon, artists_taxon, projects_taxon]
k = Spree::Product.create!(name: "Alchemia" , price: 100, shipping_category_id: 1, available_on: Time.now)
k.taxons = [books_taxon, artists_taxon]
l = Spree::Product.create!(name: "shitty?" , price: 100, shipping_category_id: 1, available_on: Time.now)
l.taxons = [books_taxon, artists_taxon, projects_taxon]
p "3"
m = Spree::Product.create!(name: "Cette vie qu'on" , price: 100, shipping_category_id: 1, available_on: Time.now)
m.taxons = [books_taxon, artists_taxon, projects_taxon]
n = Spree::Product.create!(name: "No out" , price: 100, shipping_category_id: 1, available_on: Time.now)
n.taxons = [books_taxon, artists_taxon, projects_taxon]
o = Spree::Product.create!(name: "Teren Alchemi" , price: 100, shipping_category_id: 1, available_on: Time.now)
o.taxons = [books_taxon, artists_taxon]
q = Spree::Product.create!(name: "The shitty?" , price: 100, shipping_category_id: 1, available_on: Time.now)
q.taxons = [books_taxon, artists_taxon, projects_taxon]

