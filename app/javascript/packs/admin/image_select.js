function updateStyles() {
  const imageSelectTypes = document.querySelectorAll('[data-image-select-container]');

  imageSelectTypes.forEach((i) => {
    const imageType = i['dataset']['imageSelectContainer'];
    document.querySelectorAll(`[data-image-select-wrapper="${imageType}"]`).forEach((r) => {
      r.classList.remove('admin-iconWrapperActive');
      const radioButton = r.querySelector(`[data-image-select-radio="${imageType}"]`);

      if (radioButton.checked) {
        r.classList.add('admin-iconWrapperActive');
        document.querySelector(`[data-image-select-selected="${imageType}"]`).innerHTML = radioButton.value
      }
    });
 });
};

document.querySelectorAll('.admin-iconWrapper').forEach((r) => {
  r.addEventListener('click', updateStyles)
});

function displayOption() {
  const imageType = this['dataset']['imageSelectWrapper'];
  const imageValue = this.querySelector(`[data-image-select-radio="${imageType}"]`).value;
  console.log(imageType);
  console.log(imageValue);
  console.log(this)
  document.querySelector(`[data-image-select-option="${imageType}"]`).innerHTML = imageValue;
};

document.querySelectorAll('.admin-iconWrapper').forEach((r) => {
  r.addEventListener('mouseenter', displayOption);
  r.addEventListener('mouseout', console.log("Empty the option span"))
});

updateStyles();
