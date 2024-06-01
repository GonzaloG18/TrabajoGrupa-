class Juego {
  int tiempo;
  Snake snake;
  Animal animal;
  Escenario escenario;
  
  void setup() {
    size(600, 600);
    tiempo = 0;
    snake = new Snake(new PVector(width/2, height/2), loadImage("snake_head.png"));
    escenario = new Escenario();
    animal = escenario.generarAnimal();
  }
  
  void draw() {
    background(255);
    tiempo += 1;
    snake.mover();
    snake.dibujar();
    animal.dibujar();
    
    if (snake.comer(animal)) {
      animal = escenario.generarAnimal();
    }
  }
  
  void keyPressed() {
    if (keyCode == UP) {
      snake.direccion = new PVector(0, -1);
    } else if (keyCode == DOWN) {
      snake.direccion = new PVector(0, 1);
    } else if (keyCode == LEFT) {
      snake.direccion = new PVector(-1, 0);
    } else if (keyCode == RIGHT) {
      snake.direccion = new PVector(1, 0);
    }
  }
}
