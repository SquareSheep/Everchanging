/*
0-34, 34-64, 66-92, 92-96,
34 snare, kick starts
62-64 vocal chop transition



CellBox:
ShiftBox:
PointerBox:
*/

class ACellBox extends CellBox {
	float threshold = 3;

	ACellBox(PVector p, float w, int x, int y, int z) {
		super(p,w,x,y,z);

		float amp = 4;
		for (i = 0 ; i < x ; i ++) {
			for (k = 0 ; k < y ; k ++) {
				for (j = 0 ; j < z ; j ++) {
					cells[i][k][j].fillStyle.setM((float)i/x*amp, (float)(y-k)/y*amp, (float)j/z*amp,0, 
						(i*x+k*y+j)%binCount);
				}
			}
		}
	}

	void update() {
		super.update();
		tickRate = (int) max(65-max,5);
	}

	void updateCell() {
		super.updateCell();
		if (frameCount % tickRate == 0 && 
			av[cells[i][k][j].fillStyle.index] > threshold*avg) cells[i][k][j].alive = true;
	}

	void render() {
		push();
		translate(p.p.x,p.p.y,p.p.z);
		renderCells();
		stroke(255);
		noFill();
		box(w.p.x*x,w.p.y*y,w.p.z*z);
		pop();
	}
}