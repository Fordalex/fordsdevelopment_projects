window.onload = () => {
  var currentFlashCard = 0;

  // Set up flash cards
  var flashCards = document.querySelectorAll('[data-flash-card]');
  flashCards.forEach((f) => {
    hideAnswer(f);
    f.style.display = "none";
    f.addEventListener('click', showAnswer);
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
    currentFlashCard++;
    var flashCardResult = document.getElementById('flash_cards_incorrect');
    value = flashCardResult.value;
    value += this.dataset.incorrectButton.concat(",");
    flashCardResult.value = value;
    displayCurrectFlashCard()
  }

  function correctAnswer() {
    currentFlashCard++;
    var flashCardResult = document.getElementById('flash_cards_correct');
    value = flashCardResult.value;
    value += this.dataset.correctButton.concat(",");
    flashCardResult.value = value;
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
