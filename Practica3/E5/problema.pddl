
(define (problem ejercicio1)

  (:domain Belkan)

  (:objects
    ZONE_00_00 ZONE_00_01 ZONE_00_02 ZONE_00_03 - zona
    ZONE_01_00 ZONE_01_01 ZONE_01_02 ZONE_01_03 - zona
    ZONE_02_00 ZONE_02_01 ZONE_02_02 ZONE_02_03 - zona
    ZONE_03_00 ZONE_03_01 ZONE_03_02 ZONE_03_03 - zona
    
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
    (= (tam-mochila) 1)
    
    
    ; Posion de los personajes
    (en Principe ZONE_00_03)
    

    ; Posicion objetos
    (en manzana ZONE_00_00)
    (en manzana ZONE_00_01)
    (en manzana ZONE_00_02)
    
    (en zapatillas ZONE_00_03)
    (en bikini ZONE_03_03)
    (en bikini ZONE_00_02)
    
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
    
    
    
(isZone ZONE_00_00 ARENOSO)
(isZone ZONE_00_01 PEDREGOSO)
(isZone ZONE_00_02 PEDREGOSO)
(isZone ZONE_00_03 AGUA)
(isZone ZONE_01_00 PEDREGOSO)
(isZone ZONE_01_01 BOSQUE)
(isZone ZONE_01_02 PEDREGOSO)
(isZone ZONE_01_03 PEDREGOSO)
(isZone ZONE_02_00 PEDREGOSO)
(isZone ZONE_02_01 PRECIPICIO)
(isZone ZONE_02_02 Pedregoso)
(isZone ZONE_02_03 AGUA)
(isZone ZONE_03_00 BOSQUE)
(isZone ZONE_03_01 BOSQUE)
(isZone ZONE_03_02 PEDREGOSO)
(isZone ZONE_03_03 BOSQUE)

    
    ; ---> Conexiones
    ;; CONEXIONES
(camino ZONE_00_00 SUR ZONE_01_00)
(camino ZONE_00_00 ESTE ZONE_00_01)
(camino ZONE_00_01 SUR ZONE_01_01)
(camino ZONE_00_01 OESTE ZONE_00_00)
(camino ZONE_00_01 ESTE ZONE_00_02)
(camino ZONE_00_02 SUR ZONE_01_02)
(camino ZONE_00_02 OESTE ZONE_00_01)
(camino ZONE_00_02 ESTE ZONE_00_03)
(camino ZONE_00_03 SUR ZONE_01_03)
(camino ZONE_00_03 OESTE ZONE_00_02)
(camino ZONE_01_00 NORTE ZONE_00_00)
(camino ZONE_01_00 SUR ZONE_02_00)
(camino ZONE_01_00 ESTE ZONE_01_01)
(camino ZONE_01_01 NORTE ZONE_00_01)
(camino ZONE_01_01 SUR ZONE_02_01)
(camino ZONE_01_01 OESTE ZONE_01_00)
(camino ZONE_01_01 ESTE ZONE_01_02)
(camino ZONE_01_02 NORTE ZONE_00_02)
(camino ZONE_01_02 SUR ZONE_02_02)
(camino ZONE_01_02 OESTE ZONE_01_01)
(camino ZONE_01_02 ESTE ZONE_01_03)
(camino ZONE_01_03 NORTE ZONE_00_03)
(camino ZONE_01_03 SUR ZONE_02_03)
(camino ZONE_01_03 OESTE ZONE_01_02)
(camino ZONE_02_00 NORTE ZONE_01_00)
(camino ZONE_02_00 SUR ZONE_03_00)
(camino ZONE_02_00 ESTE ZONE_02_01)
(camino ZONE_02_01 NORTE ZONE_01_01)
(camino ZONE_02_01 SUR ZONE_03_01)
(camino ZONE_02_01 OESTE ZONE_02_00)
(camino ZONE_02_01 ESTE ZONE_02_02)
(camino ZONE_02_02 NORTE ZONE_01_02)
(camino ZONE_02_02 SUR ZONE_03_02)
(camino ZONE_02_02 OESTE ZONE_02_01)
(camino ZONE_02_02 ESTE ZONE_02_03)
(camino ZONE_02_03 NORTE ZONE_01_03)
(camino ZONE_02_03 SUR ZONE_03_03)
(camino ZONE_02_03 OESTE ZONE_02_02)
(camino ZONE_03_00 NORTE ZONE_02_00)
(camino ZONE_03_00 ESTE ZONE_03_01)
(camino ZONE_03_01 NORTE ZONE_02_01)
(camino ZONE_03_01 OESTE ZONE_03_00)
(camino ZONE_03_01 ESTE ZONE_03_02)
(camino ZONE_03_02 NORTE ZONE_02_02)
(camino ZONE_03_02 OESTE ZONE_03_01)
(camino ZONE_03_02 ESTE ZONE_03_03)
(camino ZONE_03_03 NORTE ZONE_02_03)
(camino ZONE_03_03 OESTE ZONE_03_02)

;; COSTES
(= (coste ZONE_00_00 ZONE_01_00) 10)
(= (coste ZONE_00_00 ZONE_00_01) 15)
(= (coste ZONE_00_01 ZONE_01_01) 7)
(= (coste ZONE_00_01 ZONE_00_00) 7)
(= (coste ZONE_00_01 ZONE_00_02) 15)
(= (coste ZONE_00_02 ZONE_01_02) 7)
(= (coste ZONE_00_02 ZONE_00_01) 7)
(= (coste ZONE_00_02 ZONE_00_03) 15)
(= (coste ZONE_00_03 ZONE_01_03) 7)
(= (coste ZONE_00_03 ZONE_00_02) 7)
(= (coste ZONE_01_00 ZONE_00_00) 10)
(= (coste ZONE_01_00 ZONE_02_00) 10)
(= (coste ZONE_01_00 ZONE_01_01) 10)
(= (coste ZONE_01_01 ZONE_00_01) 15)
(= (coste ZONE_01_01 ZONE_02_01) 10)
(= (coste ZONE_01_01 ZONE_01_00) 10)
(= (coste ZONE_01_01 ZONE_01_02) 15)
(= (coste ZONE_01_02 ZONE_00_02) 15)
(= (coste ZONE_01_02 ZONE_02_02) 7)
(= (coste ZONE_01_02 ZONE_01_01) 7)
(= (coste ZONE_01_02 ZONE_01_03) 15)
(= (coste ZONE_01_03 ZONE_00_03) 15)
(= (coste ZONE_01_03 ZONE_02_03) 7)
(= (coste ZONE_01_03 ZONE_01_02) 7)
(= (coste ZONE_02_00 ZONE_01_00) 10)
(= (coste ZONE_02_00 ZONE_03_00) 15)
(= (coste ZONE_02_00 ZONE_02_01) 10)
(= (coste ZONE_02_01 ZONE_01_01) 10)
(= (coste ZONE_02_01 ZONE_03_01) 10)
(= (coste ZONE_02_01 ZONE_02_00) 10)
(= (coste ZONE_02_01 ZONE_02_02) 10)
(= (coste ZONE_02_02 ZONE_01_02) 15)
(= (coste ZONE_02_02 ZONE_03_02) 10)
(= (coste ZONE_02_02 ZONE_02_01) 10)
(= (coste ZONE_02_02 ZONE_02_03) 15)
(= (coste ZONE_02_03 ZONE_01_03) 15)
(= (coste ZONE_02_03 ZONE_03_03) 7)
(= (coste ZONE_02_03 ZONE_02_02) 7)
(= (coste ZONE_03_00 ZONE_02_00) 7)
(= (coste ZONE_03_00 ZONE_03_01) 7)
(= (coste ZONE_03_01 ZONE_02_01) 10)
(= (coste ZONE_03_01 ZONE_03_00) 15)
(= (coste ZONE_03_01 ZONE_03_02) 10)
(= (coste ZONE_03_02 ZONE_02_02) 10)
(= (coste ZONE_03_02 ZONE_03_01) 10)
(= (coste ZONE_03_02 ZONE_03_03) 10)
(= (coste ZONE_03_03 ZONE_02_03) 15)
(= (coste ZONE_03_03 ZONE_03_02) 10)
  )

  (:goal
	(= (puntos-total) 12)
  	
  )
  (:metric minimize (distancia-total))
)
