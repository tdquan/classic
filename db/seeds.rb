# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spree::Taxonomy.delete_all
Spree::Taxon.delete_all
Spree::Product.delete_all

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

## accessory
artists = Spree::Taxonomy.create!(name: 'Artistes')
books_taxon = Spree::Taxon.last
books_category = Spree::Taxon.create!(taxonomy_id: artists.id, parent_id: books_taxon.id, name: 'Ouvrages')
projects_category = Spree::Taxon.create!(taxonomy_id: artists.id, parent_id:books_taxon.id, name: 'Projets')
