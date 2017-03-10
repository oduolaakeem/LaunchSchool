// script.js

// What first...
// - when the page load i will need to get a random number between 1 and 100 - DONE
// - update the paragraph element with the initial text - DONE
// - add event listener to the submit input button - DONE
// - validate and compare the input of the textfield - DONE
// - take account of number of guesses - DONE
// - update the paragraph element with the correspondent text - DONE
// - congratulate the player in case he/she guessed the number - DONE
// - clear guess text field - DONE
// - get a new secret number - DONE
// - enable the submit button again - DONE
// - clear attempts - DONE

var MAX_NUMBER = 100;
var MIN_NUMBER = 1;
var secretNumber = getRandomNumber();
var attempts = 0;

document.addEventListener('DOMContentLoaded', function(event) {
  var p = document.querySelector('p');
  var guess = document.getElementById('guess');
  var button = document.querySelector('input[type="submit"]');
  var newGameLink = document.querySelector('a');
  
  p.textContent = 'Guess a number between ' + MIN_NUMBER + ' and ' + MAX_NUMBER;
  
  button.addEventListener('click', function(e) {
    e.preventDefault();

    var numberGuessed = parseInt(guess.value);
    attempts++
    
    if (!numberGuessed) {
      
      p.textContent = p.textContent + '. Please enter a number...';
      attempts--;
    } else if (numberGuessed < secretNumber) {
      p.textContent = 'My number is higher than ' + numberGuessed;
      guess.value = '';
    } else if (numberGuessed > secretNumber) {
      p.textContent = 'My number is lower than ' + numberGuessed;
      guess.value = '';
    } else if (numberGuessed === secretNumber) {
      p.textContent = 'You guessed it! It took you ' + attempts + ' guesses';
      this.disabled = true;    
    }
  });
  
  newGameLink.addEventListener('click', function(e) {
    e.preventDefault();
    
    guess.value = '';
    p.textContent = 'Guess a number between ' + MIN_NUMBER + ' and ' + MAX_NUMBER;
    button.disabled = false;
    secretNumber = getRandomNumber();
    attempts = 0;
  })
});

function getRandomNumber() {
  return Math.floor((Math.random() * (MAX_NUMBER - MIN_NUMBER)) + MIN_NUMBER);
}