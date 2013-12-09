class MatrizDSL
	attr_accessor :operando, :nombre, :modo, :tipo
  
	def initialize(name,&block)
	  self.nombre=name    
	    
  	end
  

  	def to_s
     	 
 	end  
  
  	def option(mode, type)
     	  
  	end
  
  	def operand(matriz)
     	  
  	end    
  
end


ejemplo = MatrizDSL.new("suma") do 
	option "densa" 
	option "console"

	operand [[1,2,3],[4,5,6],[7,8,9]]  
	operand [[1,1,1],[1,1,1],[1,1,1]]  
end

puts ejemplo
