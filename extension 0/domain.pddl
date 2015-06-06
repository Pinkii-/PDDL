(define (domain mintask)
  (:requirements :fluents :equality )
  (:functions
    (nivel-tarea ?t - Tarea)
    (nivel-programador ?p - Programador)
  )
  (:types Tarea Programador)
  (:predicates 
    (tBasica ?t - Tarea)
    (finalizada ?t - Tarea)
  )

  (:action completar-tarea-basica
    :parameters (?t - Tarea ?p - Programador)
    :precondition (and (tBasica ?t) (>= (nivel-programador ?p) (nivel-tarea ?t)))
    :effect (and (not (tBasica ?t)) (finalizada ?t) )
  )

  (:action completar-tarea-basica-con-suplemento
    :parameters (?t - Tarea ?p - Programador)
    :precondition (and (tBasica ?t) (= (+ (nivel-programador ?p) 1) (nivel-tarea ?t)) )
    :effect (and (not (tBasica ?t)) (finalizada ?t) )
  )
)
