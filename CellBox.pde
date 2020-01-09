class CellBox extends Entity {
	Point p;
	Point w;
	PVector wc;
	Cell[][][] cells;
	int x; int y; int z;
	int i; int k; int j;
	int count;

	int tickRate = 3;
	float cellVMult = 0.1;
	float cellMass = 5;

	int aliveMin = 4; int aliveMax = 7;
	int spawnMin = 5; int spawnMax = 5;

	CellBox(PVector p, float w, int x, int y, int z) {
		this.p = new Point(p);
		this.w = new Point(w,w,w);
		this.x = x;
		this.y = y;
		this.z = z;
		cells = new Cell[x][][];
		for (i = 0 ; i < x ; i ++) {
			cells[i] = new Cell[y][];
			for (k = 0 ; k < y ; k ++) {
				cells[i][k] = new Cell[z];
				for (j = 0 ; j < z ; j ++) {
					cells[i][k][j] = new Cell((float)i/x*125+125, (float)k/y*255, 255-(float)j/z*255,
						5,5,5, (i*x+k*y+j)%binCount);
				}
			}
		}
	}

	CellBox(PVector p, float w, int x, int y, int z, int aliveMin, int aliveMax, int spawnMin, int spawnMax) {
		this(p,w,x,y,z);
		this.aliveMin = aliveMin;
		this.aliveMax = aliveMax;
		this.spawnMin = spawnMin;
		this.spawnMax = spawnMax;
	}

	class Cell extends Entity {
		int currShape = 0;
		SpringValue sca = new SpringValue(0,cellVMult, cellMass);
		boolean alive = false;
		boolean next = false;
		IColor fillStyle;

		Cell(float r, float g, float b, float rm, float gm, float bm, float index) {
			fillStyle = new IColor(r,g,b,255, rm,gm,bm,0, index);
		}

		void update() {
			sca.update();
			fillStyle.update();
		}

		void render() {
			fillStyle.fillStyle();
			scale(sca.x);
			switch (currShape) {
				case 0:
				box(w.p.x,w.p.y,w.p.z);
				break;
				case 1:
				break;
				case 2:
				break;
			}
		}

		void setAlive(boolean state) {
			alive = state;
			if (alive) {
				sca.X = 1;
			} else {
				sca.X = 0;
			}
		}
	}

	void update() {
		if (frameCount % tickRate == 0) tick();
		p.update();
		w.update();
		for (i = 1 ; i < x-1 ; i ++) {
			for (k = 1 ; k < y-1 ; k ++) {
				for (j = 1 ; j < z-1 ; j ++) {
					if (av[cells[i][k][j].fillStyle.index] > 15) cells[i][k][j].alive = true;
					updateCell();
				}
			}
		}
	}

	void updateCell() {
		cells[i][k][j].update();
	}

	void render() {
		push();
		translate(p.p.x,p.p.y,p.p.z);
		renderCells();
		pop();
	}

	void renderCells() {
		for (i = 1 ; i < x-1 ; i ++) {
			for (k = 1 ; k < y-1 ; k ++) {
				for (j = 1 ; j < z-1 ; j ++) {
					if (cells[i][k][j].sca.x > 0.1) {
						push();
						translate((i-(float)x*0.5+0.5)*w.p.x,(k-(float)y*0.5+0.5)*w.p.y,(j-(float)z*0.5+0.5)*w.p.z);
						cells[i][k][j].render();
						pop();
					}
				}
			}
		}
	}

	void tick() {
		for (i = 1 ; i < x-1 ; i ++) {
			for (k = 1 ; k < y-1 ; k ++) {
				for (j = 1 ; j < z-1 ; j ++) {
					calcNewState(i,k,j);
				}
			}
		}
		for (i = 1 ; i < x-1 ; i ++) {
			for (k = 1 ; k < y-1 ; k ++) {
				for (j = 1 ; j < z-1 ; j ++) {
					cells[i][k][j].setAlive(cells[i][k][j].next);
				}
			}
		}
	}

	void calcNewState(int x, int y, int z) {
		countAliveN(x,y,z);
		if (cells[x][y][z].alive) {
			cells[x][y][z].next = count >= aliveMin && count <= aliveMax;
		} else {
			cells[x][y][z].next = count >= spawnMin && count <= spawnMax;
		}
	}

	void countAliveN(int x, int y, int z) {
		count = 0;
		if (cells[x-1][y-1][z].alive) count ++;
		if (cells[x-1][y][z].alive) count ++;
		if (cells[x-1][y+1][z].alive) count ++;
		if (cells[x][y+1][z].alive) count ++;
		if (cells[x+1][y+1][z].alive) count ++;
		if (cells[x+1][y][z].alive) count ++;
		if (cells[x+1][y-1][z].alive) count ++;
		if (cells[x][y-1][z].alive) count ++;
		if (cells[x-1][y-1][z-1].alive) count ++;
		if (cells[x-1][y][z-1].alive) count ++;
		if (cells[x-1][y+1][z-1].alive) count ++;
		if (cells[x][y+1][z-1].alive) count ++;
		if (cells[x+1][y+1][z-1].alive) count ++;
		if (cells[x+1][y][z-1].alive) count ++;
		if (cells[x+1][y-1][z-1].alive) count ++;
		if (cells[x][y-1][z-1].alive) count ++;
		if (cells[x][y][z-1].alive) count ++;
		if (cells[x-1][y-1][z+1].alive) count ++;
		if (cells[x-1][y][z+1].alive) count ++;
		if (cells[x-1][y+1][z+1].alive) count ++;
		if (cells[x][y+1][z+1].alive) count ++;
		if (cells[x+1][y+1][z+1].alive) count ++;
		if (cells[x+1][y][z+1].alive) count ++;
		if (cells[x+1][y-1][z+1].alive) count ++;
		if (cells[x][y-1][z+1].alive) count ++;
		if (cells[x][y][z+1].alive) count ++;
	}

	void setRandom() {
		for (i = 1 ; i < x-1 ; i ++) {
			for (k = 1 ; k < y-1 ; k ++) {
				for (j = 1 ; j < z-1 ; j ++) {
					cells[i][k][j].alive = random(1) > 0.5;
				}
			}
		}
	}

	void setAll(boolean state) {
		for (i = 1 ; i < x-1 ; i ++) {
			for (k = 1 ; k < y-1 ; k ++) {
				for (j = 1 ; j < z-1 ; j ++) {
					cells[i][k][j].alive = state;
				}
			}
		}
	}
}