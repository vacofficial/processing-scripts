// Author: Daniel Șuteu
// License: GPLv3
// Date: 04 June 2016

// Generate a Brownian tree
// http://rosettacode.org/wiki/Brownian_tree

boolean SIDESTICK = false;
boolean[][] isTaken;

void setup() {
  size(512, 512);
  isTaken = new boolean[width][height];
  isTaken[width/2][height/2] = true;
}

void draw() {
  for (int i = 0; i < width*height; i++) {
    int x = floor(random(width));
    int y = floor(random(height));
    if (isTaken[x][y]) { continue; }
    while (true) {
      int xp = x + floor(random(-1, 2));
      int yp = y + floor(random(-1, 2));
      boolean isContained = (
        0 <= xp && xp < width  &&
        0 <= yp && yp < height
      );
      if (isContained && !isTaken[xp][yp]) {
        x = xp;
        y = yp;
        continue;
      }
      else {
        if (SIDESTICK || (isContained && isTaken[xp][yp])) {
          isTaken[x][y] = true;
          set(x, y, #000000);
        }
        break;
      }
    }
  }
  noLoop();
}
