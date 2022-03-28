let projects = document.querySelectorAll('.project-toggable');

projects.forEach((p) => {
  p.addEventListener('click', toggleProject)
});

function toggleProject() {
  projects.forEach((p) => {
    p.classList.remove("project-open")
    p.classList.add("project-closed")
  })
  this.classList.remove("project-closed")
  this.classList.add("project-open")
}
