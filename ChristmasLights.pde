// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

// Class page for christmas lights on the christmas tree
// Has a total of 5 different blinking patterns to alternate from
// Click with the mouse on the christmas tree to alternate between them

class ChristmasLights {
  
  float[] lightX;        // x positions of the lights
  float[] lightY;        // y positions of the lights
  color[] lightColors;  
  boolean[] lightStates; // state of individual lights (on/off)
  int numLights;         

  int blinkInterval;     // in miliseconds
  int lastBlinkTime;     

  int patternIndex;      // current blinking pattern
  int numPatterns;       
  
  // variables to handle a delay for patterns 1 and 2
  int resetTimePattern1;
  int resetTimePattern2;
  int resetDelay;

  ChristmasLights(float[] xPositions, float[] yPositions, color[] colors, int blinkInterval) {
    
    lightX = xPositions;
    lightY = yPositions;
    lightColors = colors;
    numLights = min(lightX.length, lightY.length); // make sure the coordinates match
    
    this.blinkInterval = blinkInterval;
    lastBlinkTime = millis();
    
    patternIndex = 0;
    numPatterns = 5; 
    
    resetTimePattern1 = 0;
    resetTimePattern2 = 0;
    resetDelay = 500; // delay for patterns 1/2 in miliseconds

    lightStates = new boolean[numLights]; 
    for (int i = 0; i < numLights; i++) {
      lightStates[i] = true; // start with all lights on
    }
    
  }

  // update the lights based on the current pattern
  void update() {
    
    int currentBlinkInterval = blinkInterval;

    // change the blinking interval based on thecurrent pattern
    switch (patternIndex) {
        case 1:
        case 2:
            currentBlinkInterval = blinkInterval / 5;
            break;
        case 3:
            currentBlinkInterval = blinkInterval / 2;
            break;
    }

    // check if it's time to update the lights
    if (millis() - lastBlinkTime > currentBlinkInterval) {
        lastBlinkTime = millis();

        switch (patternIndex) {
            case 0:
                // Pattern 0: All lights blink on/off together
                boolean lightsOn = !lightStates[0];
                for (int i = 0; i < numLights; i++) {
                    lightStates[i] = lightsOn;
                }
                break;
            case 1:
                // Pattern 1: Lights turn on one by one in sequence with a delay to reset the patternafter all are on
                if (resetTimePattern1 > 0) {
                    // waiting to reset lights
                    if (millis() - resetTimePattern1 > resetDelay) {
                        // reset the lights once the delay has passed
                        for (int i = 0; i < numLights; i++) {
                            lightStates[i] = false;
                        }
                        resetTimePattern1 = 0;
                    }
                } else {
                    // normal pattern behvaviour
                    for (int i = 0; i < numLights; i++) {
                        if (!lightStates[i]) {
                            lightStates[i] = true;
                            break;
                        }
                    }
                    if (allLightsOn()) {
                        resetTimePattern1 = millis();
                    }
                }
                break;
            case 2:
                // Pattern 2: Lights turn off one by one in sequence with delay after all are off
                if (resetTimePattern2 > 0) {
                    // waiting to reset lights
                    if (millis() - resetTimePattern2 > resetDelay) {
                        // reset the lights once the delay has passed
                        for (int i = 0; i < numLights; i++) {
                            lightStates[i] = true;
                        }
                        resetTimePattern2 = 0;
                    }
                } else {
                    // normal pattern behvaviour
                    for (int i = 0; i < numLights; i++) {
                        if (lightStates[i]) {
                            lightStates[i] = false;
                            break;
                        }
                    }
                    if (allLightsOff()) {
                        resetTimePattern2 = millis();
                    }
                }
                break;
            case 3:
                // Pattern 3: Random lights blink on/off
                for (int i = 0; i < numLights; i++) {
                    lightStates[i] = random(1) > 0.5;
                }
                break;
            case 4:
                // Pattern 4: Alternate lights blink alternately
                boolean firstLightState = !lightStates[0];
                for (int i = 0; i < numLights; i++) {
                    lightStates[i] = (i % 2 == 0) ? firstLightState : !firstLightState;
                }
                break;
        }
    }
    
}


  boolean allLightsOn() {
    
    for (int i = 0; i < numLights; i++) {
      if (!lightStates[i]) {
        return false;
      }
    }
    return true;
    
  }

  boolean allLightsOff() {
    
    for (int i = 0; i < numLights; i++) {
      if (lightStates[i]) {
        return false;
      }
    }
    return true;
    
  }


  void display() {
    
    noStroke();
    for (int i = 0; i < numLights; i++) {
      if (lightStates[i]) {
        fill(lightColors[i % lightColors.length]);
        ellipse(lightX[i], lightY[i], 8, 8);
      }
    }
    
  }


  void nextPattern() {
    patternIndex = (patternIndex + 1) % numPatterns;
    // reset the light states based on the current pattern
    switch (patternIndex) {
      case 0:
      case 3:
      case 4:
        for (int i = 0; i < numLights; i++) {
          lightStates[i] = true;
        }
        break;
      case 1:
        for (int i = 0; i < numLights; i++) {
          lightStates[i] = false;
        }
        break;
      case 2:
        for (int i = 0; i < numLights; i++) {
          lightStates[i] = true;
        }
        break;
    }
  }
}
