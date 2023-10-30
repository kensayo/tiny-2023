package ve.edu.unet.nodosAST;

import ve.edu.unet.TablaSimbolos;

public class Semantico {
    private static TablaSimbolos tablaSimbolos = null;

    public static void setTablaSimbolos(TablaSimbolos tabla) {
        tablaSimbolos = tabla;
    }

    public static void checkTree(NodoBase raiz, Boolean isLogic) throws Exception {
        while (raiz != null) {
            /* Hago el recorrido recursivo */
            if (raiz instanceof NodoIf) {
                checkLogicStatement(((NodoIf) raiz).getPrueba(), "IF");
                checkTree(((NodoIf) raiz).getPrueba(), true);
                checkTree(((NodoIf) raiz).getParteThen(), false);
                if (((NodoIf) raiz).getParteElse() != null) {
                    checkTree(((NodoIf) raiz).getParteElse(), false);
                }
            }

            raiz = raiz.getHermanoDerecha();
        }
    }

    public static void checkOperation(NodoBase expresion, String variable, Boolean isLogic) throws Exception {

        if (expresion instanceof NodoValor) {
            return;
        }
        if (expresion instanceof NodoOperacion) {
            // +, -, *, /
            tipoOp operacion = ((NodoOperacion) expresion).getOperacion();
            if (isLogic) {
                switch (operacion) {
                    case mas:
                    case menos:
                    case por:
                    case entre:
                    case igual:
                    case mayor:
                    case mayor_igual:
                    case menor:
                    case menor_igual:
                    case op_and:
                    case op_or:
                        break;
                    default:
                        throw new Exception("Error: Operacion '" + operacion + "' no permitida sobre " + variable + " de tipo entero");
                }
            } else {
                switch (operacion) {
                    case mas:
                    case menos:
                    case por:
                    case entre:
                        break;
                    default:
                        throw new Exception("Error: Operacion '" + operacion + "' no permitida sobre " + variable + " de tipo entero");
                }
            }
        }
        else {
            throw new Exception("Error: Operacion desconocida no permitida sobre entero");
        }
    }

    public static void checkLogicStatement(NodoBase pruebaLogica, String statement) throws Exception {

        if (pruebaLogica instanceof NodoIdentificador) {
            return;
        }

        if (pruebaLogica instanceof NodoOperacion) {
            tipoOp operacion = ((NodoOperacion) pruebaLogica).getOperacion();
            switch (operacion) {
                case igual:
                case mayor:
                case mayor_igual:
                case menor:
                case menor_igual:
                case op_and:
                case op_or:
                    break;
                default:
                    throw new Exception("Error: Operacion '" + operacion + "' no permitida sobre " + statement);
            }
        } else {
            throw new Exception("Error: Operacion desconocida no permitida sobre " + statement);
        }
    }

}