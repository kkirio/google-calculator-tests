Feature: Subtraction operation

	Scenario: - button inputs "-" into calculator
		Given the calculator does not contain input
 		When the - button is pressed
  		Then the calculator input displays "-"

	Scenario: Subtract two numbers
		Given the calculator does not contain input
		When "7 - 3 =" is input to the calculator
		Then the calculator input displays "4"

	Scenario: Subtract many numbers
		Given the calculator does not contain input
		When "1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 =" is input to the calculator
		Then the calculator input displays "-43"

	Rule: Subtracting zero does not change input value

		Scenario: Subtract zero from a nonzero number
			Given the calculator does not contain input 
			When "1 - 0 =" is input to the calculator
			Then the calculator input displays "1"

		Scenario: Subtract zero from zero
			Given the calculator does not contain input 
			When "0 - 0 =" is input to the calculator
			Then the calculator input displays "0"

	Scenario: Subtract a large number from a large number
		Given the calculator does not contain input 
		When "5 E 100 - 7 E 97 =" is input to the calculator
		Then the calculator input displays "4.993e+100"

	Scenario: Subtract a large number from a small number
		Given the calculator does not contain input 
		When "5 E -100 - 7 E 97 =" is input to the calculator
		Then the calculator input displays "-7e+97"

	Scenario: Subtract a small number from a large number
		Given the calculator does not contain input 
		When "5 E 100 - 7 E -97 =" is input to the calculator
		Then the calculator input displays "5e+100"

	Scenario: Subtract a small number from a small number
		Given the calculator does not contain input 
		When "5 E -100 - 7 E -97 =" is input to the calculator
		Then the calculator input displays "-6.995e-97"

	Scenario: Subtract a fininte number from infinity
		Given the previous answer was "Infinity"
		When "Ans - 1 =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Subtract infinity from a finite number
		Given the previous answer was "Infinity"
		When "Ans - 1 =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Subtract infinity from infinity
		Given the previous answer was "Infinity"
		When "Ans - Ans =" is input to the calculator
		Then the calculator input displays "Error"

	Scenario: Input multiple consecutive "-"
		Given the calculator input contains "1"
		When "- -" is input to the calculator
  		Then the calculator input displays "1 -"
