void setup() {
  delay(5000); // wait for serial monitor to connect

  Serial.begin(115200); // make sure this matches monitor_speed in the justfile
  while (!Serial); // wait for serial monitor to be ready

  Serial.printf("CPU Clock Speed: %d MHz\n", getCpuFrequencyMhz());
}

void loop() {
  Serial.println("Hello, world!");
  delay(1000);
}
