window.onload = () => {
  var currentFlashCard = 0;
  var touchStart = 0;

  // Set up flash cards
  var flashCards = document.querySelectorAll('[data-flash-card]');
  flashCards.forEach((f) => {
    hideAnswer(f);
    f.style.display = "none";
    f.addEventListener('click', showAnswer);
    document.documentElement.style.setProperty('--flashCardCategoryColour', f.dataset.colour)
  })

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
      if (touchStart < touchEnd) {
        correctAnswer()
      } else {
        incorrectAnswer()
      }
    })
  }

  displayCurrectFlashCard();

  function hideAnswer(flashCard) {
    let answer = flashCard.getElementsByClassName('quiz-answer')[0];
    answer.style.display = 'none';
  }

  function showAnswer() {
    addEventsForGradingCard();
    let answer = this.getElementsByClassName('quiz-answer')[0];
    answer.style.display = 'block';
  }

  function incorrectAnswer() {
    var flashCardHiddenField = document.getElementById('flash_cards_incorrect');
    var quizAnswerStatus = document.getElementById('quizAnswerStatus');
    quizAnswerStatus.innerHTML = "<span class='quiz-incorrect'>Incorrect</span>";
    var flashCard = flashCards[currentFlashCard];
    flashCard.style.transition = "1s";
    flashCard.style.left = "-600px";
    changeFlashCard(flashCardHiddenField, flashCard);
  }

  function correctAnswer() {
    var flashCardHiddenField = document.getElementById('flash_cards_correct');
    var quizAnswerStatus = document.getElementById('quizAnswerStatus');
    quizAnswerStatus.innerHTML = "<span class='quiz-correct'>Correct</span>";
    var flashCard = flashCards[currentFlashCard];
    flashCard.style.transition = "1s";
    flashCard.style.left = "600px";
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
  }
}
