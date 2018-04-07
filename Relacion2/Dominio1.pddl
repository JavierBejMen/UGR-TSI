(define (domain zeno-travel)


(:requirements
  :typing
  :fluents
  :derived-predicates
  :negative-preconditions
  :universal-preconditions
  :disjuntive-preconditions
  :conditional-effects
  :htn-expansion

  ; Requisitos adicionales para el manejo del tiempo
  :durative-actions
  :metatags
 )

(:types aircraft person city - object)
(:constants slow fast - object)
(:predicates (at ?x - (either person aircraft) ?c - city)
             (in ?p - person ?a - aircraft)
             (different ?x ?y) (igual ?x ?y)
             (hay-fuel ?a ?c1 ?c2) (hay-fuel-fast ?a ?c1 ?c2)
	     (puede-fast ?a ?c1 ?c2)
             )
(:functions (fuel ?a - aircraft)
            (distance ?c1 - city ?c2 - city)
            (slow-speed ?a - aircraft)
            (fast-speed ?a - aircraft)
            (slow-burn ?a - aircraft)
            (fast-burn ?a - aircraft)
            (capacity ?a - aircraft)
            (refuel-rate ?a - aircraft)
            (total-fuel-used)
            (boarding-time)
            (debarking-time)
	    (fuel-limit)
            )

;; el consecuente "vacio" se representa como "()" y significa "siempre verdad"
(:derived
  (igual ?x ?x) ())

(:derived 
  (different ?x ?y) (not (igual ?x ?y)))



;; este literal derivado se utiliza para deducir, a partir de la información en el estado actual, 
;; si hay fuel suficiente para que el avión ?a vuele de la ciudad ?c1 a la ?c2
;; el antecedente de este literal derivado comprueba si el fuel actual de ?a es mayor que 1. 
;; En este caso es una forma de describir que no hay restricciones de fuel. Pueden introducirse una
;; restricción más copleja  si en lugar de 1 se representa una expresión más elaborada (esto es objeto de
;; los siguientes ejercicios).
(:derived 
  
  (hay-fuel ?a - aircraft ?c1 - city ?c2 - city)
  (> (fuel ?a) (* (distance ?c1 ?c2) (slow-burn ?a))))



(:derived 
  
  (hay-fuel-fast ?a - aircraft ?c1 - city ?c2 - city)
  (> (fuel ?a) (* (distance ?c1 ?c2) (fast-burn ?a))))

(:derived
	(puede-fast ?a - aircraft ?c1 - city ?c2 - city)
	(< (+   (total-fuel-used) (* (distance ?c1 ?c2) (fast-burn ?a))   )   (fuel-limit)  )
)

(:task transport-person
	:parameters (?p - person ?c - city)
	
  (:method Case1 ; si la persona est� en la ciudad no se hace nada
	 :precondition (at ?p ?c)
	 :tasks ()
   )
	 
   
   (:method Case2 ;si no est� en la ciudad destino, pero avion y persona est�n en la misma ciudad
	  :precondition (and (at ?p - person ?c1 - city)
			                 (at ?a - aircraft ?c1 - city))
				     
	  :tasks ( 
	  	      (board ?p ?a ?c1)
		        (mover-avion ?a ?c1 ?c)
		        (debark ?p ?a ?c )))

(:method Case3 ; no hay avion en la ciudad por lo que hay que enviar el avion a recoger al pasajero
		:precondition (and (at ?p - person ?c1 - city) (at ?a - aircraft ?c2 - city) (different ?c1 ?c2))
		:tasks (
				(mover-avion ?a ?c2 ?c1)
				(board ?p ?a ?c1)
				(mover-avion ?a ?c1 ?c)
				(debark ?p ?a ?c)))

	)

(:task mover-avion
:parameters (?a - aircraft ?c1 - city ?c2 -city)
	(:method prioriza-rapido
	:precondition (puede-fast ?a ?c1 ?c2)
	:tasks(
		(vuela-fast ?a ?c1 ?c2)
		)
	)

	(:method lento
	:precondition (not (puede-fast ?a ?c1 ?c2))
	:tasks (
		(vuela-slow ?a ?c1 ?c2)
		)
	)
)
 

(:task vuela-fast
:parameters (?a - aircraft ?c1 - city ?c2 -city)
	(:method fuel-suficiente-fast
	:precondition (hay-fuel-fast ?a ?c1 ?c2)
	:tasks (
		(zoom ?a ?c1 ?c2)
         	)
   	)
	
	(:method need-repostar-fast
	:precondition (not (hay-fuel-fast ?a ?c1 ?c2))
	:tasks (
		(refuel ?a ?c1)
		(zoom ?a ?c1 ?c2)
		)
	)
)

(:task vuela-slow

:parameters (?a - aircraft ?c1 - city ?c2 -city)
 (:method fuel-suficiente 
  :precondition (hay-fuel ?a ?c1 ?c2)
  :tasks (
          (fly ?a ?c1 ?c2)
         )
   )

	(:method need-repostar
		:precondition (not (hay-fuel ?a ?c1 ?c2))
		:tasks(
			(refuel ?a ?c1)
			(fly ?a ?c1 ?c2)
			)
		)
  )
		
 
(:import "Primitivas-Zenotravel.pddl") 


)
