Feature: Exponentiation operations (x^y, e^x, 10^x, x^2, EXP, sqrt, y root x)

	Scenario: "x^y" button raises preceeding number to the power of the following number
		Given the calculator input contains "2"
 		When the x^y button is pressed
		And "3" is input to the calculator
  		Then the calculator input displays "2^3"

	Scenario: Exponentiate a positive number by another positive number
		Given the calculator does not contain input
		When "2 ^ 5 =" is input to the calculator
		Then the calculator input displays "32"

	Scenario: Multiple consecutive exponentiations
		Given the previous answer was "Infinity"
		When "2 ^ 3 ^ 2 =" is input to the calculator
		Then the calculator input displays "512"

	Scenario: Raise a negative number to an odd power
		Given the calculator does not contain input
		When "( -3 ) ^ 5 =" is input to the calculator
		Then the calculator input displays "-243"

	Scenario: Raise a negative number to an even power
		Given the calculator does not contain input
		When "( -3 ) ^ 4 =" is input to the calculator
		Then the calculator input displays "81"

	Scenario: Exponentiate 0 by a nonzero number
		Given the calculator does not contain input
		When "0 ^ 5 =" is input to the calculator
		Then the calculator input displays "0"
	
	Scenario: Exponentiate a nonzero number by 0
		Given the calculator does not contain input
		When "5 ^ 0 =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: Exponentiate 0 by 0
		Given the calculator does not contain input
		When "0 ^ 0 =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: Exponentiate a large number by a large number
		Given the calculator does not contain input 
		When "5 E 100 ^ 7 E 97 =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Exponentiate a large number by a small number
		Given the calculator does not contain input 
		When "5 E 100 ^ 7 E -97 =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: Exponentiate a small number by a large number
		Given the calculator does not contain input 
		When "5 E -100 ^ 7 E 97 =" is input to the calculator
		Then the calculator input displays "0"

	Scenario: Exponentiate a small number by a small number
		Given the calculator does not contain input 
		When "5 E -100 ^ 7 E -97 = =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: Exponentiate infinity by a finite number
		Given the previous answer was "Infinity"
		When "Ans ^ 5 =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Exponentiate a finite number by infinity
		Given the previous answer was "Infinity"
		When "5 ^ Ans =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Exponentiate infinity by 0
		Given the previous answer was "Infinity"
		When "Ans ^ 0 =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: Exponentiate 0 by infinity
		Given the previous answer was "Infinity"
		When "0 ^ Ans =" is input to the calculator
		Then the calculator input displays "0"

	Scenario: Exponentiate infinity by infinity
		Given the previous answer was "Infinity"
		When "Ans ^ Ans =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Input "^" before an operand is input
		Given the calculator input contains "("
		When "^" is input to the calculator
  		Then the calculator input displays "()"

	Scenario: √ button inputs "√" into calculator
		Given the calculator does not contain input
 		When the √ button is pressed
  		Then the calculator input displays "√()"
		
	Scenario: "EXP" button multiplies the preceeding number by 10 
				to the power of the following number
		Given the calculator does not contain input
		When "4 E 7 =" is input to the calculator
		Then the calculator input displays "40000000"

	Scenario: "e^x" button raises e to the power of the following number
		Given the calculator does not contain input
		When "Inv e^x 2 =" is input to the calculator
		And "Ans ÷ e = Ans ÷ e =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: "x^2" button squares the preceeding number
		Given the calculator input contains "5"
		When "Inv x^2 =" is input to the calculator
		Then the calculator input displays "25"

	Scenario: "y root x" button takes the preceeding number to the power of the inverse of the following number
		Given the calculator input contains "81"
		When "Inv y√x 4 =" is input to the calculator
		Then the calculator input displays "3"