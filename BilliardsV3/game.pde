// Collision
// Ball enters holes
// Scratch
// All rules

void game() {
  background(200);
  image(table, width/2-table.width/2, height-240-table.height/2);
  
  /*
  rect(85, 95, 370, 10); // Testing
  rect(505, 95, 370, 10);
  rect(85, 495, 370, 10);
  rect(505, 495, 370, 10);
  rect(40, 135, 10, 325);
  rect(910, 135, 10, 325);
  ellipse(60, 115, 26, 26);
  */

  if (newGame) newGame();
  
  world.step();
  world.draw();
  
  
  int gameWon = 0;
  for (int i = 0; i < myBalls.size(); i++) {
    Ball b = myBalls.get(i);
    if (
      dist(b.getX(), b.getY(), 50, 107) < 16 ||
      dist(b.getX(), b.getY(), 50, 498) < 16 ||
      dist(b.getX(), b.getY(), 910, 107) < 16 ||
      dist(b.getX(), b.getY(), 910, 498) < 16 ||
      dist(b.getX(), b.getY(), 480, 107) < 16 ||
      dist(b.getX(), b.getY(), 480, 498) < 16 
    ) {
      if (i == 0) mode = GAMEOVER;
      world.remove(b);
      myBalls.remove(i);
    }
    gameWon += i;
  }
  
  if (gameWon == 0 || keyPressed && key=='5') mode = GAMEWON;
  
  switch(gameState) { // Potential for V4 with proper game rules, two player, and proper velocity input
  case PLAYERBEGIN:
    playerBegin();
    break;
  case PLAYERPLACE:
    playerPlace();
    break;
  case PLAYERSHOOT:
    playerShoot();
    break;
  case CALCULATE:
    calculate();
    break;
  case EVALUATE:
    evaluate();
    break;
  default:
    println("GAMESTATE ERROR. ERROR = " + gameState);
  }
}
