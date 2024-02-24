Feature: Multiplication operation is performed by ×

	Scenario: × button inputs "×" into calculator
		Given the calculator does not contain input
 		When the × button is pressed
  		Then the calculator input displays "0 ×"

	Scenario: Multiply two numbers
		Given the calculator does not contain input
		When "4 × 7 =" is input to the calculator
		Then the calculator input displays "28"

	Scenario: Multiply many numbers
		Given the calculator does not contain input
		When "2 × 3 × 4 × 5 × 6 × 7 × 8 × 9 × 10 × 11 =" is input to the calculator
		Then the calculator input displays "39916800"

	Rule: Multiplying by zero equals zero

		Scenario: Multiply zero by a nonzero number
			Given the calculator input contains "2"
			When "× 0 =" is input to the calculator
			Then the calculator input displays "0"

		Scenario: Multiply zero by zero
			Given the calculator does not contain input 
			When "0 + 0 =" is input to the calculator
			Then the calculator input displays "0"

	Scenario: Multiply two large numbers
		Given the calculator does not contain input 
		When "5 E 100 × 7 E 97 =" is input to the calculator
		Then the calculator input displays "3.5e+198"

	Scenario: Multiply a large number and a small number
		Given the calculator does not contain input 
		When "5 E 100 × 7 E -97 =" is input to the calculator
		Then the calculator input displays "35000"

	Scenario: Multiply two small numbers
		Given the calculator does not contain input 
		When "5 E -100 × 7 E -97 =" is input to the calculator
		Then the calculator input displays "3.5e-196"

	Scenario: Multiply infinity by a nonzero finite number
		Given the previous answer was "Infinity"
		When "Ans × 2 =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Multiply infinity by zero
		Given the previous answer was "Infinity"
		When "Ans × 0 =" is input to the calculator
		Then the calculator input displays "Error"

	Scenario: Multiply infinity by infinity
		Given the previous answer was "Infinity"
		When "Ans × Ans =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Input "×" before an operand is input
		Given the calculator input contains "("
		When "×" is input to the calculator
  		Then the calculator input displays "()"

	Scenario: Input multiple consecutive "×"
		Given the calculator input contains "1"
		When "× ×" is input to the calculator
  		Then the calculator input displays "1 ×"

	Scenario: Parentheses around one number performs multiplication with an adjacent number
		Given the calculator does not contain input
		When "( 4 ) 7 =" is input to the calculator
  		Then the calculator input displays "28"