window.onload = () => {
  var currentFlashCard = 0;
  var touchStart = 0;

  // Set up flash cards
  var flashCards = document.querySelectorAll('[data-flash-card]');
  flashCards.forEach((f) => {
    hideAnswer(f);
    f.style.display = "none";
    f.addEventListener('click', showAnswer);
    f.addEventListener('touchmove', (e) => {
      mouseXPosition = e.changedTouches[0].clientX;
      cardWidth = f.clientWidth;
      newCardPosition = mouseXPosition - (cardWidth / 2);
      f.style.left = `${newCardPosition}px`;
    })
    f.addEventListener('touchstart', (e) => {
      touchStart = e.changedTouches[0].clientX;
    })
    f.addEventListener('touchend', (e) => {
      touchEnd = e.changedTouches[0].clientX;
      if (touchStart < touchEnd) {
        correctAnswer()
      } else {
        incorrectAnswer()
      }
    })
  })

  // Set up incorrect buttons
  var incorrectButtons = document.querySelectorAll('[data-incorrect-button]');
  incorrectButtons.forEach((b) => {
    b.addEventListener('click', incorrectAnswer);
  })

  // Set up correct buttons
  var incorrectButtons = document.querySelectorAll('[data-correct-button]');
  incorrectButtons.forEach((b) => {
    b.addEventListener('click', correctAnswer);
  })

  displayCurrectFlashCard();

  function hideAnswer(flashCard) {
    let answer = flashCard.getElementsByClassName('quiz-answer')[0];
    answer.style.display = 'none';
  }

  function showAnswer() {
    let answer = this.getElementsByClassName('quiz-answer')[0];
    answer.style.display = 'block';
  }

  function incorrectAnswer() {
    var flashCardHiddenField = document.getElementById('flash_cards_incorrect');
    value = flashCardHiddenField.value;
    value += flashCards[currentFlashCard].dataset.flashCard.concat(",");
    flashCardHiddenField.value = value;
    currentFlashCard++;
    displayCurrectFlashCard()
  }

  function correctAnswer() {
    var flashCardHiddenField = document.getElementById('flash_cards_correct');
    value = flashCardHiddenField.value;
    value += flashCards[currentFlashCard].dataset.flashCard.concat(",");
    flashCardHiddenField.value = value;
    currentFlashCard++;
    displayCurrectFlashCard()
  }

  function displayCurrectFlashCard() {
    console.log(flashCards)
    flashCards.forEach((f) => {
      f.style.display = "none";
    })
    flashCards[currentFlashCard].style.display = "block";
  }
}
