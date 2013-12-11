# La clase de Matriz dispersa,
# Una matriz se considerará dispersa si tiene más de un 60% de ceros.
class MatrizDispersa < MatrizAbstracta

	# Inicialización
        def initialize(matriz)

                @matriz = matriz
                @filas = matriz.size
                @columnas = matriz.size

	end

	attr_reader :matriz, :filas, :columnas

	# Convertimos a string
	def to_s

                fil = 0
                print "["
                while fil < filas

			col = 0
			while col < columnas

                       		# Hay datos en la fila
                       		if matriz[fil] != nil

					if matriz[fil].has_key?(col)
						print "#{matriz[fil][col].to_s}"
                                        else
                                        	print "0"
					end 
				else
                                        print "0"
				end

	                       	if (col + 1) < columnas then print ", " end
        	                col += 1

			end


                        if (fil + 1) < filas then print ", " end
                        fil += 1

                end
                print "]"

	end

	#  Matriz en punto flotante
	def to_f

                flotante = Array.new(matriz.size - 1)
                for i in 0...matriz.size
			# Hay datos en la fila
                        if matriz[i] != nil
				
                        	flotante[i] = Hash.new()
                                matriz[i].each do |key, value|
					flotante[i][key] = matriz[i][key].to_f
                                end
			
			end

                end
                MatrizDispersa.new(flotante)

	end

	# Suma de matrices
	def +(o)

                suma = Array.new(matriz.size - 1)

		i = 0
                (matriz.size - 1).times do
                      
			# creamos el hash
			if (matriz[i] != nil or o.matriz[i] != nil)

				suma[i] = Hash.new()
		
				case true

					# Los dos tienen hash
					when (matriz[i] != nil and o.matriz[i] != nil)
				
						# cogemos matriz como base para la suma
						suma[i] = matriz[i]

						o.matriz[i].each do |key, value|
				
							if suma[i].has_key?(key)
		                                        	suma[i][key] = suma[i][key] + o.matriz[i][key]
                		                        else
                                		                suma[i][key] = o.matriz[i][key]
		                                        end

                                		end

					# matriz tiene hash
					when matriz[i] != nil
						suma[i] = matriz[i]						
	
					# .. o hash
					when o.matriz[i] != nil
						suma[i] = o.matriz[i]


				end
			
			end

			i += 1

                end
                MatrizDispersa.new(suma)

	end

	# Resta de matrices
	def -(o)

                resta = Array.new(matriz.size - 1)

		i = 0
                (matriz.size - 1).times do

                        # creamos el hash
                        if (matriz[i] != nil or o.matriz[i] != nil)

                                resta[i] = Hash.new()
                                        
                                case true

                                        # Los dos tienen hash
                                        when (matriz[i] != nil and o.matriz[i] != nil)
                                
                                                # cogemos matriz como base para la resta
                                                resta[i] = matriz[i]

                                                o.matriz[i].each do |key, value|
                                
                                                        if resta[i].has_key?(key)
                                                                resta[i][key] = resta[i][key] - o.matriz[i][key]
                                                        else
                                                                resta[i][key] = o.matriz[i][key] * -1
                                                        end

                                                end

                                        # matriz tiene hash
                                        when matriz[i] != nil
                                                resta[i] = matriz[i]                                             
        
                                        #... o hash
                                        when o.matriz[i] != nil
						resta[i] = o.matriz[i]
						resta[i].each do |key, value|
							resta[i][key] =  resta[i][key] * -1
                                                end

                                end
                        
                        end

			i += 1

                end
                MatrizDispersa.new(resta)

	end


	# Producto de matrices
	def *(o)

                prod = Array.new(matriz.size - 1)

		i = 0
                (0...(matriz.size)).inject {
                      
			# creamos el hash si hay filas en el multiplicador
			if (o.matriz[i] != nil)
				
				prod[i] = Hash.new()
				# cogemos o como base para el producto
				prod[i] = o.matriz[i]

				for j in 0...matriz.size

					if o.matriz[i].has_key?(j) 

						if matriz[j].has_key?(i)
							prod[i][j] = prod[i][j] + (prod[i][j] * matriz[j][i])
						else
							prod[i].delete(j)
						end

					else
						prod[i].delete(j)
					end
				
				end

			end

			i += 1

		}
                MatrizDispersa.new(prod)

	end

	# Máximo de matriz
	def max

                maximo = 0.to_f
                for i in 0...matriz.size
                        #=== Hay datos en la fila
                        if matriz[i] != nil
                                matriz[i].each do |key, value|
                                        if matriz[i][key].to_f > maximo
                                                maximo = matriz[i][key].to_f
                                	end
				end                        
                        end
                end
                maximo

	end

	# Minimo de matriz
	def min

	        minimo = 0.to_f
                for i in 0...matriz.size			
			#=== Hay datos en la fila
			if matriz[i] != nil					
				matriz[i].each do |key, value|
                	               	if matriz[i][key].to_f < minimo
                        	               	minimo = matriz[i][key].to_f
                               		end
				end
                        end				
                end
                minimo

	end

	# Pasamos de Dispersa a Densa
	def to_densa

		densa = Array.new(matriz.size - 1)
                for i in 0...matriz.size
                        densa[i] = Array.new(matriz[i].size - 1)
			for j in 0...matriz[i].size
				densa[i][j] = 0.to_f
				if matriz[i] != nil
                                	matriz[i].each do |key, value|
                                        	if key = j
                                               		densa[i][j] = matriz[i][key].to_f
                                        	end
					end
                                end
                        end
		end

                MatrizDensa.new(densa)

	end

	# El metodo coerce para onvierte el valor especificado en el tipo especificado.
	def coerce(other)
		return self, other.to_densa
 	end

end
