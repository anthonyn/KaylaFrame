PImage img;

ArrayList<String> results = new ArrayList<String>();

void setup() {
  //size(800, 800);
  background(0);
  fullScreen();
  getFiles();
  
  setImage();
  displayImage();
}

void draw() {
}

void mousePressed() {
  //println(results.get(int(random(results.size()))));
  setImage();
  displayImage();
}

void getFiles() {
  //File[] files = new File("data").listFiles();
  java.io.File folder = new java.io.File(dataPath(""));
  File[] files = folder.listFiles();
  //If this pathname does not denote a directory, then listFiles() returns null. 
  for (File file : files) {
    if (file.isFile()) {
      results.add(file.getName());
    }
  }
}

void setImage() {
  //img = loadImage("1.jpg");
  String nextImage = results.get(int(random(results.size())));

  if (nextImage.toLowerCase().contains("mov") || nextImage.toLowerCase().contains("mp4") ) {
    println("got a movie " + nextImage);
    nextImage = results.get(int(random(results.size())));
  }

  img = loadImage( nextImage);
}

void displayImage() {
  //image(img, 0, 0, img.width/4, img.height/4);

  float fimgwidth = img.width;
  float fimgheight = img.height;
  float fwidth = width;
  float fheight = height;
  float scale;

  if (fimgwidth > fimgheight ) {
    scale = fwidth/fimgwidth;
  } else {
    scale = fheight/fimgheight;
  }

  background(0);
  println(fimgwidth, fimgheight, fwidth, fheight, fwidth/fimgwidth, fheight/fimgheight  );
  image(img, 0, 0, fimgwidth * scale, fimgheight * scale );
}
