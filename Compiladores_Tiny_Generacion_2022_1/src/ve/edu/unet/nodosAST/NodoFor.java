package ve.edu.unet.nodosAST;

public class NodoFor extends NodoBase{
    private NodoBase cuerpo;
    private NodoBase condicion;
    private NodoBase asignaP;
    private NodoBase asignaT;
    public NodoFor(NodoBase asignaP,NodoBase condicion,NodoBase asignaT, NodoBase cuerpo) {
        super();
        this.cuerpo = cuerpo;
        this.condicion = condicion;
        this.asignaP = asignaP;
        this.asignaT = asignaT;
    }

    public void setCuerpo(NodoBase cuerpo) { this.cuerpo = cuerpo; }
    public NodoBase getCuerpo() { return cuerpo; }
    public NodoBase getCondicion() {
        return condicion;
    }
    public void setCondicion(NodoBase condicion) {
        this.condicion = condicion;
    }
    public NodoBase getAsignaP() { return asignaP; }
    public void setAsignaP(NodoBase asignaP) {
        this.asignaP = asignaP;
    }
    public NodoBase getAsignaT() {
        return asignaT;
    }
    public void setAsignaT(NodoBase asignaT) {
        this.asignaT = asignaT;
    }
}
