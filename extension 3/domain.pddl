(define (domain mintask)
  (:requirements :fluents :equality )
  (:functions
    (tiempo-tarea ?t - Tarea)
    (nivel-tarea ?t - Tarea)
    (nivel-programador ?p - Programador)
    (calidad ?p - Programador)
    (tareas-programador ?p - Programador)
    (ttime)
  )
  (:types Tarea Programador)
  (:predicates 
    (tBasica ?t - Tarea)
    (tPorRevisar ?t - Tarea ?p - Programador)
    (finalizada ?t - Tarea)
  )

  (:action completar-tarea-basica
    :parameters (?t - Tarea ?p - Programador)
    :precondition (and (tBasica ?t) (>= (nivel-programador ?p) (nivel-tarea ?t)) (> (tareas-programador ?p) 0))
    :effect (and (not (tBasica ?t)) (tPorRevisar ?t ?p) (increase (ttime) (+ (tiempo-tarea ?t) (calidad ?p))) (decrease (tareas-programador ?p) 1) )
  )

  (:action completar-tarea-basica-con-suplemento
    :parameters (?t - Tarea ?p - Programador)
    :precondition (and (tBasica ?t) (= (+ (nivel-programador ?p) 1) (nivel-tarea ?t)) (> (tareas-programador ?p) 0))
    :effect (and (not (tBasica ?t)) (tPorRevisar ?t ?p) (increase (ttime) (+ (+ (tiempo-tarea ?t) 2) (calidad ?p))) (decrease (tareas-programador ?p) 1) )
  )

  (:action completar-tarea-por-revisar
    :parameters (?t - Tarea ?p2 ?p1 - Programador )
    :precondition (and (tPorRevisar ?t ?p2) (not (= ?p1 ?p2)) (>= (+ (nivel-programador ?p1) 1) (nivel-tarea ?t)) (> (tareas-programador ?p1) 0))
    :effect (and (not (tPorRevisar ?t ?p2)) (finalizada ?t) (decrease (tareas-programador ?p1) 1) )
  )
)
