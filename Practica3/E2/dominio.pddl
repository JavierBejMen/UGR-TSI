(define (domain Belkan)

; Includes!
  (:requirements :strips :typing :fluents)
  
;types

(:types localizable zona orientacion - object
		persona objeto - localizable
		jugador personaje - persona)

(:predicates
	;orientacion
	(siguienteDER ?x1 - orientacion ?x2 - orientacion)
	(siguienteIZQ ?x1 - orientacion ?x2 - orientacion)
	
	;posicion
	(en ?l - localizable ?z - zona)
	
	;tenencia
	(tiene ?p - persona ?o - objeto)
	(quiere ?p - personaje ?o - objeto)
	
	;orientado
	(orientado ?x - orientacion)
	
	;zonas
	(camino ?z1 - zona ?x - orientacion ?z2 - zona)
	)
	
(:functions
    (mano)
    (coste ?z1 - zona ?z2 - zona)
    (distancia-total)
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
	:parameters (?j - jugador ?x - orientacion ?z1 - zona ?z2 - zona)
	:precondition (and (en ?j ?z1) (orientado ?x) (camino ?z1 ?x ?z2))
	:effect (and (not (en ?j ?z1)) (en ?j ?z2) (increase (distancia-total) (coste ?z1 ?z2)))
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
	:precondition (and (en ?j ?z) (en ?p ?z) (tiene ?j ?o) (quiere ?p ?o))
	:effect (and (not (tiene ?j ?o)) (tiene ?p ?o) (decrease (mano) 1))
	)
)

	
	
	


	
