class Partical {
  constructor(posX, posY) {
    this.explosionPower = 1;
      this.diameter = 1;
      this.position = {
          x: posX,
          y: posY,
      }
      this.velocity = {
          x: -6 + Math.floor(Math.random() * 12),
          y: -6 + Math.floor(Math.random() * 12),
      }
  }
  draw() {
    ctx.moveTo(this.position.x, this.position.y)
    ctx.arc(this.position.x, this.position.y, this.diameter, 0, 2 * Math.PI);
    ctx.strokeStyle = '#ff0000';
    ctx.stroke();
  }
  update() {
    this.position.y += this.velocity.y;
    this.position.x += this.velocity.x;
    this.velocity.y += 0.1;
  }
}
class Firework {
  constructor() {
    this.diameter = 1;
    this.position = {
      x: 200 + (Math.floor(Math.random() * 300)),
      y: 500,
    }
    this.velocity = {
      x: 0,
      y: Math.floor(Math.random() * 5) + -10,
    }
    this.reduce = 0;
    this.exploded = false;
    this.alpha = 1;
  }
  draw() {
    if (!this.exploded) {
      ctx.moveTo(this.position.x, this.position.y)
      ctx.arc(this.position.x, this.position.y, this.diameter, 0, 2 * Math.PI);
      ctx.strokeStyle = '#ff0000';
      ctx.stroke();
    }
  }
  explode() {
    reset();
    for (let i = 0; i < 30; i++) {
        particals.push(new Partical(this.position.x, this.position.y));
    }
  }
  update() {
    if (!this.exploded) {
      this.position.y += this.velocity.y;
      if (this.reduce == 8) {
        this.velocity.y++;
        this.reduce = 0;
      }
      this.reduce++;
      if (this.velocity.y > 0) {
        this.exploded = true;
        this.alpha = 0;
        this.explode();
      }
    }
  }
}

var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");
var firework = new Firework;

function draw() {
  ctx.clearRect(0, 0, 500, 500);
  ctx.beginPath();

  firework.update();
  firework.draw();

  for (p of particals) {
    p.draw();
    p.update();
  }

  setTimeout(() => {
    draw();
  }, 30)
}

function reset() {
  setTimeout(() => {
    firework = new Firework;
    particals = []
  }, 7000)
}

var particals = [];

draw();
