;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Primer Punto|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;1) Utilizando la definicion recursiva de las listas, implemente la funcion elementoN-lista, esta
;funcioon recibe una lista y retorna el elemento N de la lista.
(define elemtoN-lista
  (lambda (lista indice)
  ;Creacion de sentencia if si el indice es igual a 0 significa que llego a la posicion de del indice
  (if(equal? indice 0)
  ; caso #true Retorna el primer elemento de la Lista
     (car lista)
  ; caso #else realiza un llamado recursivo con el restode la listo original mas el indice decrementado en 1
     (elemtoN-lista(cdr lista)(- indice 1) )
     )
  )
  )
;Casos de Prueba
;(elemtoN-lista (list 9 8 4 5 85 1 8 ) 2)
;(elemtoN-lista (list 9 8 4 5 12 89 8) 5)
;(elemtoN-lista (list 1 2 3 4 ) 3)
;(elemtoN-lista (list 9 8 4 5 7 10 ) 4)

;Esta es una prueba como enviar fuciones como parametros
(define test
  (lambda (funcion lista indice)
    (funcion lista indice)
  )
 )
;(test elemtoN-lista (list 100 99 98 97 96 95 94 93) 4)

;2) 
;Funcion que realiza el calculo de Manhathan
(define manhathan
  (lambda(primera-lista segunda-lista acomulador)
    (if (or (null? primera-lista)(null? segunda-lista) )
        (display acomulador);Si la lista es vacia retorne el acomulador
        ;Caso Else llamada a la funcio de forma recursiva
        (manhathan (cdr primera-lista)( cdr segunda-lista)
         (+ acomulador
           (abs (- (car segunda-lista) (car primera-lista)));Calculo de la resta de las dos coordenadas
           )
         )         
        )
    )
)

;Funcion que realiza el calculo de Linerarecta
(define linearecta
  (lambda(primera-lista segunda-lista acomulador)
    (if (or (null? primera-lista)(null? segunda-lista) )
        (display (sqrt acomulador));Si la lista es vacia retorne el acomulador
        ;Caso Else llamada a la funcio de forma recursiva
        (linearecta (cdr primera-lista)( cdr segunda-lista)
         (+ acomulador
           (expt (- (car segunda-lista) (car primera-lista)) 2)
           )
         )         
        )
    )
)
;;Funcion final
(define distancia-puntos
  (lambda(lista funcion)
    (if(= (length(car lista)) (length(cadr lista)))
       (funcion (car lista)(cadr lista) 0)
       (display "Error de argumentos al llamar a distacia-puntos")
    )
  )
)
;; Prueba del Calculo de distancias
(distancia-puntos (list (list 1 2 3 4 ) (list 4 3 2 1 )) manhathan )
(distancia-puntos (list (list 1 2 3 4 ) (list 4 3 2 1 )) linearecta )