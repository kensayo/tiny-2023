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
*      -> Operacion: mayor_igual
*      -> constante
4:       LDC       0,5(0)      cargar constante: 5
*      <- constante
5:       ST       0,0(6)      op: push en la pila tmp el resultado expresion izquierda
*      -> identificador
6:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
7:       LD       1,0(6)      op: pop o cargo de la pila el valor izquierdo en AC1
8:       SUB       0,1,0      op: >=
9:       JGE       0,2(7)      voy instrucciones mas all?
10:       LDC       0,0(0)      case de falso (AC=0)
11:       LDA       7,1(7)      salto incondicional a la direcci?n PC + 1
12:       LDC       0,1(0)      caso verdadero (AC=1)
*      <- Operacion: mayor_igual
*      If: el salto hacia el else debe estar aqui
*      -> escribir
*      -> identificador
14:       LD       0,0(5)      cargar valor de identificador: x
*      -> identificador
15:       OUT       0,0,0      escribir: genero la salida de la expresion
*      <- escribir
*      If: el salto hacia el final debe estar aqui
13:       JEQ       0,3(7)      if: jmp hacia else
*      <- if
*      Fin de la ejecucion.
17:       HALT       0,0,0