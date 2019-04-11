/*
   Skrevet af Nikolaj Mikkelsen for Digital Design Lab, Aarhus Universitet

   Denne kode visualiserer varmemålingerne fra et Adafruit AMG8833 IR Thermal Camera Breakout board. 
   Brug koden sammen med "pixels_test"-eksemplet, der følger med sensorens arduino bibliotek.    
 */

import processing.serial.*;

Serial myPort;

float[] heatVals = new float[64];
float squareWidth;
float squareHeight;

float minTemp = 22;
float maxTemp = 34;

void setup() {
		size(800, 800);
		squareWidth = width/8;
		squareHeight = height/8;
		noStroke();

		// Sørg for at vælge den korrekte port, hvis der er flere tilgængelige
		// Her vælger vi den første port (nummer 0) fra listen af tilgængelige porte
		// der printes til konsollen
		println(Serial.list());
		String portName = Serial.list()[0];
		myPort = new Serial(this, portName, 9600);

		// Vi beder vores serialEvent funktion til at vente med at skyde indtil der
		// er modtaget ], hvilket indikerer at vi har modtaget hele listen af
		// temperaturværdier fra arduinoen
		myPort.bufferUntil(']');
}

void draw() {
		background(0);
		for (int i = 0; i < 64; i++) {
				float x = (i % 8) * squareWidth;
				float y = (i / 8) * squareHeight;

				float temp = heatVals[i];

				float constrainedTemp = constrain(temp, minTemp, maxTemp);
				float mappedTempR = map(constrainedTemp, minTemp, maxTemp, 0, 255);
        float mappedTempB = map(constrainedTemp, minTemp, maxTemp, 255, 0);

				fill(mappedTempR, 0, mappedTempB);
				rect(x, y, squareWidth, squareHeight);
		}
}

void serialEvent(Serial myPort) {
		String received = myPort.readStringUntil(']');
		if (received != null) {
				received = trim(received);
				if (received.contains("[") && received.contains("]")) {

						int startIndex = received.indexOf('[');
						int endIndex = received.indexOf(']');

						received = received.substring(startIndex + 1, endIndex);

						String[] splitValues = split(received, ",");
						for (int i = 0; i<64; i++) {
								heatVals[i] = Float.parseFloat(splitValues[i]);
						}
				}
		}
}
