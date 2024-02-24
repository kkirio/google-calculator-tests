Feature: Percent operation

	Scenario: % button inputs "%" into calculator
		Given the calculator does not contain input
 		When the % button is pressed
  		Then the calculator input displays "0%"

	Scenario: Percent of a nonzero number
		Given the calculator does not contain input
		When "1% =" is input to the calculator
		Then the calculator input displays "0.01"

	Scenario: Percent of zero
		Given the calculator does not contain input
		When "0% =" is input to the calculator
		Then the calculator input displays "0"

	Scenario: Percent of a large number
		Given the calculator does not contain input 
		When "5 E 100 % =" is input to the calculator
		Then the calculator input displays "5e+98"

	Scenario: Percent of a small number
		Given the calculator does not contain input 
		When "5 E -100 % =" is input to the calculator
		Then the calculator input displays "5e-102"

	Scenario: Percent of infinity
		Given the previous answer was "Infinity"
		When "Ans % =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Input "%" before an operand is input
		Given the calculator input contains "("
		When "%" is input to the calculator
  		Then the calculator input displays "()"

	Scenario: Input multiple consecutive "%"
		Given the calculator input contains "1"
		When "% %" is input to the calculator
  		Then the calculator input displays "1%%"
