Feature: Logarithm operations (ln, log)

	Scenario: ln button inputs "ln()" into calculator
		Given the calculator does not contain input
 		When the ln button is pressed
  		Then the calculator input displays "ln()"

	Scenario: log button inputs "log()" into calculator
		Given the calculator does not contain input
 		When the log button is pressed
  		Then the calculator input displays "log()"

	Scenario: Base of ln is e
		Given the calculator does not contain input
		When "ln(e) =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: Base of log is 10
		Given the calculator does not contain input
		When "log(10) =" is input to the calculator
		Then the calculator input displays "1"

	Scenario: ln of a postive number
		Given the calculator does not contain input
		When "ln(5) =" is input to the calculator
		Then the calculator input displays "1.60943791243"

	Scenario: log of a postive number
		Given the calculator does not contain input
		When "log(5) =" is input to the calculator
		Then the calculator input displays "0.69897000433"

	Scenario: ln of a negative number
		Given the calculator does not contain input
		When "ln(-5) =" is input to the calculator
		Then the calculator input displays "Error"

	Scenario: log of a negative number
		Given the calculator does not contain input
		When "log(-5) =" is input to the calculator
		Then the calculator input displays "Error"

	Scenario: ln of zero
		Given the calculator does not contain input
		When "ln(0) =" is input to the calculator
		Then the calculator input displays "-Infinity"
	
	Scenario: log of zero
		Given the calculator does not contain input
		When "log(0) =" is input to the calculator
		Then the calculator input displays "-Infinity"

	Scenario: ln of a large number
		Given the calculator does not contain input 
		When "ln(5 E 100) =" is input to the calculator
		Then the calculator input displays "231.867947212"

	Scenario: log of a large number
		Given the calculator does not contain input 
		When "log(5 E 100) =" is input to the calculator
		Then the calculator input displays "100.698970004"

	Scenario: ln of a small number
		Given the calculator does not contain input 
		When "ln(5 E -100) =" is input to the calculator
		Then the calculator input displays "-228.649071387"

	Scenario: log of a small number
		Given the calculator does not contain input 
		When "log(5 E -100) =" is input to the calculator
		Then the calculator input displays "-99.3010299957"

	Scenario: ln of infinity
		Given the previous answer was "Infinity"
		When "ln(Ans) =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: log of infinity
		Given the previous answer was "Infinity"
		When "log(Ans) =" is input to the calculator
		Then the calculator input displays "Infinity"

	Scenario: Perform ln before an operand is input
		Given the calculator does not contain input
		When "ln() =" is input to the calculator
  		Then the calculator input displays "Error"

	Scenario: Perform log before an operand is input
		Given the calculator does not contain input
		When "log() =" is input to the calculator
  		Then the calculator input displays "Error"

	Scenario: Input multiple consecutive "ln"
		Given the calculator does not contain input
		When "ln(ln(5)) =" is input to the calculator
  		Then the calculator input displays "0.47588499532"

	Scenario: Input multiple consecutive "log"
		Given the calculator does not contain input
		When "log(log(5)) =" is input to the calculator
  		Then the calculator input displays "-0.1555414612"