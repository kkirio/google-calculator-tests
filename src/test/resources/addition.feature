Feature: Addition operation

	Scenario: + button inputs "+" into calculator
		Given the calculator does not contain input
 		When the + button is pressed
  		Then the calculator input displays "0 +"

	Scenario: Add two numbers
		Given the calculator does not contain input
		When "1 + 2 =" is input to the calculator
		Then the calculator input displays "3"

	Scenario: Add many numbers
		Given the calculator does not contain input
		When "1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 =" is input to the calculator
		Then the calculator input displays "45"

	Rule: Adding zero does not change input value

		Scenario: Add zero to a nonzero number
			Given the calculator does not contain input 
			When "0 + 1 =" is input to the calculator
			Then the calculator input displays "1"

		Scenario: Add zero to zero
			Given the calculator does not contain input 
			When "0 + 0 =" is input to the calculator
			Then the calculator input displays "0"

	Scenario: Add two large numbers
		Given the calculator does not contain input 
		When "5 E 100 + 7 E 97 =" is input to the calculator
		Then the calculator input displays "5.007e+100"

	Scenario: Add a large number and a small number
		Given the calculator does not contain input 
		When "5 E 100 + 7 E -97 =" is input to the calculator
		Then the calculator input displays "5e+100"

	Scenario: Add two small numbers
		Given the calculator does not contain input 
		When "5 E -100 + 7 E -97 =" is input to the calculator
		Then the calculator input displays "7.005e-97"

	Scenario: Add infinity to a finite number
		Given the previous answer was "Infinity"
		When "Ans + 1 =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Add infinity to infinity
		Given the previous answer was "Infinity"
		When "Ans + Ans =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Input "+" before an operand is input
		Given the calculator input contains "("
		When "+" is input to the calculator
  		Then the calculator input displays "()"

	Scenario: Input multiple consecutive "+"
		Given the calculator input contains "1"
		When "+ +" is input to the calculator
  		Then the calculator input displays "1 +"
