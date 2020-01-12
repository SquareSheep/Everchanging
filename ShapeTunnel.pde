class ShapeTunnel extends ObjectPool<Shape> {

	PVector w;
	PVector p;
	PVector ws; // Average of shape w
	PVector wd; // Variation of shape w
	float v; float vd;
	float r; float g; float b;
	float rd; float gd; float bd;
	float rm; float gm; float bm;
	float rmd; float gmd; float bmd;
	boolean spawn = true;
	float wLimit = 0.25;

	ShapeTunnel(PVector p, PVector w, PVector ws, PVector wd, float v, float vd, float r, float g, float b, 
		float rd, float gd, float bd, float rm, float gm, float bm, float rmd, float gmd, float bmd) {
		this.p = p; this.w = w; this.ws = ws; this.wd = wd; this.v = v; this.vd = vd;
		this.r = r; this.g = g; this.b = b;
		this.rd = rd; this.gd = gd; this.bd = bd;
		this.rm = rm; this.gm = gm; this.bm = bm;
		this.rmd = rmd; this.gmd = gmd; this.bmd = bmd;
	}

	void set(Shape mob, float x, float y, float z, float w, float h, float d, float v, int mode, float r, float g, float b, float rm, float gm, float bm) {
		mob.finished = false;
		mob.draw = true;
		mob.p.reset(x,y,z);
		mob.w.reset(w,h,d);
		mob.w.pm.set(w*0.01,h*0.01,d*0.01);
		mob.w.index = (int)random(binCount);
		mob.ang.reset(random(-PI,PI),random(-PI,PI),random(-PI,PI));
		mob.fillStyle.reset(r,g,b,255,rm,gm,bm,0);
		mob.fillStyle.index = (int)random(binCount);
		mob.mode = mode;
		mob.pv.P.z = v;
	}

	void add(float x, float y, float z, float w, float h, float d, float v, int mode, float r, float g, float b, float rm, float gm, float bm) {
		Shape mob;
		if (arm == ar.size()) {
			ar.add(0,new Shape());
			mob = ar.get(0);
		} else {
			mob = ar.get(arm);
		}
		set(mob, x,y,z, w,h,d, v, mode, r,g,b, rm,gm,bm);
		arm ++;
	}

	void add(float z) {
		float x = 0; float y = 0;
		switch ((int)random(4)) {
			case 0:
			x = random(-w.x,w.x);
			y = random(-w.y,-w.y*wLimit);
			break;
			case 1:
			x = random(-w.x, w.x);
			y = random(w.y*wLimit, w.y);
			break;
			case 2:
			x = random(-w.x,-w.x*wLimit);
			y = random(-w.y,w.y);
			break;
			case 3:
			x = random(w.x*wLimit,w.x);
			y = random(-w.y,w.y);
			break;
		}
		add(x,y,w.z*z, random(-wd.x,wd.x)+ws.x,random(-wd.y,wd.y)+ws.y,random(-wd.z,wd.z)+ws.z, random(-vd,vd)+v, 0,
					random(-rd,rd)+r, random(-gd,gd)+g, random(-bd,bd)+b, random(-rmd,rmd)+rm, random(-gmd,gmd)+gm, random(-bmd,bmd)+bm);
	}

	void add() {
		add(-1);
	}

	void update() {
		super.update();
		for (int i = 0 ; i < arm ; i ++) {
			if (ar.get(i).p.p.z > w.z || ar.get(i).p.p.z < -w.z) {
				remove(i);
				println(i);
				add();
			}
		}
	}

	void render() {
		push();
		strokeWeight(w.x/400);
		translate(p.x,p.y,p.z);
		noStroke();
		//stroke(255);
		//box(w.x*2,w.y*2,w.z*2);
		fill(0);
		super.render();
		pop();
	}
}

class Shape extends Mob {
	Point w;
	int mode;
	IColor fillStyle = new IColor();

	Shape() {
		this.p = new Point();
		this.ang = new Point();
		this.w = new Point();
	}

	void update() {
		super.update();
		w.update();
		fillStyle.update();
	}

	void render() {
		setDraw();
		fillStyle.fillStyle();
		switch(mode) {
			case 0:
			box(w.p.x,w.p.y,w.p.z);
			break;
			case 1:
			beginShape();
			vertex(w.p.x,0,0);
			vertex(-w.p.x,0,0);
			vertex(0,w.p.y,0);
			vertex(w.p.x,0,0);
			endShape();
			break;
		}
		pop();
	}
}