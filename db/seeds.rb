AdminUser.create([{ email: 'admin@example.com', password: 'password' }]) unless AdminUser.find_by_email('admin@example.com')

Provider.delete_all
Department.delete_all
Specialty.delete_all

providers = []
Dir.glob("data/*.json") do |file|
  department = Department.create(name: File.basename(file, ".*").split("_").map(&:capitalize).join(" "))
  puts "Departamento - #{department.name}"
  puts "*" * 30
  providers = JSON.parse(IO.read(file).downcase)
  providers.each do |prov|
    provider = Hashie::Mash.new(prov)
    puts "Cargando #{provider.nombre}"
    Provider.create do |p|
      p.name, p.full_name = provider.nombre.split(" - ").map{|f| f.split(" ").map(&:capitalize).join(" ")}
      p.department = department
      p.web = provider.web
      p.wait_general = provider.tiempos_espera.medicina_general
      p.wait_pediatrician = provider.tiempos_espera.pediatria
      p.wait_gynecologist = provider.tiempos_espera.ginecologia
      p.wait_surgery = provider.tiempos_espera.cirugia_general
    end
  end
end
# Appointments
puts "*" * 30
waiting_by_specialty = [{ name: 'Medicina General', days: 1},
                    { name: 'Pediatria', days: 1},
                    { name: 'Ginecologia', days: 1},
                    { name: 'Cirugia General', days: 2}]

waiting_by_specialty.each do |sp|
  specialty_wait = Hashie::Mash.new(sp)
  puts "Creando Tiempo de Espera para #{specialty_wait.name}"
  Specialty.create(name: specialty_wait.name, max_waiting: specialty_wait.days)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
