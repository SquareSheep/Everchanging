class WireFrameBox extends Mob {

	int mode = 0;

	WireFrameBox(PVector p, float w) {
		this.p = new Point(p);
		this.ang = new Point();
		this.w = w;
	}

	void render() {
		setDraw();
		switch(mode) {
			case 0:
			noFill();
			stroke(75);
			box(w);
			// translate(0,0,w/2);
			// drawLines(10);
			// rotateZ(PI/2);
			// drawLines(10);
			translate(0,0,-w/2);
			drawLines(10);
			rotateZ(-PI/2);
			drawLines(10);
			translate(0,0,-w/2);

			rotateX(PI/2);
			translate(0,w,w/2);
			drawLines(10);
			rotateZ(PI/2);
			drawLines(10);
			translate(0,0,-w);
			drawLines(10);
			rotateZ(-PI/2);
			drawLines(10);
			translate(0,-w,-w/2);

			rotateY(PI/2);
			translate(-w,w,w/2);
			drawLines(10);
			rotateZ(PI/2);
			drawLines(10);
			translate(0,0,-w);
			drawLines(10);
			rotateZ(-PI/2);
			drawLines(10);
			break;
			case 1:
			box(w);
			break;
			case 2:
			break;
			case 3:
			break;
		}
		pop();
	}

	void drawLines(int n) {
		for (int i = 1 ; i < n ; i ++) {
			line(((float)i/n-0.5)*w,-w/2, ((float)i/n-0.5)*w,w/2);
		}
	}
}