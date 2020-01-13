static float bpm = 170;
static float beatInc = 0.5;
static int threshold = 100;
static int offset = -350;
static int binCount = 144;
static float defaultMass = 10;
static float defaultVMult = 0.5;
static float fillMass = 10;
static float fillVMult = 0.5;
static float fftThreshold = 1.2;
static float fftPow = 1.1;
static float fftAmp = 2;
static float volumeGain = -10;
static String songName = "../Music/everchanging.mp3";

IColor defaultFill = new IColor(0,0,0,255);
IColor defaultStroke = new IColor(255,255,255,255);

ArrayList<ShapeTunnel> tunnels = new ArrayList<ShapeTunnel>();
CellBox cellBox;
CubeShiftBox cubeBox;
HollowCellBox hollowBox;
PitchBall ball;
WireFrameBox wireBox;
ShapeTunnel cellTunnel;
ShapeTunnel cubeTunnel;
ShapeTunnel hollowTunnel;
ShapeTunnel ballTunnel;
ShapeTunnel quietTunnel;
ShapeTunnel loudTunnel;
ShapeTunnel loud2Tunnel;

static float size;

void render() {

}

void keyboardInput() {
	if (key == '1') {
		setTime(0,0);
	} else if (key == '2') {
		setTime(22940,32);
	} else if (key == '3') {
		setTime(63901,90);
	} else if (key == '4') {
		setTime(90720, 128);
	} else if (key == '5') {
		setTime(113313, 160);
	} else if (key == '6') {
		setTime(134489, 190);
	} else if (key == '7') {
		setTime(166278, 235);
	}
}

void setSketch() {
	front = new PVector(de*2,de,de*1.5);
  	back = new PVector(-de*2,-de,-de*2);
  	size = de*0.8;
  	textSize(90);
  	noiseSeed(0);
  	stroke(0);
  	strokeWeight(5);

  	cellBox = new CellBox(new PVector(0,0,0),size/6,8,8,8, 3,7,5,5);
  	mobs.add(cellBox);

  	cubeBox = new CubeShiftBox(new PVector(0,0,0), size,8,8,8, 175);
  	mobs.add(cubeBox);

  	hollowBox = new HollowCellBox(new PVector(0,0,0), size, 8, 2,3,3,3);
  	mobs.add(hollowBox);

  	ball = new PitchBall(new PVector(0,0,0), size/150);
  	mobs.add(ball);

  	wireBox = new WireFrameBox(new PVector(cam.p.p.x,cam.p.p.y,cam.p.p.z), size*3);
  	//wireBox = new WireFrameBox(new PVector(0,0,0), size*3.75);
  	//mobs.add(wireBox);

  	float w = de*0.05;
  	float wd = de*0.01;
  	cellTunnel = new ShapeTunnel(125, new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.004,de*0.002,
  		200,75,75, 55,55,55, -5,-5,-5, 1,1,1);
  	tunnels.add(cellTunnel);

  	w = de*0.08;
  	wd = de*0.02;
  	cubeTunnel = new ShapeTunnel(55, new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.003,de*0.002,
  		25,200,25, 25,55,25, -5,-5,-5, 1,1,1);
  	tunnels.add(cubeTunnel);

  	w = de*0.05;
  	wd = de*0.04;
  	hollowTunnel = new ShapeTunnel(125, new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.006,de*0.002,
  		100,25,200, 55,25,55, -5,-5,-5, 1,1,1);
  	tunnels.add(hollowTunnel);

  	w = de*0.06;
  	wd = de*0.03;
  	ballTunnel = new ShapeTunnel(55, new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.008,de*0.002,
  		25,125,200, 25,55,55, -5,-5,-5, 1,1,1);
  	tunnels.add(ballTunnel);

  	w = de*0.26;
  	wd = de*0.13;
  	quietTunnel = new ShapeTunnel(90, new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.004,de*0.001,
  		125,125,125, 125,125,125, 10,10,10, 1,1,1);
  	quietTunnel.draw = false; quietTunnel.wLimit = 0;
  	tunnels.add(quietTunnel);

  	w = de*0.36;
  	wd = de*0.13;
  	loudTunnel = new ShapeTunnel(155, new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.014,de*0.005,
  		125,255,125, 125,0,125, 10,-10,10, 1,1,1);
  	loudTunnel.draw = false; loudTunnel.wLimit = 0;
  	tunnels.add(loudTunnel);

  	w = de*0.36;
  	wd = de*0.13;
  	loud2Tunnel = new ShapeTunnel(155, new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.024,de*0.007,
  		125,125,255, 125,0,125, 10,-10,10, 1,1,1);
  	loud2Tunnel.draw = false; loud2Tunnel.wLimit = 0;
  	tunnels.add(loud2Tunnel);

  	setTime(44141,62);
}