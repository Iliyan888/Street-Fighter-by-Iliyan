PImage background;

//Kirby
PImage kirbyNormal;
PImage kirbyPunch;
PImage kirbyKick;
PImage kirbyAvoid;
PImage kirbyHurt;

//Mario
PImage marioNormal;
PImage marioPunch;
PImage marioKick;
PImage marioDefense;
PImage marioHurt;

PImage healthBarRed;
PImage healthBarYellow;

PImage fighter1;

float maxHealth;
float currentHealthLeft;
float currentHealthRight;

float healthBarWidthLeft;
float healthBarWidthRight;

float healthWidthLeft;
float healthWidthRight;

int marioSpeed;
int kirbySpeed;

float marioX;
float kirbyX;

int fighter1Counter;

void setup()
{
  size(800, 600);
  background = loadImage("FonsSF.jpg");
  marioNormal = loadImage("MariospriteNormal.png");
  kirbyNormal = loadImage("KirbyspriteNormal.png");
  healthBarRed = loadImage("HealthBar.png");
  healthBarYellow = loadImage("HealthBarYellow.png");

  marioPunch = loadImage("MariospritePunch.png");
  
  marioDefense = loadImage("MariospriteDefense.png");

  maxHealth = 100;
  currentHealthLeft = 100;
  currentHealthRight = 100;

  marioX = width/4;
  kirbyX = width - width/4;

  marioSpeed = 10;
  kirbySpeed = 12;

  healthBarWidthLeft = currentHealthLeft / maxHealth * 300;
  healthBarWidthRight = currentHealthRight / maxHealth * 300;

  healthWidthLeft = currentHealthLeft / maxHealth * 300;
  healthWidthRight = currentHealthRight / maxHealth * 300;

  fighter1 = marioNormal;

  fighter1Counter = 0;
}

void draw()
{
  image(background, 0, 0, width, height);
  image(fighter1, marioX, height - height/4 - height/80, width/10, height/6);

  image(kirbyNormal, kirbyX, height - height/4 + height/25, width/12, width/12);
  
  fighter1Counter++;

  if (fighter1Counter == 2)
  {
    fighter1 = marioNormal;
  }

  healthBars();
}

void healthBars()
{
  fill(255, 0, 0);
  rect(width/20, height/20, healthBarWidthLeft, height/14);

  fill(255, 255, 0);
  rect(width/20, height/20, healthWidthLeft, height/14);

  fill(255, 0, 0);
  rect(width - width/20, height/20, -healthBarWidthRight, height/14);

  fill(255, 255, 0);
  rect(width - width/20, height/20, -healthWidthRight, height/14);

  healthWidthLeft = healthWidthLeft - 1;

  healthWidthRight = healthWidthRight - 1;

  if (healthWidthLeft <= 0)
  {
    healthWidthLeft = 0;
  }

  if (healthWidthRight <= 0)
  {
    healthWidthRight = 0;
  }
}

void keyPressed()
{
  if (key == 'a' || key == 'A')
  {
    marioX = marioX - marioSpeed;
  }

  if (key == 'd' || key == 'D')
  {
    marioX = marioX + marioSpeed;
  }

  if (key == 'x' || key == 'X')
  {
    fighter1 = marioPunch;
    fighter1Counter = 0;
  }

  if (key == 's' || key == 'S')
  {
    fighter1 = marioDefense;
    fighter1Counter = -5;
  }
}

void characters()
{
  if (marioX <= 0)
  {
    marioX = 0;
  }
  
  if (marioX + width/10 >= width)
  {
   marioX = width - width/10;
  }
}