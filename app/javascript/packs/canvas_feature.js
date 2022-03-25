var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");
asdf = 1;

function draw() {
  asdf++;
  ctx.clearRect(0, 0, 500, 500);
  ctx.beginPath();
  ctx.arc(asdf,50,40,0,2*Math.PI);
  ctx.strokeStyle = '#ff0000';
  ctx.stroke();


  setTimeout(() => {
    draw();
  }, 30)
}

draw();




// var canvasHeight = window.innerHeight - 100;
// var canvasWidth = window.innerWidth;

// // setup the project using p5.js
// function setup() {
//     createCanvas(canvasWidth, canvasHeight)
// }

// // draw each frame using p5.js
// function draw() {
//     background('rgba(0,0,0,0.25)');
//     for (f of fireworks) {
//         f.draw();
//         f.update();
//     }
//     for (p of particals) {
//         p.draw();
//         p.update();
//     }
//     if (fireworks.length > 50) {
//         fireworks.shift();
//     }
// }

// // The firework model
// var explosionCount = 50;
// var particalLimit = 200;
// var size = 6;

// class Firework {
//     constructor() {
//         this.diameter = size;
//         this.position = {
//             x: Math.floor(Math.random() * canvasWidth),
//             y: canvasHeight,
//         }
//         this.velocity = {
//             x: 0,
//             y: Math.floor(Math.random() * 5) + -10,
//         }
//         this.reduce = 0;
//         this.exploded = false;
//         this.alpha = 1;
//         this.color = {
//             r: Math.floor(Math.random() * 255),
//             g: Math.floor(Math.random() * 255),
//             b: Math.floor(Math.random() * 255),
//         }
//     }
//     draw() {
//         if (!this.exploded) {
//             point(this.position.x, this.position.y);
//             stroke(`rgba(${this.color.r},${this.color.g},${this.color.b},${this.alpha})`);
//             strokeWeight(this.diameter);
//         }
//     }
//     explode() {
//         for (let i = 0; i < explosionCount; i++) {
//             particals.push(new Partical(this.position.x, this.position.y, this.color));
//             if (particals.length > particalLimit) {
//                 particals.shift();
//             }
//         }
//         point(this.position.x, this.position.y);
//         stroke('rgba(255,255,255,0.7)');
//         strokeWeight(10);
//     }
//     update() {
//         if (!this.exploded) {
//             this.position.y += this.velocity.y;
//             if (this.reduce == 8) {
//                 this.velocity.y++;
//                 this.reduce = 0;
//             }
//             this.reduce++;
//             if (this.velocity.y > 0) {
//                 this.exploded = true;
//                 this.alpha = 0;
//                 this.explode();
//             }
//         }
//     }
// }

// // Loop to create new fireworks
// var fireworks = [];
// var fireworkDely = 400;
// var explosionPower = 2;

// function createFirework() {
//     fireworks.push(new Firework());
//     setTimeout(function() {
//         createFirework()
//     }, fireworkDely)
// }

// createFirework();

// // The partical model
// class Partical {
//     constructor(posX, posY, col) {
//         this.diameter = size / 2;
//         this.position = {
//             x: posX,
//             y: posY,
//         }
//         this.velocity = {
//             x: random(Math.abs(explosionPower) * -1, explosionPower),
//             y: random(Math.abs(explosionPower) * -1, explosionPower) - random(0, explosionPower),
//         }
//         this.reduce = 0;
//         this.alpha = 1;
//         this.color = {
//             r: col.r,
//             g: col.g,
//             b: col.b,
//         }
//     }
//     draw() {
//         point(this.position.x, this.position.y);
//         stroke(`rgba(${this.color.r},${this.color.g},${this.color.b},${this.alpha})`);
//         strokeWeight(this.diameter);
//     }
//     update() {
//         this.position.y += this.velocity.y;
//         this.position.x += this.velocity.x;
//         if (this.reduce > random(4, 50)) {
//             this.velocity.y++;
//             this.reduce = 0;
//         }
//         this.reduce++;
//         if (this.alpha > 0.2) {
//             this.alpha -= random(0, 0.05);
//         } else {
//             this.alpha = random(0, 0.9);
//         }
//     }
// }

// var particals = [];

