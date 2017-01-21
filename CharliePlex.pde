#include <avr/pgmspace.h> 
#include "FastLED.h"
FASTLED_USING_NAMESPACE
int pins[4];
int pinstwo[4];
int blinkdelay = 200;   
int runspeed = 25;      
#define DATA_PIN    12
//#define CLK_PIN   4
#define LED_TYPE    WS2811
#define COLOR_ORDER GRB
#define NUM_LEDS    21
CRGB leds[NUM_LEDS];

#define BRIGHTNESS          100
#define FRAMES_PER_SECOND  120
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
    FastLED.addLeds<LED_TYPE,DATA_PIN,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  //FastLED.addLeds<LED_TYPE,DATA_PIN,CLK_PIN,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);

  // set master brightness control
  FastLED.setBrightness(BRIGHTNESS);
  pinMode(A0, INPUT_PULLUP);
  pinMode(13, OUTPUT);
}
typedef void (*SimplePatternList[])();
//SimplePatternList gPatterns = { confetti, sinelon, juggle, bpm };
SimplePatternList gPatterns = { slidingBluePurple, rainbow, confetti, juggle, bpm, red, green, blue, purple, slidingRedBlue, rainbowWithGlitter, slidingGreenRed };
uint8_t gCurrentPatternNumber = 0; // Index number of which pattern is current
uint8_t gHue = 0; // rotating "base color" used by many of the patterns
void loop() {
  val = analogRead(5);
  val2 = analogRead(0);
  Joystick.setXAxisRotation((val-530)*.5);
  Joystick.setYAxisRotation((val2-530)*.5);

  Serial.println(val);
  if(val<570){
    //ledSpecify(ledPins[0][0], ledPins[0][1]);
    ledSpecify(ledPins[9][0], ledPins[9][1]);
    slidingBluePurple();
  }
  else if(val >569 && val < 635){
    //ledSpecify(ledPins[1][0], ledPins[1][1]);
    ledSpecify(ledPins[4][0], ledPins[4][1]);
    rainbow();
  }
    else if(val >635 && val < 725){
    //ledSpecify(ledPins[2][0], ledPins[2][1]);
    ledSpecify(ledPins[8][0], ledPins[8][1]);
    confetti();
  }
    else if(val >725 && val < 780){
    //ledSpecify(ledPins[3][0], ledPins[3][1]);
    ledSpecify(ledPins[10][0], ledPins[10][1]);
    juggle();
  }
    else if(val >780 && val < 820){
    //ledSpecify(ledPins[4][0], ledPins[4][1]);
    ledSpecify(ledPins[1][0], ledPins[1][1]);
    bpm();
  }
    else if(val >820 && val < 850){
    //ledSpecify(ledPins[5][0], ledPins[5][1]);
    ledSpecify(ledPins[7][0], ledPins[7][1]);
    red();
  }
    else if(val >850 && val < 875){
    //ledSpecify(ledPins[6][0], ledPins[6][1]);
    ledSpecify(ledPins[11][0], ledPins[11][1]);
    green();
  }  
  else if(val >875 && val < 895){
    //ledSpecify(ledPins[7][0], ledPins[7][1]);
    ledSpecify(ledPins[5][0], ledPins[5][1]);
    blue();
  } 
  else if(val >895 && val < 915){
    //ledSpecify(ledPins[8][0], ledPins[8][1]);
    ledSpecify(ledPins[2][0], ledPins[2][1]);
    purple();
  }  
  else if(val >915 && val < 935){
    //ledSpecify(ledPins[9][0], ledPins[9][1]);
    ledSpecify(ledPins[0][0], ledPins[0][1]);
    slidingRedBlue();
  }
  else if(val >935 && val < 948){
    //ledSpecify(ledPins[10][0], ledPins[10][1]);
    ledSpecify(ledPins[3][0], ledPins[3][1]);
    rainbowWithGlitter();
  }
  else if(val >948 && val < 965){
    
    ledSpecify(ledPins[6][0], ledPins[6][1]);
    slidingGreenRed();
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
    EVERY_N_MILLISECONDS( 20 ) { gHue++; } // slowly cycle the "base color" through the rainbow
    FastLED.show(); 
    FastLED.delay(1000/FRAMES_PER_SECOND);  
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
  void rainbow() 
{
  // FastLED's built-in rainbow generator
  fill_rainbow( leds, NUM_LEDS, gHue, 7);
}

void rainbowWithGlitter() 
{
  // built-in FastLED rainbow, plus some random sparkly glitter
  rainbow();
  addGlitter(100);
}

void addGlitter( fract8 chanceOfGlitter) 
{
  if( random8() < chanceOfGlitter) {
    leds[ random16(NUM_LEDS) ] += CRGB::White;
  }
}

void confetti() 
{
  // random colored speckles that blink in and fade smoothly
  fadeToBlackBy( leds, NUM_LEDS, 10);
  int pos = random16(NUM_LEDS);
  leds[pos] += CHSV( gHue + random8(64), 200, 255);
}
void slidingBluePurple(){
  for (int dot=0; dot<NUM_LEDS; dot++){
    leds[dot]=CRGB::Blue;
    delay(35);
    FastLED.show();
  }
 for (int dot=NUM_LEDS; dot>-1; dot=dot-1){
    leds[dot]=CRGB::Purple;
    delay(35);
    FastLED.show();
  }
}
void red(){
   for (int dot=0; dot<NUM_LEDS; dot++){
    leds[dot]=CRGB::Red;
    }
}
void blue(){
   for (int dot=0; dot<NUM_LEDS; dot++){
    leds[dot]=CRGB::Blue;
    }
}
void green(){
   for (int dot=0; dot<NUM_LEDS; dot++){
    leds[dot]=CRGB::Green;
    }
}
void purple(){
   for (int dot=0; dot<NUM_LEDS; dot++){
    leds[dot]=CRGB::Purple;
    }
}
void slidingRedBlue(){
  for (int dot=0; dot<NUM_LEDS; dot++){
    leds[dot]=CRGB::Blue;
    delay(35);
    FastLED.show();
  }
 for (int dot=NUM_LEDS; dot>-1; dot=dot-1){
    leds[dot]=CRGB::Red;
    delay(35);
    FastLED.show();
  }
}
void slidingGreenRed(){
  for (int dot=0; dot<NUM_LEDS; dot++){
    leds[dot]=CRGB::Green;
    delay(35);
    FastLED.show();
  }
 for (int dot=NUM_LEDS; dot>-1; dot=dot-1){
    leds[dot]=CRGB::Red;
    delay(35);
    FastLED.show();
  }
}
void bpm()
{
  // colored stripes pulsing at a defined Beats-Per-Minute (BPM)
  uint8_t BeatsPerMinute = 62;
  CRGBPalette16 palette = PartyColors_p;
  uint8_t beat = beatsin8( BeatsPerMinute, 64, 255);
  for( int i = 0; i < NUM_LEDS; i++) { //9948
    leds[i] = ColorFromPalette(palette, gHue+(i*2), beat-gHue+(i*10));
  }
}

void juggle() {
  // eight colored dots, weaving in and out of sync with each other
  fadeToBlackBy( leds, NUM_LEDS, 20);
  byte dothue = 0;
  for( int i = 0; i < 8; i++) {
    leds[beatsin16(i+7,0,NUM_LEDS)] |= CHSV(dothue, 200, 255);
    dothue += 32;
  }
}
