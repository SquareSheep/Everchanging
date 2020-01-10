class HollowCellBox extends Entity {
	Point p;
	CellBox[] boxes = new CellBox[6];

	HollowCellBox(PVector p, float w, int x, int aliveMin, int aliveMax, int spawnMin, int spawnMax) {
		this.p = new Point(p);
		for (int i = 0 ; i < boxes.length ; i ++) {
			boxes[i] = new CellBox(new PVector(0,0,w/2), w/x, x,x,3, aliveMin, aliveMax, spawnMin, spawnMax);
			boxes[i].tickRate = 12;
			boxes[i].cellReact = false;
		}
	}

	void update() {
		p.update();
		for (int i = 0 ; i < boxes.length ; i ++) {
			boxes[i].update();
		}
	}

	void render() {
		push();
		translate(p.p.x,p.p.y,p.p.z);
		boxes[0].render();
		rotateX(PI/2);
		boxes[1].render();
		rotateX(PI/2);
		boxes[2].render();
		rotateX(PI/2);
		boxes[3].render();
		rotateX(PI/2);
		rotateY(PI/2);
		boxes[4].render();
		rotateY(PI);
		boxes[5].render();
		pop();
	}

	void setRandom() {
		for (int i = 0 ; i < boxes.length ; i ++) {
			boxes[i].setRandom();
		}
	}
}