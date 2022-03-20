const imageContainerOuter = document.querySelector(".project-imageContainer-outer")
const imageContainerInner = document.querySelector(".project-imageContainer-inner")
const projectImageWrapper = document.querySelector(".project-imageWrapper");
var outerRotation = 0;
var innerRotation = 0;
var imageRotation = 0;

function rotate_circles() {
  outerRotation += 0.1;
  innerRotation -= 0.2;
  imageRotation += 0.1;
  imageContainerOuter.style.transform = `rotate(${outerRotation}deg)`;
  imageContainerInner.style.transform = `rotate(${innerRotation}deg)`;
  projectImageWrapper.style.transform = `rotate(${imageRotation}deg)`;

  setTimeout(() => {
    rotate_circles();
  }, 15)
}

rotate_circles();
