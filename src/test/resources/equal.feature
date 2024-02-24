Feature: Equals button

	Scenario: Equals performs calculation in the calculator's input
  		Given the calculator input contains "1 + 7"
 		When the = button is pressed
  		Then the calculator input displays "8"

	Scenario: Equals does not change state when calculator contains no input
  		Given the calculator does not contain input
 		When the = button is pressed
  		Then the calculator input displays "0"