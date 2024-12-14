# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Category.destroy_all
User.destroy_all
Color.destroy_all
SubCategory.destroy_all
Product.destroy_all


User.create!(
  username: "Administrador",
  email: "admin@gmail.com",
  phone: "22415678",
  password: "123456",
  original_password: "123456",
  role: 2,
  entry_date: Date.today,
  active: true,
)


User.create!(
  username: "Gerente",
  email: "gerente@gmail.com",
  phone: "22412345",
  password: "123456",
  original_password: "123456",
  role: 1,
  entry_date: Date.today,
  active: true,
)


User.create!(
  username: "Empleado",
  email: "empleado@gmail.com",
  phone: "22417893",
  password: "123456",
  original_password: "123456",
  role: 0,
  entry_date: Date.today,
  active: true,
)

# Crear categorías
categories = [
  { name: "Zapatillas" },
  { name: "Shorts" },
  { name: "Remeras"},
]

category_objects = categories.map do |category|
  Category.create!(category)
end



sub_categories = [
  { name: "Running"},
  { name: "Padel"},
  { name: "Tenis"},
  { name: "Futbol"},
  { name: "Training"},
  { name: "Moda"}
]

sub_category_objects = sub_categories.map do |sub_category_data|
  SubCategory.create!(sub_category_data)
end


colors = [
  { name: "Sin color"}, 
  { name: "Amarillo"}, 
  { name: "Verde"}, 
  { name: "Azul"}, 
  { name: "Negro"}, 
  { name: "Blanco"}, 
  { name: "Violeta"}, 
  { name: "Rosa"}, 
  { name: "Naranja"}, 
  { name: "Celeste"}, 
  { name: "Gris"}, 
]

colors_objects = colors.map do |color|
  Color.create!(color)
end


products = [
  { name: "Short adidas Ekiden", description:"SHORTS DE RUNNING EKIDEN DE ALTO RENDIMIENTO HECHOS CON MATERIALES RECICLADOS", unit_price: 82.799, stock: 15, category: category_objects[1], color: colors_objects[4], sub_category: sub_category_objects[0], size:"43", entry_date:Date.today , image_name: 'short_adidas_ekiden.webp' },
  { name: "Short Puma Run Velocity Ultraweave 2 En 1", description:"Short Puma Run Velocity Ultraweave 2 en 1. Desempeño y Comodidad para tu Carrera", unit_price: 91.999, stock: 5, category: category_objects[1], color: colors_objects[4], sub_category: sub_category_objects[0], size:"42", entry_date:Date.today , image_name: 'short_puma_run_velocity.webp' },
  { name: "Short Puma Run Favorite Velocity", description:"Diseñados para corredores diarios, los RUN FAV VELOCITY de 5” ofrecen la combinación perfecta de comodidad, transpirabilidad y rendimiento", unit_price: 56.999, stock: 50, category: category_objects[1], color: colors_objects[2], sub_category: sub_category_objects[0], size:"38", entry_date:Date.today , image_name: 'short_puma_run_favorite_1.webp' },
  { name: "Short adidas Hiit Heat Rdy 3 En 1", description:"Shorts de entrenamiento dos en uno con tecnología HEAT.RDY hechos parcialmente con materiales reciclados", unit_price: 99.999, stock: 25, category: category_objects[1], color: colors_objects[2], sub_category: sub_category_objects[0], size:"44", entry_date:Date.today , image_name: 'short_adidas_hit_heat.webp' },
  { name: "Remera CLUB 3STR TEE adidas", description:"Excelente remera para entrenar", unit_price: 55.999, stock: 10, category: category_objects[2], color: colors_objects[5], sub_category: sub_category_objects[2], size:"40", entry_date:Date.today , image_name: 'remera_adidas_club_tee.webp' },
  { name: "Remera Puma ESS+ Love Wins", description:"Luce una genial estampa y colores PUMA y cuenta con nuestro corte atlético estándar, que mantiene tu look casual y deportivo a la vez", unit_price: 35.999, stock: 8, category: category_objects[2], color: colors_objects[5], sub_category: sub_category_objects[5], size:"43", entry_date:Date.today, deleted_at: Date.today,image_name: 'remera_puma_ess.webp' },
  { name: "Remera Puma Classics", description:"Cuello redondo y un calce regular", unit_price: 37.999, stock: 10, category: category_objects[2], color: colors_objects[7], sub_category: sub_category_objects[0], size:"43", entry_date:Date.today , image_name: 'remera_puma_classics.webp' },
  { name: "Remera adidas House Of Tiro Nations", description:"Una remera House of Tiro que celebra la temporada de torneos futbolísticos", unit_price: 38.999, stock: 8, category: category_objects[2], color: colors_objects[5], sub_category: sub_category_objects[5], size:"43", entry_date:Date.today ,image_name: 'remera_adidas_house_nations.webp' },
  { name: "Zapatillas adidas Ligra", description:"Rendí al máximo con las adidas Ligra 8, diseñadas para brindar soporte, transpirabilidad y durabilidad en cada jugada.", unit_price: 102.999, stock: 10, category: category_objects[0], color: colors_objects[5], sub_category: sub_category_objects[4], size:"42", entry_date:Date.today , image_name: 'zapatillas_adidas_ligra.webp' },
  { name: "Zapatillas adidas Run 50s", description:"Un diseño inspirado en los años 50, perfecto para quienes buscan combinar estética clásica con tecnología moderna.", unit_price: 74.999, stock: 8, category: category_objects[0], color: colors_objects[3], sub_category: sub_category_objects[5], size:"44", entry_date:Date.today , image_name: 'zapatillas_adidas_run.webp' },
  { name: "Zapatillas Nova Court ADP Puma", description:"Desbloquea una velocidad explosiva con los NOVA Court", unit_price: 95.999, stock: 10, category: category_objects[0], color: colors_objects[9], sub_category: sub_category_objects[1], size:"43", entry_date:Date.today , image_name: 'zapatillas_nova_puma.jpg' },
  { name: "Zapatillas Puma Solarattack RCT", description:"Desbloquea una velocidad explosiva con las Puma Solarattack", unit_price: 109.999, stock: 8, category: category_objects[0], color: colors_objects[5], sub_category: sub_category_objects[1], size:"42", entry_date:Date.today , image_name: 'zapatillas_puma_solarattack.jpg' },
]

products_objects = products.each do |product_data|
  image_name = product_data.delete(:image_name) # Extraer el nombre de la imagen
  product = Product.create!(product_data) # Crear el producto

  # Adjuntar la imagen al producto
  product.images.attach(
    io: File.open(Rails.root.join('db', 'seeds_images', image_name)),
    filename: image_name
  )
end


