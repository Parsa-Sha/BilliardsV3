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

  for (int i = 0; i < myBalls.size(); i++) {
    objectBall = myBalls.get(i);
    objectBall.show();
    objectBall.act();
  }

  /*
  rect(85, 95, 370, 10); // Testing
   rect(505, 95, 370, 10);
   rect(85, 495, 370, 10);
   rect(505, 495, 370, 10);
   rect(40, 135, 10, 325);
   rect(910, 135, 10, 325);
   ellipse(60, 115, 26, 26);
   */

  if (newGame) { // Reset game code
    newGame = false;

    for (int i = 0; i < ballArrangement.length; i++) ballArrangement[i] = 16;
    ballArrangement[0] = 1; // Set one ball and eight ball ids
    ballArrangement[4] = 8;
    boolean isNew = false;
    int idCandidate = 16;
    int selectionCleared = 0;
    for (int i = 0; i < ballArrangement.length; i++) {
      if (i != 0 && i != 4) {
        while (!isNew) {
          idCandidate = floor(random(2, 16));
          for (int j = 0; j < ballArrangement.length; j++) {
            if (ballArrangement[j] != idCandidate) selectionCleared++; // Checking if random placement is not equal to an already placed ball
          }
          if (selectionCleared == ballArrangement.length) {
            isNew = true;
          } else {
            selectionCleared = 0;
          }
        }
        ballArrangement[i] = idCandidate;
        isNew = false;
        selectionCleared = 0; // Place id into index, then reset
      }
    }

    myBalls = new ArrayList<Ball>();
    world = new FWorld();
    world.setGravity(0, 0);
    PlayerBall pb = new PlayerBall();
    myBalls.add(pb);
    world.add(pb);

    // Create all six bumpers
    FBox topLeft = new FBox(370, 10);
    FBox topRight = new FBox(370, 10);
    FBox bottomLeft = new FBox(370, 10);
    FBox bottomRight = new FBox(370, 10);
    FBox left = new FBox(10, 325);
    FBox right = new FBox(10, 325);
    topLeft.setPosition(270, 100); 
    topRight.setPosition(505 + 185, 500);
    bottomLeft.setPosition(270, 100);
    bottomRight.setPosition(270, 100);
    left.setPosition(270, 100);
    right.setPosition(270, 100);
    


    /*
     rect(85, 95, 370, 10); // Testing
     rect(505, 95, 370, 10);
     rect(85, 495, 370, 10);
     rect(505, 495, 370, 10);
     rect(40, 135, 10, 325);
     rect(910, 135, 10, 325);
     ellipse(60, 115, 26, 26);
     */


    int bpi = 1; // Ball placed index, used to refrence which ball should be placed where
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5-i; j++) {
        Ball b = new Ball();
        myBalls.add(b);
        world.add(b);
        b.attachImage(ballImages[ballArrangement[15-bpi]]);
        b.setPosition(800 - i*22.52, 250 + j*26 + i*13);
        b.setFriction(0.5);
        b.setGrabbable(false);
        bpi++;
      }
    }
  } // End of newGame code


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
