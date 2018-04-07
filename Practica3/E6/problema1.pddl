(define (problem ejercicio1)

  (:domain Belkan)

  (:objects
    ZONE_00_00 - zona
    ZONE_01_00 - zona
    ZONE_02_00 - zona
    
    
    
    ARENOSO PEDREGOSO AGUA BOSQUE PRECIPICIO - tipoterreno
    
    NORTE SUR ESTE OESTE - orientacion
    
    zes - jugador
    Bruja Principe Princesa Profesor Leonardo - personaje
    
    oro manzana algoritmo oscar rosa zapatillas bikini - objeto
  )
  
  
  (:init
  
    ;giros
    (siguienteDER NORTE ESTE)
    (siguienteDER ESTE SUR)
    (siguienteDER SUR OESTE)
    (siguienteDER OESTE NORTE)
    
    (siguienteIZQ NORTE OESTE)
    (siguienteIZQ OESTE SUR)
    (siguienteIZQ SUR ESTE)
    (siguienteIZQ ESTE NORTE)
    
    ;Iniciales
    (en zes ZONE_00_00)
    (orientado NORTE)
    (= (mano) 0)
    (= (distancia-total) 0)
    (= (mochila) 0)
    (= (tam-mochila) 5)
    (= (entregado) 0)
     
    ; Posion de los personajes
    (en Principe ZONE_02_00)
    (en princesa ZONE_02_00)
    (en Leonardo ZONE_02_00)
    (en Profesor ZONE_02_00)
    (en Bruja ZONE_02_00)
    
    ; Posicion objetos
    (en manzana ZONE_00_00)
    (en oro ZONE_00_00)
    (en oscar ZONE_00_00)
    (en algoritmo ZONE_00_00)
    (en rosa ZONE_00_00)
    (en bikini ZONE_00_00)
    
    (isZone ZONE_00_00 ARENOSO)
	(isZone ZONE_01_00 AGUA)
	(isZone ZONE_02_00 ARENOSO) 
    
    
   
    
    
     ;puntos
    (= (puntos-total) 0)
    (= (puntos-entrega leonardo oscar) 10)
    (= (puntos-entrega leonardo rosa) 1)
    (= (puntos-entrega leonardo manzana) 3)
    (= (puntos-entrega leonardo algoritmo) 4)
    (= (puntos-entrega leonardo oro) 5)
    
    (= (puntos-entrega princesa oscar) 5)
    (= (puntos-entrega princesa rosa) 10)
    (= (puntos-entrega princesa manzana) 1)
    (= (puntos-entrega princesa algoritmo) 3)
    (= (puntos-entrega princesa oro) 4)
    
    (= (puntos-entrega bruja oscar) 4)
    (= (puntos-entrega bruja rosa) 5)
    (= (puntos-entrega bruja manzana) 10)
    (= (puntos-entrega bruja algoritmo) 1)
    (= (puntos-entrega bruja oro) 3)
    
    (= (puntos-entrega profesor oscar) 3)
    (= (puntos-entrega profesor rosa) 4)
    (= (puntos-entrega profesor manzana) 5)
    (= (puntos-entrega profesor algoritmo) 10)
    (= (puntos-entrega profesor oro) 1)
    
    (= (puntos-entrega principe oscar) 1)
    (= (puntos-entrega principe rosa) 3)
    (= (puntos-entrega principe manzana) 4)
    (= (puntos-entrega principe algoritmo) 5)
    (= (puntos-entrega principe oro) 10)
    
    
    



    
    ; ---> Conexiones
    ;; CONEXIONES
(camino ZONE_00_00 SUR ZONE_01_00)
(camino ZONE_01_00 NORTE ZONE_00_00)
(camino ZONE_02_00 NORTE ZONE_01_00)
(camino ZONE_01_00 SUR ZONE_02_00)


;; COSTES
(= (coste ZONE_00_00 ZONE_01_00) 10)
(= (coste ZONE_01_00 ZONE_00_00) 10)
(= (coste ZONE_01_00 ZONE_02_00) 10)
(= (coste ZONE_02_00 ZONE_01_00) 10)

  )


  (:goal
	(= (entregado) 5)
  )
  (:metric minimize (puntos-total))
  
)
