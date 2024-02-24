Feature: Calculator input can be cleared

	Scenario: Clear when the calculator contains no input
  		Given the calculator does not contain input
 		When the AC button is pressed
  		Then the calculator input displays "0"

	Scenario: Clear a number from the calculator input
		Given the calculator input contains "1 + 7"
 		When the CE button is pressed
  		Then the calculator input displays "1 +"

	Scenario: Clear an operator from the calculator input
		Given the calculator input contains "1 +"
 		When the CE button is pressed
  		Then the calculator input displays "1"

	Scenario: Clear the output of a completed operation
		Given the calculator input contains "1 + 7 ="
 		When the AC button is pressed
  		Then the calculator input displays "0"
		And the previous answer is "8"