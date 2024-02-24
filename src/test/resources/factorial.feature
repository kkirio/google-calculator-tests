Feature: Factorial operation

	Scenario: ! button inputs "!" into calculator
		Given the calculator does not contain input
 		When the ! button is pressed
  		Then the calculator input displays "0!"

	Scenario: Factorial of a postive integer
		Given the calculator does not contain input
		When "5! =" is input to the calculator
		Then the calculator input displays "120"

	Scenario: Factorial of a postive decimal
		Given the calculator does not contain input
		When "5.3! =" is input to the calculator
		Then the calculator input displays "201.813275185"

	Scenario: Factorial of a negative integer
		Given the calculator does not contain input
		When "( -5 ) ! =" is input to the calculator
		Then the calculator input displays "Error"

	Scenario: Factorial of zero
		Given the calculator does not contain input
		When "0! =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: Factorial of a large number
		Given the calculator does not contain input 
		When "5 E 100 ! =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Factorial of a small number
		Given the calculator does not contain input 
		When "5 E -100 ! =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: Factorial of infinity
		Given the previous answer was "Infinity"
		When "Ans ! =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Input "!" before an operand is input
		Given the calculator input contains "("
		When "!" is input to the calculator
  		Then the calculator input displays "()"

	Scenario: Input multiple consecutive "!"
		Given the calculator input contains "4"
		When "! ! =" is input to the calculator
  		Then the calculator input displays "6.204484e+23"
