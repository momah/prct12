#= Clase de Matriz DSL
class MatrizDSL < MatrizAbstracta

	#== Inicialización
	def initialize(operacion)

                @op_texto = operacion.to_s
                
		# Por defecto la operación será la suma
		case @op_texto	

		when "suma"
			@op = "+"		
		when "resta"
			@op = "-"
		when "producto"
			@op = "*"
		else
			@op = "&"		
		end  
					
                @matA = nil
                @matB = nil

	end

	attr_reader :matrizA, :matrizB

	#== Asignamos la opción de matriz 
        def option(opc)
                
		@claseMat = opc
                
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

			@matrizA = "Matriz" + @claseMat.to_s + ".new(@matA)"
                        puts "Matriz A: #{@matA}"

                        @matrizB = "Matriz" + @claseMat.to_s + ".new(@matB)"
                        puts "Matriz B: #{@matB}"                

                        resultado = @matrizA.to_s + "." + @op.to_s + "("  + " " + @matrizB.to_s + ")"
			resultado = eval(resultado)
                        puts "Resultado de la operacion ( " + @op_texto.to_s + " ): #{resultado}"

                end
                
        end

end

# SUMA
x = MatrizDSL.new("suma")
x.option "Densa"

x.operand [[1,2],[3,4]]
x.operand [[221,2],[3,4]]

# RESTA
y = MatrizDSL.new("resta")
y.option "Densa"

y.operand [[1,2],[3,4]]
y.operand [[221,2],[3,4]]

# PRODUCTO
z = MatrizDSL.new("producto")
z.option "Densa"

z.operand [[1,2],[3,4]]
z.operand [[221,2],[3,4]]



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
