// First player places ball
// First player aim
// Balls move
// Evaluate
// Second player aim
// Balls move
// Evaluate


// Collision
// Ball enters holes
// Scratch
// All rules

void game() {
  background(200);
  image(table, width/2, height-480/2);


  

  /*
  for (int i = 0; i < myBalls.size(); i++) {
    objectBall = myBalls.get(i);
    objectBall.show();
    objectBall.act();
  }
  */
  
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
  
  
  println(pb.getX());
  
  world.step();
  world.draw();

  switch(gameState) {
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
