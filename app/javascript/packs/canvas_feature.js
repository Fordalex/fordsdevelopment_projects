class Partical {
  constructor(posX, posY) {
    this.explosionPower = 1;
    this.diameter = Math.random() * 2;
    this.alpha = Math.random() * 6;
    this.position = {
        x: posX,
        y: posY,
    }
    this.velocity = {
        x: Math.random() < 0.5 ? -Math.abs(Math.random()) * 3 : Math.random() * 3,
        y: Math.random() < 0.5 ? -Math.abs(Math.random()) * 3 : Math.random() * 3
    }
    this.green = Math.floor(Math.random() * 210)
    this.blue = Math.floor(Math.random() * 210)
  }
  draw() {
    ctx.moveTo(this.position.x, this.position.y)
    ctx.beginPath();
    ctx.fillStyle = `rgba(255, ${this.green}, ${this.blue}, ${this.alpha})`;
    ctx.arc(this.position.x, this.position.y, this.diameter, 0, 2 * Math.PI);
    ctx.fill();
  }
  update() {
    this.alpha -= this.diameter / 50;
    this.position.y += this.velocity.y;
    this.position.x += this.velocity.x;
    this.velocity.y += this.diameter / 100;
    if (this.velocity.x > 0.5) {
      this.velocity.x -= this.diameter / 120;
    }
    if (this.velocity.x < -0.5) {
      this.velocity.x += this.diameter / 120;
    }
  }
}
class Firework {
  constructor() {
    this.diameter = 2;
    this.position = {
      x: 750 + (Math.floor(Math.random() * 100)),
      y: 500,
    }
    this.velocity = {
      x: 0,
      y: Math.floor(Math.random() * 2) + -12,
    }
    this.reduce = 0;
    this.exploded = false;
    this.alpha = 1;
  }
  draw() {
    if (!this.exploded) {
      ctx.moveTo(this.position.x, this.position.y)
      ctx.beginPath();
      ctx.arc(this.position.x, this.position.y, this.diameter, 0, 2 * Math.PI);
      ctx.fillStyle = `rgba(255, 100, 20, ${this.alpha})`;
      ctx.fill();
    }
  }
  explode() {
    for (let i = 0; i < 200; i++) {
        particals.push(new Partical(this.position.x, this.position.y));
    }
    ctx.moveTo(this.position.x, this.position.y)
    ctx.beginPath();
    ctx.arc(this.position.x, this.position.y, 10, 0, 2 * Math.PI);
    ctx.fillStyle = "#fff";
    ctx.fill();
  }
  update() {
    if (!this.exploded) {
      this.position.y += (this.velocity.y / 5);
      if (this.reduce == 8) {
        this.velocity.y++;
        this.reduce = 0;
      }
      this.reduce += 0.5;
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
  ctx.beginPath();
  ctx.rect(0, 0, 1250, 530);
  ctx.fillStyle = "rgba(0,0,0,0.1)"
  ctx.fill();

  firework.update();
  firework.draw();

  for (p of particals) {
    p.draw();
    p.update();
  }

  setTimeout(() => {
    draw();
  }, 10)
}

function reset() {
  setTimeout(() => {
    firework = new Firework;
    particals = []
  }, 7000)
}

var particals = [];

draw();

function shootFirework() {
  firework = new Firework;
  particals = [];
}


// Add event to firework button
var fireworkButton = document.getElementById('fireworkButton');
fireworkButton.addEventListener('click', shootFirework)
