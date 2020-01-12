class Tunnel extends Entity {
	Point p;
	Point w;
	SpringValue ang = new SpringValue(0);
	ArrayList<Ring> ar = new ArrayList<Ring>();

	Tunnel(PVector p, PVector w) {
		this.p = new Point(p);
		this.w = new Point(w);
	}

	void update() {
		p.update();
		w.update();
		ang.update();
		for (Ring ring : ar) {
			ring.update();
		}
	}

	void render() {
		push();
		translate(p.p.x,p.p.y,p.p.z);
		rotateZ(ang.x);
		for (Ring ring : ar) {
			ring.render();
		}
		pop();
	}

	
}

abstract class Ring extends Entity {
	SpringValue p;
	SpringValue ang;
	SpringValue w;
}