#http://httparty.rubyforge.org/

require 'rubygems'
require 'httparty'
require 'json'
require 'csv'

print "Buscar Materia: "
materia = gets.chomp
url='http://sia.bogota.unal.edu.co/buscador/JSON-RPC'
#{"method": "buscador.obtenerAsignaturas", "params": ["", "PRE", "", "PRE", "", "L6-21:M6-21:C6-21:J6-21:V6-21:S6-21:D6-21,", 1, 5000]}
#{"method": "buscador.obtenerAsignaturas", "params": [materia, "PRE", "", "PRE", "", "", 1, 5000]}
response = HTTParty.post(
				 url,
				:body => {"method": "buscador.obtenerAsignaturas", "params": [materia, "PRE", "", "PRE", "", "", 1, 5000]}.to_json,
				:headers => { 
       			 			"Host": "sia.bogota.unal.edu.co",
    						"Content-Type": "text/plain",
   							 } 
						 )
parsed = JSON.parse(response) 


#File.open("MYSIA.json","w") do |f|
#  f.write(parsed.to_json)
#end

#materias = r["result"]["asignaturas"]
#p materias["result"]["asignaturas"]["list"][0]["nombre"]

materias = parsed["result"]["asignaturas"]["list"]

#CSV.open("mysia.csv", "w") do |csv|
	materias.each do |mat|
		puts mat["codigo"]+" "+mat["nombre"]
		#csv << mat.values
	end 
#end




#for i in materias
	

