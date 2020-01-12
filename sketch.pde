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

CellBox cellBox;
CubeShiftBox cubeBox;
HollowCellBox hollowBox;
PitchBall ball;
WireFrameBox wireBox;
ShapeTunnel cellTunnel;
ShapeTunnel cubeTunnel;
ShapeTunnel hollowTunnel;
ShapeTunnel ballTunnel;

static float size;

void render() {

}

void keyboardInput() {
	if (key == '1') {
		setTime(0,0);
	} else if (key == '2') {
		setTime(22940,32);
	} else if (key == '3') {
		setTime(44141,62);
	} else if (key == '4') {
		setTime(63901, 90);
	} else if (key == '5') {
		setTime(113313, 160);
	}
}

void addEvents() {
	events.add(new CameraAngV(63,96, 0.001,0.002,-0.00081));
	events.add(new SetDraws(61,true,false,false,false));
	for (int i = 0 ; i < 6 ; i ++) {
		events.add(new SetDraws(69 + i*4,false,true,false,false));
		events.add(new CameraPAdd(69 + i*4, 0.3,0.3,0.3));
		events.add(new CubeShiftNotes(69 + i*4));
		events.add(new CameraPAdd(70.5 + i*4, -0.3,-0.3,-0.3));
		events.add(new SetDraws(70.5 + i*4,true,false,false,false));
	}
	
	events.add(new SetDraws(96.5,false,false,false,true));
	events.add(new CameraPSet(96.5, 0,0,0));

	events.add(new CameraAngV(96.5,124, 0,0,0.002));
	events.add(new SetDraws(101,false,false,true,false));
	events.add(new CameraPSet(101, 0,1.2,0.1));
	events.add(new HollowSetRandom(101));
	events.add(new HollowSetRandom(102));
	events.add(new SetDraws(103,false,false,false,true));
	events.add(new CameraPSet(103, 0,0,0));
	events.add(new SetDraws(109,true,false,false,false));
	events.add(new CameraPSet(109, -0.3,-0.5,0));
	events.add(new SetDraws(113,false,false,false,true));
	events.add(new CameraPSet(113, 0,0,0));
	events.add(new SetDraws(117,false,false,true,false));
	events.add(new CameraPSet(117, 0,1.2,0.1));
	events.add(new HollowSetRandom(117));
	events.add(new SetDraws(119,false,false,false,true));
	events.add(new CameraPSet(119, 0,0,0));

	events.add(new CameraAngV(124,129, 0,-0.0003,0.004));
	events.add(new SetDraws(124,false,true,false,false));
	events.add(new CubeShiftNotes(124, 4.5, 27));
	events.add(new SetDraws(128.5,true,false,false,false));

	events.add(new CameraAngV(129,177, 0,0.0003,-0.004));
	for (int i = 0 ; i < 8 ; i ++) {
		events.add(new SetDraws(129+i*4,false,true,false,false));
		events.add(new CameraPAdd(129+i*4, 0.5,0.5,0.5));
		events.add(new CubeShiftNotes(129+i*4));
		events.add(new SetDraws(130.5+i*4,false,false,false,true));
		events.add(new CameraPAdd(130.5+i*4, -0.5,-0.5,-0.5));
	}
	
	events.add(new SetDraws(161,true,false,false,false));

	events.add(new SetDraws(176,false,false,false,true));
	// Long melody 176-191
	events.add(new SetDraws(191,true,false,false,false));
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
  	cellTunnel = new ShapeTunnel(new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.004,de*0.002,
  		200,75,75, 55,55,55, -5,-5,-5, 1,1,1);

  	w = de*0.08;
  	wd = de*0.02;
  	cubeTunnel = new ShapeTunnel(new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.003,de*0.002,
  		25,200,25, 25,55,25, -5,-5,-5, 1,1,1);

  	w = de*0.05;
  	wd = de*0.04;
  	hollowTunnel = new ShapeTunnel(new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.006,de*0.002,
  		100,25,200, 55,25,55, -5,-5,-5, 1,1,1);

  	w = de*0.06;
  	wd = de*0.03;
  	ballTunnel = new ShapeTunnel(new PVector(width/2,height/2,-de*3.5), new PVector(de*2,de*2,de*4.3), 
  		new PVector(w,w,w), new PVector(wd,wd,wd), 
  		de*0.008,de*0.002,
  		25,125,200, 25,55,55, -5,-5,-5, 1,1,1);

  	for (int i = 0 ; i < 125 ; i ++) {
  		cellTunnel.add(random(-1,1));
  	}
  	for (int i = 0 ; i < 55 ; i ++) {
  		cubeTunnel.add(random(-1,1));
  	}
  	for (int i = 0 ; i < 125 ; i ++) {
  		hollowTunnel.add(random(-1,1));
  	}
  	for (int i = 0 ; i < 55 ; i ++) {
  		ballTunnel.add(random(-1,1));
  	}

  	setTime(44141,62);
}