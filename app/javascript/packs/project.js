const imageContainerOuter = document.querySelector(".project-imageContainer-outer")
const imageContainerInner = document.querySelector(".project-imageContainer-inner")
const projectImageWrapper = document.querySelector(".project-imageWrapper");
var outerRotation = 0;
var innerRotation = 0;
var imageRotation = 0;

function rotate_circles() {
  outerRotation += 0.5;
  innerRotation -= 1;
  imageRotation += 0.5;
  imageContainerOuter.style.transform = `rotate(${outerRotation}deg)`;
  imageContainerInner.style.transform = `rotate(${innerRotation}deg)`;
  projectImageWrapper.style.transform = `rotate(${imageRotation}deg)`;
}

document.onmousemove = function() {
  rotate_circles();
}
