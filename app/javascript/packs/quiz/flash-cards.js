window.onload = () => {
  var currentFlashCard = 0;
  var touchStart = 0;

  // Set up flash cards
  var flashCards = document.querySelectorAll('[data-flash-card]');
  flashCards.forEach((f) => {
    hideAnswer(f);
    f.style.display = "none";
    f.addEventListener('click', showAnswer);
  })

  // grading card is the flash card when the answer is showing
  // TODO this is only working for mobile. Change UI for desktop?
  function addEventsForGradingCard() {
    let flashCard = flashCards[currentFlashCard]
    flashCard.addEventListener('touchmove', (e) => {
      mouseXPosition = e.changedTouches[0].clientX;
      cardWidth = flashCard.clientWidth;
      newCardPosition = mouseXPosition - (cardWidth / 2);
      flashCard.style.left = `${newCardPosition}px`;
    })
    flashCard.addEventListener('touchstart', (e) => {
      touchStart = e.changedTouches[0].clientX;
    })
    flashCard.addEventListener('touchend', (e) => {
      touchEnd = e.changedTouches[0].clientX;
      if (Math.abs(Math.abs(touchStart) - Math.abs(touchEnd)) < 100) {
        var flashCard = flashCards[currentFlashCard];
        flashCard.style.left = "0px";
        return
      }
      if (touchStart < touchEnd) {
        answerFlashCard("correct", "600px")
      } else {
        answerFlashCard("incorrect", "-600px")
      }
    })
  }

  displayCurrectFlashCard();

  // This isn't done with css so I can still read the
  // answers on the flash cards index page
  function hideAnswer(flashCard) {
    let answer = flashCard.getElementsByClassName('quiz-answer')[0];
    answer.style.display = 'none';
  }

  function showAnswer() {
    addEventsForGradingCard();
    let answer = this.getElementsByClassName('quiz-answer')[0];
    answer.style.display = 'block';
  }

  function answerFlashCard(mark, direction) {
    var flashCardHiddenField = document.getElementById(`flash_cards_${mark}`);
    var quizAnswerStatus = document.getElementById('quizAnswerStatus');
    quizAnswerStatus.innerHTML = `<span class='quiz-${mark}'>${mark}</span>`;
    var flashCard = flashCards[currentFlashCard];
    flashCard.style.transition = "1s";
    flashCard.style.left = direction;
    changeFlashCard(flashCardHiddenField, flashCard);
  }

  function changeFlashCard(flashCardHiddenField, flashCard) {
    setTimeout(() => {
      value = flashCardHiddenField.value;
      value += flashCard.dataset.flashCard.concat(",");
      flashCardHiddenField.value = value;
      currentFlashCard++;
      quizAnswerStatus.innerHTML = "";
      document.documentElement.style.setProperty('--flashCardCategoryColour', flashCard.dataset.colour)
      displayCurrectFlashCard()
    }, 1000)
  }

  function displayCurrectFlashCard() {
    flashCards.forEach((f) => {
      f.style.display = "none";
    })
    flashCards[currentFlashCard].style.display = "block";
    var flashCard = flashCards[currentFlashCard];
    document.documentElement.style.setProperty('--flashCardCategoryColour', flashCard.dataset.colour)
  }
}
