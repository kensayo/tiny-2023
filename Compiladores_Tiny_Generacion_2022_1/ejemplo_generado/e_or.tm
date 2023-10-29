*      Compilacion TINY para el codigo objeto TM
*      Archivo: NOMBRE_ARREGLAR
*      Preludio estandar:
0:       LD       6,0(0)      cargar la maxima direccion desde la localidad 0
1:       ST       0,0(0)      limpio el registro de la localidad 0
*      -> leer
2:       IN       0,0,0      leer: lee un valor entero
3:       ST       0,0(5)      leer: almaceno el valor entero leido en el id x
*      <- leer
*      -> if
*      -> Operacion: op_or
*      -> Operacion: igual
*      -> identificador
4:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
5:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
6:       LDC       0,1(0)      cargar constante: 1
*      <- constante
7:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
8:       SUB       0,1,0      op: ==
9:       JEQ       0,2(7)      voy dos instrucciones mas alla if verdadero (AC==0)
10:       LDC       0,0(0)      caso de falso (AC=0)
11:       LDA       7,1(7)      Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
12:       LDC       0,1(0)      caso de verdadero (AC=1)
*      <- Operacion: igual
13:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> Operacion: igual
*      -> identificador
14:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
15:       ST       0,-1(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> constante
16:       LDC       0,100(0)      cargar constante: 100
*      <- constante
17:       LD       1,-1(6)      op: pop o cargo de la pila el valor izquierdo en AC1
18:       SUB       0,1,0      op: ==
19:       JEQ       0,2(7)      voy dos instrucciones mas alla if verdadero (AC==0)
20:       LDC       0,0(0)      caso de falso (AC=0)
21:       LDA       7,1(7)      Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
22:       LDC       0,1(0)      caso de verdadero (AC=1)
*      <- Operacion: igual
23:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
24:       ADD       0,1,0      operacionn logica suma entre AC y AC1
25:       JNE       0,2(7)      verificar que AC sea diferente de 0
26:       LDC       0,0(0)      caso de falso (AC=0)
27:       LDA       7,1(7)      Salto incodicional a direccion: PC+1 (es falso evito colocarlo verdadero)
28:       LDC       0,1(0)      caso de verdadero (AC=1)
*      <- Operacion: op_or
*      If: el salto hacia el else debe estar aqui
*      -> escribir
*      -> constante
30:       LDC       0,100(0)      cargar constante: 100
*      <- constante
31:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
*      If: el salto hacia el final debe estar aqui
29:       JEQ       0,3(7)      if: jmp hacia else
*      -> escribir
*      -> constante
33:       LDC       0,200(0)      cargar constante: 200
*      <- constante
34:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
32:       LDA       7,2(7)      if: jmp hacia el final
*      <- if
*      Fin de la ejecucion.
35:       HALT       0,0,0