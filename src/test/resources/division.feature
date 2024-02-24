Feature: Division operation

	Scenario: ÷ button inputs "÷" into calculator
		Given the calculator does not contain input
 		When the ÷ button is pressed
  		Then the calculator input displays "0 ÷"

	Scenario: Divide two numbers
		Given the calculator does not contain input
		When "10 ÷ 2 =" is input to the calculator
		Then the calculator input displays "5"

	Scenario: Divide many numbers
		Given the calculator does not contain input
		When "11 ÷ 10 ÷ 9 ÷ 8 ÷ 7 ÷ 6 ÷ 5 ÷ 4 ÷ 3 ÷ 2 =" is input to the calculator
		Then the calculator input displays "0.0000030313"

	Scenario: Divide zero by a nonzero number
		Given the calculator does not contain input 
		When "0 ÷ 2 =" is input to the calculator
		Then the calculator input displays "0"

	Scenario: Divide a nonzero number by zero
		Given the calculator does not contain input 
		When "2 ÷ 0 =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Divide zero by zero
		Given the calculator does not contain input 
		When "0 ÷ 0 =" is input to the calculator
		Then the calculator input displays "Error"

	Scenario: Divide a large number by a large number
		Given the calculator does not contain input 
		When "5 E 100 ÷ 7 E 97 =" is input to the calculator
		Then the calculator input displays "714.285714286"

	Scenario: Divide a large number by a small number
		Given the calculator does not contain input 
		When "5 E -100 ÷ 7 E 97 =" is input to the calculator
		Then the calculator input displays "7.142857e-198"

	Scenario: Divide a small number by a large number
		Given the calculator does not contain input 
		When "5 E 100 ÷ 7 E -97 =" is input to the calculator
		Then the calculator input displays "7.142857e+196"

	Scenario: Divide a small number by a small number
		Given the calculator does not contain input 
		When "5 E -100 ÷ 7 E -97 =" is input to the calculator
		Then the calculator input displays "0.00071428571"

	Scenario: Divide infinity by a finite number
		Given the previous answer was "Infinity"
		When "Ans ÷ 2 =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Divide a fininte number by infinity
		Given the previous answer was "Infinity"
		When "2 ÷ Ans =" is input to the calculator
		Then the calculator input displays "0"

	Scenario: Divide infinity by zero
		Given the previous answer was "Infinity"
		When "Ans ÷ 0 =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Divide infinity by infinity
		Given the previous answer was "Infinity"
		When "Ans ÷ Ans =" is input to the calculator
		Then the calculator input displays "Error"

	Scenario: Input "÷" before an operand is input
		Given the calculator input contains "("
		When "÷" is input to the calculator
  		Then the calculator input displays "()"
	
	Scenario: Input multiple consecutive "÷"
		Given the calculator input contains "1"
		When "÷ ÷" is input to the calculator
  		Then the calculator input displays "1 ÷"
