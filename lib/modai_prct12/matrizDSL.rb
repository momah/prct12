#= Clase de Matriz DSL
class MatrizDSL < MatrizAbstracta

	#== Inicialización
	def initialize(operacion)

                @op_texto = operacion.to_s
                
		# Por defecto la operación será & para devolver error
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
                
                # Comprobamos la validez de la operación
		if @op = "&"
			puts "La Operacion no es valida"
			return 0
		end
                
		# Mostramos las matrices
                if @matA != nil and @matB != nil

			@matrizA = "Matriz" + @claseMat.to_s + ".new(@matA)"
                        puts "Matriz A: #{@matA}"

                        @matrizB = "Matriz" + @claseMat.to_s + ".new(@matB)"
                        puts "Matriz B: #{@matB}"                

                        resultado = @matrizA.to_s + "." + @op.to_s + "("  + " " + @matrizB.to_s + ")"
			puts "Resultado de la operacion ( " + @op_texto.to_s + " ): "                        
			resultado = eval(resultado)
#                        puts "Resultado de la operacion ( " + @op_texto.to_s + " ): #{resultado}"

                end
                
        end

end

# SUMA DENSA
x = MatrizDSL.new("suma")
x.option "Densa"

x.operand [[1,2],[3,4]]
x.operand [[221,2],[3,4]]

# RESTA DENSA
y = MatrizDSL.new("resta")
y.option "Densa"

y.operand [[1,2],[3,4]]
y.operand [[221,2],[3,4]]

# PRODUCTO DENSA
z = MatrizDSL.new("producto")
z.option "Densa"

z.operand [[1,2],[3,4]]
z.operand [[221,2],[3,4]]

# SUMA DISPERSA
x = MatrizDSL.new("suma")
x.option "Dispersa"

x.operand [[1,2],[3,4]]
x.operand [[221,2],[3,4]]

# RESTA DISPERSA
y = MatrizDSL.new("resta")
y.option "Dispersa"

y.operand [[1,2],[3,4]]
y.operand [[221,2],[3,4]]


# PRODUCTO DISPERSA
z = MatrizDSL.new("producto")
z.option "Dispersa"

z.operand [[1,2],[3,4]]
z.operand [[221,2],[3,4]]
