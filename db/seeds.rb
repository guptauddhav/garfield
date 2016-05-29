# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vendors = Vendor.create(title: 'ASUG plumbing',description: 'ASUG plumbing is the best',user_id: '1')
vendors = Vendor.create(title: 'Graphite marbel',description: 'All your marble needs',user_id: '2')
vendors = Vendor.create(title: 'Neon Cleaners',description: 'Cleaning at its best',user_id: '3')