//define Pins
#include <Servo.h>

Servo servo;

int LedVerte = 13;
int LedRouge = 11;
int trigPin1 = A3;
int echoPin1 = A4;
int trigPin2 = 5;
int echoPin2 = 6;
int bouton = 2;

// defines variables
long duration;
int distance;
long duration2;
int distance2;

void setup() 
{
  servo.attach(7);
  servo.write(0);
 delay(2000);

//Sets the LedVerte as an Output
pinMode(LedVerte, OUTPUT);
//Sets the LedRouge as an Output
pinMode(LedRouge, OUTPUT);
// Sets the trigPin1 as an Output
pinMode(trigPin1, OUTPUT);
// Sets the echoPin1 as an Input 
pinMode(echoPin1, INPUT);
// Sets the trigPin2 as an Output
pinMode(trigPin2, OUTPUT);
// Sets the echoPin2 as an Input 
pinMode(echoPin2, INPUT);
pinMode(bouton, INPUT);
// Starts the serial communication 
Serial.begin(9600); 
}
void loop() 
{

digitalWrite (LedVerte , HIGH );
digitalWrite (LedRouge , LOW );

if ( distance2 >= 10   )
digitalWrite (LedVerte , LOW );
if ( distance2 >= 10   )
digitalWrite (LedRouge , HIGH );

if (digitalRead(bouton) == HIGH)
{
delay(2000);
servo.write(60);
delay(3000);

 } 

// Clears the trigPin2
digitalWrite(trigPin2, LOW);
delayMicroseconds(2);
// Sets the trigPin2 on HIGH state for 10 micro seconds
digitalWrite(trigPin2, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin2, LOW);
// Reads the echoPin2, returns the sound wave travel time in microseconds
duration2 = pulseIn(echoPin2, HIGH);
// Calculating the distance2
distance2= duration2*0.034/2;
// Prints the distance2 on the Serial Monitor
Serial.print("Distance2: ");
Serial.println(distance2);



// Clears the trigPin1
digitalWrite(trigPin1, LOW);
delayMicroseconds(2);
// Sets the trigPin1 on HIGH state for 10 micro seconds
digitalWrite(trigPin1, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin1, LOW);
// Reads the echoPin1, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin1, HIGH);
// Calculating the distance
distance= duration*0.034/2;
// Prints the distance on the Serial Monitor
Serial.print("Distance: ");
Serial.println(distance);


if ( distance <= 5 && distance2 >= 10   )  // Change Distance according to Ultrasonic Sensor Placement
 {

digitalWrite (LedVerte , LOW );
digitalWrite (LedRouge , HIGH );
servo.write(60);
delay(3000);
 } 
else 
{
digitalWrite (LedVerte, HIGH );
digitalWrite (LedRouge, LOW );
servo.write(250);

 }
}
