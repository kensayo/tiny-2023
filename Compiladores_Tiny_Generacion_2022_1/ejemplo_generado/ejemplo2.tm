0:       LD       6,0(0)      cargar la maxima direccion desde la localidad 0
1:       ST       0,0(0)      limpio el registro de la localidad 0
*      -> asignacion
*      -> constante
2:       LDC       0,5(0)      cargar constante: 5
*      <- constante
3:       ST       0,0(5)      asignacion: almaceno el valor para el id x
*      <- asignacion
*      -> escribir
*      -> identificador
4:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
5:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
*      -> leer
6:       IN       0,0,0      leer: lee un valor entero
7:       ST       0,0(5)      leer: almaceno el valor entero leido en el id x
*      <- leer
*      -> escribir
*      -> identificador
8:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
9:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
*      -> if
*      -> Operacion: menor
*      -> constante
10:       LDC       0,4(0)      cargar constante: 4
*      <- constante
11:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> identificador
12:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
13:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
14:       SUB       0,1,0      op: <
15:       JLT       0,2(7)      voy dos instrucciones mas alla if verdadero (AC<0)
16:       LDC       0,0(0)      caso de falso (AC=0)
17:       LDA       7,1(7)      Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
18:       LDC       0,1(0)      caso de verdadero (AC=1)
*      <- Operacion: menor
*      If: el salto hacia el else debe estar aqui
*      -> escribir
*      -> constante
20:       LDC       0,100(0)      cargar constante: 100
*      <- constante
21:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
*      If: el salto hacia el final debe estar aqui
19:       JEQ       0,3(7)      if: jmp hacia else
*      -> escribir
*      -> constante
23:       LDC       0,200(0)      cargar constante: 200
*      <- constante
24:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
22:       LDA       7,2(7)      if: jmp hacia el final
*      <- if
*      Fin de la ejecucion.
25:       HALT       0,0,0