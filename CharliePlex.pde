#include <avr/pgmspace.h> 

const unsigned long gcCycleDelta = 1000;
const unsigned long gcAnalogDelta = 25;
const unsigned long gcButtonDelta = 500;
unsigned long gNextTime = 0;
unsigned int gCurrentStep = 0;
int pins[4];
int pinstwo[4];
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
int val = 0;
int val2 = 0;
void setup() {
Serial.begin(9600);
    Joystick.begin(true);
  pinstwo[0] = 2;
  pinstwo[1] = 3;
  pinstwo[2] = 4;
  pinstwo[3] = 5;

  pins[0] = 8;
  pins[1] = 9;
  pins[2] = 10;
  pins[3] = 11;
  pinMode(A0, INPUT_PULLUP);
  pinMode(13, OUTPUT);
}

void loop() {

  Joystick.setXAxis((analogRead(4)/10));
 val = analogRead(5);
  val2 = analogRead(0);
  Serial.println(val);
  if(val<570){
    //ledSpecify(ledPins[0][0], ledPins[0][1]);
    ledSpecify(ledPins[9][0], ledPins[9][1]);
  }
  else if(val >569 && val < 635){
    //ledSpecify(ledPins[1][0], ledPins[1][1]);
    ledSpecify(ledPins[4][0], ledPins[4][1]);
  }
    else if(val >635 && val < 725){
    //ledSpecify(ledPins[2][0], ledPins[2][1]);
    ledSpecify(ledPins[8][0], ledPins[8][1]);
  }
    else if(val >725 && val < 780){
    //ledSpecify(ledPins[3][0], ledPins[3][1]);
    ledSpecify(ledPins[10][0], ledPins[10][1]);
  }
    else if(val >780 && val < 820){
    //ledSpecify(ledPins[4][0], ledPins[4][1]);
    ledSpecify(ledPins[1][0], ledPins[1][1]);
  }
    else if(val >820 && val < 850){
    //ledSpecify(ledPins[5][0], ledPins[5][1]);
    ledSpecify(ledPins[7][0], ledPins[7][1]);
  }
    else if(val >850 && val < 875){
    //ledSpecify(ledPins[6][0], ledPins[6][1]);
    ledSpecify(ledPins[11][0], ledPins[11][1]);
  }  
  else if(val >875 && val < 895){
    //ledSpecify(ledPins[7][0], ledPins[7][1]);
    ledSpecify(ledPins[5][0], ledPins[5][1]);
  } 
  else if(val >895 && val < 915){
    //ledSpecify(ledPins[8][0], ledPins[8][1]);
    ledSpecify(ledPins[2][0], ledPins[2][1]);
  }  
  else if(val >915 && val < 935){
    //ledSpecify(ledPins[9][0], ledPins[9][1]);
    ledSpecify(ledPins[0][0], ledPins[0][1]);
  }
  else if(val >935 && val < 948){
    //ledSpecify(ledPins[10][0], ledPins[10][1]);
    ledSpecify(ledPins[3][0], ledPins[3][1]);
  }
  else if(val >948 && val < 965){
    
    ledSpecify(ledPins[6][0], ledPins[6][1]);
  }
    if(val2<570){
    //ledSpecify(ledPins[0][0], ledPins[0][1]);
    ledSpecifytwo(ledPins[9][0], ledPins[9][1]);
  }
  else if(val2 >569 && val2 < 635){
    //ledSpecify(ledPins[1][0], ledPins[1][1]);
    ledSpecifytwo(ledPins[4][0], ledPins[4][1]);
  }
    else if(val2 >635 && val2 < 725){
    //ledSpecify(ledPins[2][0], ledPins[2][1]);
    ledSpecifytwo(ledPins[8][0], ledPins[8][1]);
  }
    else if(val2 >725 && val2 < 780){
    //ledSpecify(ledPins[3][0], ledPins[3][1]);
    ledSpecifytwo(ledPins[10][0], ledPins[10][1]);
  }
    else if(val2 >780 && val2 < 830){
    //ledSpecify(ledPins[4][0], ledPins[4][1]);
    ledSpecifytwo(ledPins[1][0], ledPins[1][1]);
  }
    else if(val2 >830 && val2 < 855){
    //ledSpecify(ledPins[5][0], ledPins[5][1]);
    ledSpecifytwo(ledPins[7][0], ledPins[7][1]);
  }
    else if(val2 >855 && val2 < 885){
    //ledSpecify(ledPins[6][0], ledPins[6][1]);
    ledSpecifytwo(ledPins[11][0], ledPins[11][1]);
  }  
  else if(val2 >885 && val2 < 905){
    //ledSpecify(ledPins[7][0], ledPins[7][1]);
    ledSpecifytwo(ledPins[5][0], ledPins[5][1]);
  } 
  else if(val2 >905 && val2 < 915){
    //ledSpecify(ledPins[8][0], ledPins[8][1]);
    ledSpecifytwo(ledPins[2][0], ledPins[2][1]);
  }  
  else if(val2 >915 && val2 < 935){
    //ledSpecify(ledPins[9][0], ledPins[9][1]);
    ledSpecifytwo(ledPins[0][0], ledPins[0][1]);
  }
  else if(val2 >935 && val2 < 952){
    //ledSpecify(ledPins[10][0], ledPins[10][1]);
    ledSpecifytwo(ledPins[3][0], ledPins[3][1]);
  }
  else if(val2 >952 && val2 < 965){
    
    ledSpecifytwo(ledPins[6][0], ledPins[6][1]);
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

void ledSpecifytwo(int highPin, int lowPin) // This allows you to manually control which pin goes low & which one goes high
{
  for(int i; i < 4; i++){
    pinMode(pinstwo[i], INPUT);
  }
  pinMode(pinstwo[highPin], OUTPUT); 
  digitalWrite(pinstwo[highPin], HIGH);
  pinMode(pinstwo[lowPin], OUTPUT); 
  digitalWrite(pinstwo[lowPin], LOW); 
  }
