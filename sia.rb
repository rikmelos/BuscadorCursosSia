#http://httparty.rubyforge.org/

require 'rubygems'
require 'httparty'
require 'json'
require 'csv'

print "Buscar Materia: "
materia = gets.chomp
url='http://sia.bogota.unal.edu.co/buscador/JSON-RPC'

response = HTTParty.post(
				 url,
				:body => {"method": "buscador.obtenerAsignaturas", "params": [materia, "PRE", "", "PRE", "", "", 1, 5000]}.to_json,
				:headers => { 
       			 			"Host": "sia.bogota.unal.edu.co",
    						"Content-Type": "text/plain",
   							 } 
						 )
parsed = JSON.parse(response) 




materias = parsed["result"]["asignaturas"]["list"]


	materias.each do |mat|
		puts mat["codigo"]+" "+mat["nombre"]
		
	end 

	

