class Snake {
  PVector posicion, velocidad, direccion;
  PImage image;
  int puntaje;
  float deltatime;
  Cabeza cabeza;
  ArrayList<Cuerpo> partes;
  
  Snake(PVector posicion, PImage image) {
    this.posicion = posicion;
    this.image = image;
    this.velocidad = new PVector(1, 0);
    this.direccion = new PVector(1, 0);
    this.puntaje = 0;
    this.deltatime = 0.016;
    this.cabeza = new Cabeza(posicion, image.width, image.height);
    this.partes = new ArrayList<Cuerpo>();
  }
  
  void mover() { //Analizar estar parte que creo que esta mal
    PVector nuevaPosicion = new PVector(posicion.x + direccion.x * velocidad.x, posicion.y + direccion.y * velocidad.y);
    partes.add(0, new Cuerpo(posicion, image.width, image.height));
    if (partes.size() > puntaje) {
      partes.remove(partes.size() - 1);
    }
    posicion = nuevaPosicion;
  }
  
  void crecer() {
    puntaje += 1;
  }
  
  void dibujar() {
    image(image, posicion.x, posicion.y);
    for (Cuerpo parte : partes) {
      parte.dibujar();
    }
  }
  
  boolean comer(Animal animal) { //Fijarse si esto esta mal
    if (dist(posicion.x, posicion.y, animal.posicion.x, animal.posicion.y) < 10) {
      crecer();
      puntaje += animal.puntaje;
      return true;
    }
    return false;
  }
}
