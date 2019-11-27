# Thermal Camera Heatmap

![](thermalCameraDemo.gif)


Dette repository indeholder processingkode, der visualiserer data fra et [Adafruit Thermal Camera](https://www.adafruit.com/product/3538). Kameraet er et varmekamera, der med en opløsning på 8x8 pixels kan måle temperaturer i et spænd mellem 0 og 80 grader celcius. Ifølge adafruit kan man på den måde registrere mennesker helt op til 7 meter fra kameraet.

Processingkoden modtager og visualiserer kun dataen fra arduinoen med varmekameraet. For at bruge det, skal du altså først følge denne [guide fra Adafruit](https://learn.adafruit.com/adafruit-amg8833-8x8-thermal-camera-sensor/arduino-wiring-test) for at få kameraet sat op med en arduino. Upload så "pixels_test" eksempelkoden til arduinoen og åben processingsketchen.
