#include <avr/pgmspace.h>  

int pins[4];
int blinkdelay = 200;   
int runspeed = 150;      

const int ledPins[12][2] ={ 
  {
    3,0  } 
  , 
  {
    3,2  }
  ,
  {
    3,1  }
  ,
  {
    2,0  }
  ,
  {
    2,3  }
  ,
  {
    2,1  }
  ,
  {
    1,0  }
  ,
  {
    1,2  }
  ,
  {
    1,3  }
  , 
  {
    0,3  }
  ,
  {
    0,2  }
  ,
  {
    0,1  }
  ,


};
int val = 0; //for the rotatory switch

void setup()   {                

  pins[0] = 2;
  pins[1] = 3;
  pins[2] = 4;
  pins[3] = 5;

  Serial.begin(9600);
  
}
void loop()                     
{
  val = analogRead(5);
  Serial.println(val);
  if(val<570){
    ledSpecify(ledPins[0][0], ledPins[0][1]);
  }
  else if(val >569 && val < 635){
    ledSpecify(ledPins[1][0], ledPins[1][1]);
  }
    else if(val >635 && val < 725){
    ledSpecify(ledPins[2][0], ledPins[2][1]);
  }
    else if(val >725 && val < 780){
    ledSpecify(ledPins[3][0], ledPins[3][1]);
  }
    else if(val >780 && val < 820){
    ledSpecify(ledPins[4][0], ledPins[4][1]);
  }
    else if(val >820 && val < 850){
    ledSpecify(ledPins[5][0], ledPins[5][1]);
  }
    else if(val >850 && val < 875){
    ledSpecify(ledPins[6][0], ledPins[6][1]);
  }  
  else if(val >875 && val < 895){
    ledSpecify(ledPins[7][0], ledPins[7][1]);
  } 
  else if(val >895 && val < 915){
    ledSpecify(ledPins[8][0], ledPins[8][1]);
  }  
  else if(val >915 && val < 935){
    ledSpecify(ledPins[9][0], ledPins[9][1]);
  }
  else if(val >935 && val < 948){
    ledSpecify(ledPins[10][0], ledPins[10][1]);
  }
  else if(val >948 && val < 965){
    ledSpecify(ledPins[11][0], ledPins[11][1]);
  }
}

void ledSpecify(int highPin, int lowPin) // This allows you to manually control which pin goes low & which one goes high
{
  for(int i; i < 4; i++){
    pinMode(pins[i], INPUT);
  }
  pinMode(pins[highPin], OUTPUT); 
  digitalWrite(pins[highPin], HIGH);
  pinMode(pins[lowPin], OUTPUT); 
  digitalWrite(pins[lowPin], LOW); 
}
