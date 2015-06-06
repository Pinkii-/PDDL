(define (domain mintask)
  (:requirements :fluents :equality :strips :typing)
  (:functions
    (tiempo-tarea ?t - Tarea)
    (nivel-tarea ?t - Tarea)
    (nivel-programador ?p - Programador)
    (calidad ?p - Programador)
    (tareas-programador ?p - Programador)
    (ttime)
    (nprog)
  )
  (:types Tarea Programador)
  (:predicates 
    (tSimple ?t - Tarea)
    (tRevisada ?t - Tarea ?p - Programador)
    (finalizada ?t - Tarea)
    (por-contar ?p - Programador)
    (contado ?p - Programador)
  )

  (:action completar-tarea-simple
    :parameters (?t - Tarea ?p - Programador)
    :precondition (and (tSimple ?t) (>= (nivel-programador ?p) (nivel-tarea ?t)) (> (tareas-programador ?p) 0))
    :effect (and (not (tSimple ?t)) (tRevisada ?t ?p) (increase (ttime) (+ (tiempo-tarea ?t) (calidad ?p))) (decrease (tareas-programador ?p) 1) (por-contar ?p))
  )

  (:action completar-tarea-simple-con-suplemento
    :parameters (?t - Tarea ?p - Programador)
    :precondition (and (tSimple ?t) (= (+ (nivel-programador ?p) 1) (nivel-tarea ?t)) (> (tareas-programador ?p) 0))
    :effect (and (not (tSimple ?t)) (tRevisada ?t ?p) (increase (ttime) (+ (+ (tiempo-tarea ?t) 2) (calidad ?p))) (decrease (tareas-programador ?p) 1) (por-contar ?p))
  )

  (:action completar-tarea-revisada
    :parameters (?t - Tarea ?p2 ?p1 - Programador )
    :precondition (and (tRevisada ?t ?p2) (not (= ?p1 ?p2)) (>= (+ (nivel-programador ?p1) 1) (nivel-tarea ?t)) (> (tareas-programador ?p1) 0))
    :effect (and (not (tRevisada ?t ?p2)) (finalizada ?t) (decrease (tareas-programador ?p1) 1) (por-contar ?p1))
  )

  (:action contar-programador
    :parameters (?p - Programador)
    :precondition (and (not (contado ?p)) (por-contar ?p))
    :effect (and (contado ?p) (increase (nprog) 1))
  )

)
