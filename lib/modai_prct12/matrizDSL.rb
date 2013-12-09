require "matrizDispersa"
require "matrizDensa"

class MatrizDSL
	
	
	attr_accessor :operando, :nombre, :modo, :tipo
  
	def initialize(name,&block)
	  	self.nombre=name    
	  	self.operando=[]
	  	self.modo= "consola"
  	end
  	
  	def operand(matriz)
  		self.operando << MatrizDensa.new(matriz)
  	end 

  	def to_s
     		console = nombre
          	console << " = " 
          	console << (operando[0] + operando[1]).to_s
          	console
 	end  
  
  	def option(mode)
  		self.modo << mode
  	end
  
  	   
  
end


ejemplo = MatrizDSL.new("suma") do 
	option "densa" 
	option "console"

	operand [[1,2,3],[4,5,6],[7,8,9]]  
	operand [[1,1,1],[1,1,1],[1,1,1]]  
end

puts ejemplo.to_s
