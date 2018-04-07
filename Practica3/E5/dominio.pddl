(define (domain Belkan)

; Includes!
  (:requirements :strips :typing :fluents)
  
;types

(:types localizable zona orientacion tipoterreno - object
		persona objeto - localizable
		jugador personaje - persona
		)
		
(:constants
	AGUA PRECIPICIO BOSQUE - tipoterreno
	BIKINI ZAPATILLAS - objeto
	)

(:predicates
	;orientacion
	(siguienteDER ?x1 - orientacion ?x2 - orientacion)
	(siguienteIZQ ?x1 - orientacion ?x2 - orientacion)
	
	;posicion
	(en ?l - localizable ?z - zona)
	
	;tenencia
	(tiene ?p - persona ?o - objeto)
	(guardado ?o - objeto)
	
	
	;orientado
	(orientado ?x - orientacion)
	
	;zonas
	(camino ?z1 - zona ?x - orientacion ?z2 - zona)
	(isZone ?z - zona ?t - tipoterreno)

	
	)
	
(:functions
    (mano)
    (mochila)
    (coste ?z1 - zona ?z2 - zona)
    (distancia-total)
    (puntos-entrega ?p - personaje ?o - objeto)
    (puntos-total)
    (tam-mochila)
)	

;Giros
(:action GIRA_DER
	:parameters (?x ?x1  - orientacion ?z - zona)
	:precondition (and (orientado ?x) (siguienteDER ?x ?x1))
	:effect (and (not (orientado ?x)) (orientado ?x1))
	)
	
(:action GIRA_IZQ
	:parameters (?x ?x1  - orientacion ?z - zona)
	:precondition (and (orientado ?x) (siguienteIZQ ?x ?x1))
	:effect (and (not (orientado ?x)) (orientado ?x1))
	)
	
;desplazarse de una zona a otra
(:action IR
	:parameters (?j - jugador ?x - orientacion ?z1 - zona ?z2 - zona ?t - tipoterreno ?o - objeto)
	:precondition (and (en ?j ?z1) (orientado ?x) (camino ?z1 ?x ?z2) (isZone ?z2 ?t)
				  (not (isZone ?z2 PRECIPICIO))
	)
	
	:effect (and 
				(when (and (= ?t AGUA) (or (tiene ?j BIKINI) (guardado BIKINI)))
					(and (not (en ?j ?z1)) (en ?j ?z2) (increase (distancia-total) (coste ?z1 ?z2))) )
				(when (and (= ?t BOSQUE) (or (tiene ?j ZAPATILLAS) (guardado ZAPATILLAS)))
					(and (not (en ?j ?z1)) (en ?j ?z2) (increase (distancia-total) (coste ?z1 ?z2))) )
				(when (or (= ?t ARENOSO) (= ?t PEDREGOSO))
					(and (not (en ?j ?z1)) (en ?j ?z2) (increase (distancia-total) (coste ?z1 ?z2))) )
		)
	)
	
(:action COGER
	:parameters (?j - jugador ?o - objeto ?z - zona)
	:precondition (and (en ?j ?z) (en ?o ?z) (< (mano) 1))
	:effect (and (not (en ?o ?z)) (tiene ?j ?o) (increase (mano) 1))
	)

(:action SOLTAR
	:parameters (?j - jugador ?o - objeto ?z - zona)
	:precondition (and (en ?j ?z) (tiene ?j ?o))
	:effect (and (not (tiene ?j ?o)) (en ?o ?z) (decrease (mano) 1))
	)
	
(:action ENTREGAR
	:parameters (?j - jugador ?o - objeto ?z - zona ?p - personaje)
	:precondition (and (en ?j ?z) (en ?p ?z) (tiene ?j ?o))
	:effect (and (not (tiene ?j ?o)) (decrease (mano) 1) (increase (puntos-total) (puntos-entrega ?p ?o)))
	)
	
(:action GUARDAR
    :parameters(?o - objeto ?j - jugador)
    :precondition(and (tiene ?j ?o) (< (mochila) (tam-mochila)))
    :effect(and (not (tiene ?j ?o)) (increase (mochila) 1) (decrease (mano) 1) (guardado ?o))
    )

(:action SACAR
    :parameters (?o - objeto ?j - jugador)
    :precondition(and (< (mano) 1) (guardado ?o))
    :effect(and (not (guardado ?o)) (increase (mano) 1) (decrease (mochila) 1) (tiene ?j ?o))
    )
    
    

)
	
	
	


	
