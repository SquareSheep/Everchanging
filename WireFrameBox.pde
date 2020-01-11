class WireFrameBox extends Mob {

	int mode = 0;
	SpringValue[] ar = new SpringValue[16];

	WireFrameBox(PVector p, float w) {
		this.p = new Point(p);
		this.ang = new Point();
		this.w = w;
		for (int i = 0 ; i < ar.length ; i ++) {
			ar[i] = new SpringValue(0,0,0.1,15, w*0.01,(float)i/ar.length*binCount);
		}
	}

	void update() {
		super.update();
		for (int i = 0 ; i < ar.length ; i ++) {
			ar[i].update();
		}
	}

	void render() {
		setDraw();
		switch(mode) {
			case 0:
			stroke(100,25,175);
			drawGridBox(5);
			break;
			case 1:
			stroke(175,15,75);
			drawGridBox(7);
			break;
			case 2:
			stroke(125);
			drawGridBox(6);
			break;
			case 3:
			stroke(25,75,25);
			drawGridBox(8);
			drawVisualizerBars(75,255,75);
			break;
		}
		pop();
	}

	void drawGridBox(int n) {
		noFill();
		box(w);
		push();
		// translate(0,0,w/2);
		// drawLines(10);
		// rotateZ(PI/2);
		// drawLines(n);
		translate(0,0,-w/2);
		drawLines(n);
		rotateZ(-PI/2);
		drawLines(n);
		translate(0,0,-w/2);

		rotateX(PI/2);
		translate(0,w,w/2);
		drawLines(n);
		rotateZ(PI/2);
		drawLines(n);
		translate(0,0,-w);
		drawLines(n);
		rotateZ(-PI/2);
		drawLines(n);
		translate(0,-w,-w/2);

		rotateY(PI/2);
		translate(-w,w,w/2);
		drawLines(n);
		rotateZ(PI/2);
		drawLines(n);
		translate(0,0,-w);
		drawLines(n);
		rotateZ(-PI/2);
		drawLines(n);
		pop();
	}

	void drawLines(int n) {
		for (int i = 1 ; i < n ; i ++) {
			line(((float)i/n-0.5)*w,-w/2, ((float)i/n-0.5)*w,w/2);
		}
	}

	void drawVisualizerBars(float r, float g, float b) {
		push();
		stroke(r,g,b);
		translate(0,w/2,-w/2);
		for (int i = 0 ; i < ar.length ; i ++) {
			rect(((float)i/ar.length-0.5)*w+w/ar.length/2, -ar[i].x/2, w/ar.length, ar[i].x);
		}
		pop();
	}
}