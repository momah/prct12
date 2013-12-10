#= Clase de Matriz DSL
class MatrizDSL < MatrizAbstracta

	#== Inicialización
	def initialize(opc1, opc2)

                @claseMatA = opc1
                @claseMatB = opc2
                @matA = nil
                @matB = nil

	end

	attr_reader :matrizA, :matrizB #:filas, :columnas

	#== Asignamos la operación 
        def option(op)
                
                @op = op
                
        end

	#== Definimos el operando
	def operand(other)
                
		                
                if(@matA == nil)
                        @matA = other
                else
                        @matB = other
                end
                             
                execute
                
        end
	
	#== Definimos la función de ejecución de la operación
        def execute
                
		# Mostramos las matrices
                if @matA != nil and @matB != nil

			@matrizA = "Matriz" + @claseMatA.to_s << ".new(@matA)"
                        puts "Matriz A: #{@matA}"

                        @matrizB = "Matriz" + @claseMatA.to_s << ".new(@matB)"
                        puts "Matriz B: #{@matB}"                

                        resultado = @matrizA.to_s << "." << @op.to_s << "("  << " " << @matrizB.to_s << ")"
			resultado = eval(resultado)
                        puts "Resultado: #{resultado}"

                end
                
        end

end

=begin
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
=end
