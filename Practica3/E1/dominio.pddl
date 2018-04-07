(define (domain Belkan)

; Includes!
  (:requirements :strips :equality :typing :fluents :adl)
  
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
	(orientado ?p - persona ?x - orientacion)
	
	;zonas
	(camino ?z1 - zona ?x - orientacion ?z2 - zona)
	
	)
	
(:functions
    (mano ?j - jugador)
    (coste ?z1 - zona ?z2 - zona)
)	

;Giros
(:action GIRA_DER
	:parameters (?j - jugador ?x ?x1  - orientacion ?z - zona)
	:precondition (and (en ?j ?z) (orientado ?j ?x) (siguienteDER ?x ?x1))
	:effect (and (not (orientado ?j ?x)) (orientado ?j ?x1))
	)
	
(:action GIRA_IZQ
	:parameters (?j - jugador ?x ?x1  - orientacion ?z - zona)
	:precondition (and (en ?j ?z) (orientado ?j ?x) (siguienteIZQ ?x ?x1))
	:effect (and (not (orientado ?j ?x)) (orientado ?j ?x1))
	)
	
;desplazarse de una zona a otra
(:action IR
	:parameters (?j - jugador ?x - orientacion ?z1 - zona ?z2 - zona)
	:precondition (and (en ?j ?z1) (orientado ?j ?x) (camino ?z1 ?x ?z2))
	:effect (and (not (en ?j ?z1)) (en ?j ?z2))
	)
	
(:action COGER
	:parameters (?j - jugador ?o - objeto ?z - zona)
	:precondition (and (en ?j ?z) (en ?o ?z) (< (mano ?j) 1))
	:effect (and (not (en ?o ?z)) (tiene ?j ?o) (increase (mano ?j) 1))
	)

(:action SOLTAR
	:parameters (?j - jugador ?o - objeto ?z - zona)
	:precondition (and (en ?j ?z) (tiene ?j ?o))
	:effect (and (not (tiene ?j ?o)) (en ?o ?z) (decrease (mano ?j) 1))
	)
	
(:action ENTREGAR
	:parameters (?j - jugador ?o - objeto ?z - zona ?p - personaje)
	:precondition (and (en ?j ?z) (en ?p ?z) (tiene ?j ?o) (quiere ?p ?o))
	:effect (and (not (tiene ?j ?o)) (tiene ?p ?o) (decrease (mano ?j) 1))
	)
	
)

	
	
	


	
