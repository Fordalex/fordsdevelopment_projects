// How to use:
// Make sure the page is in a container with overflow: hidden;
// Then just add the following attributes to your html elements:
// data-aos-bottom="slow"
// data-aos-left="slow"
// data-aos-right="slow"
// data-aos-center="slow"
// Values that can be used: slow,

const TRANSITION_SPEED = {
  "slow": "2s",
  "medium": "1s",
  "fast": "0.5s"
}

const VALID_DIRECTIONS = [
  "bottom",
  "right",
  "left",
  "center"
]

const STARTING_POSITION = {
  "bottom" : {
    "opacity": "0",
    "transform": "translateY(100px)"
  },
  "left" : {
    "opacity": "0",
    "transform": "translateX(-100px)"
  },
  "right" : {
    "opacity": "0",
    "transform": "translateX(100px)"
  },
  "center" : {
    "opacity": "0",
    "transform": "scale(0)",
  }
}

const FINISHED_POSITION = {
  "bottom" : {
    "opacity": "1",
    "transform": "translateY(0px)"
  },
  "left" : {
    "opacity": "1",
    "transform": "translateX(0px)"
  },
  "right" : {
    "opacity": "1",
    "transform": "translateX(0px)"
  },
  "center" : {
    "opacity": "1",
    "transform": "scale(1)",
  }
}

function applyStartStyleToElement(direction, element) {
  for ([key, value] of Object.entries(STARTING_POSITION[direction])) {
    element.style[key] = value
  }
}

function applyFinishStyleToElement(direction, element) {
  for ([key, value] of Object.entries(FINISHED_POSITION[direction])) {
    element.style[key] = value
    element.style.transition = TRANSITION_SPEED["medium"]
  }
}

function setElementsStartingStyle() {
  for (direction of VALID_DIRECTIONS) {
    const elements = document.querySelectorAll(`[data-aos-${direction}]`);
    elements.forEach((e) => {
      applyStartStyleToElement(direction, e)
    })
  }
}

var shapeContainer = document.getElementById('shapeContainer')
var allOpen = false;

function checkVisible() {
  var windowBottomLocation = window.scrollY + window.innerHeight;
  var offset = 20;

  for (direction of VALID_DIRECTIONS) {
    const elements = document.querySelectorAll(`[data-aos-${direction}]`);
    elements.forEach((e) => {
      if (windowBottomLocation > e.offsetTop + offset) {
        applyFinishStyleToElement(direction, e)
      } else {
        applyStartStyleToElement(direction, e)
      }
    })
  }

  if (windowBottomLocation > shapeContainer.offsetTop + 250 && !allOpen) {
    openShape(true)
    allOpen = true;
  }
}

const hexShapes = document.querySelectorAll('.project-featureShape');
var hexCount = 0;

function openShape(first = false) {
  if (first) {
    hexShapes[hexCount].classList.add("project-featureShapeOpen");
    hexShapes[hexCount + 3].classList.add("project-featureShapeOpen");
  } else {
    hexShapes[hexCount].classList.add("project-featureShapeOpen");
    hexShapes[hexCount + 3].classList.add("project-featureShapeOpen");
    hexShapes[hexCount + 6].classList.add("project-featureShapeOpen");
  }
  hexCount++;
  if (hexCount < 10) {
    setTimeout(() => {
      openShape()
    }, 350)
  }
}

window.onload = function() {
  setElementsStartingStyle()
  checkVisible()
}

window.onscroll = function() {
  checkVisible()
}
