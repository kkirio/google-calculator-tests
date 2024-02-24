Feature: Combine different operations

	Scenario: Addition and multiplication
		Given the calculator does not contain input 
		When "2 + 1 × 3 =" is input to the calculator
		Then the calculator input displays "5"

	Scenario: Addition and division
		Given the calculator does not contain input 
		When "2 + 6 ÷ 3 =" is input to the calculator
		Then the calculator input displays "4"

	Scenario: Addition and percentage
		Given the calculator does not contain input 
		When "2 + 50% =" is input to the calculator
		Then the calculator input displays "3"

	Scenario: Addition and factorial
		Given the calculator does not contain input 
		When "2 + 4! =" is input to the calculator
		Then the calculator input displays "26"

	Scenario: Addition and log
		Given the calculator does not contain input 
		When "2 + log(100) =" is input to the calculator
		Then the calculator input displays "4"

	Scenario: Addition and exponentiation
		Given the calculator does not contain input 
		When "2 + 3 ^ 4 =" is input to the calculator
		Then the calculator input displays "83"

	Scenario: Addition and trigonometric functions
		Given the calculator is in Deg mode
		When "2 + sin(90) =" is input to the calculator
		Then the calculator input displays "3"

	Scenario: Multiplication and percentage
		Given the calculator does not contain input 
		When "3 × 50% =" is input to the calculator
		Then the calculator input displays "1.5"

	Scenario: Multiplication and factorial
		Given the calculator does not contain input 
		When "3 × 4! =" is input to the calculator
		Then the calculator input displays "72"

	Scenario: Multiplication and log
		Given the calculator does not contain input 
		When "3 × log(100) =" is input to the calculator
		Then the calculator input displays "6"

	Scenario: Multiplication and exponentiation
		Given the calculator does not contain input 
		When "3 × 2 ^ 4 =" is input to the calculator
		Then the calculator input displays "48"

	Scenario: Multiplication and trigonometric functions
		Given the calculator is in Deg mode
		When "3 × sin(90) =" is input to the calculator
		Then the calculator input displays "3"

	Scenario: Log and factorial
		Given the calculator does not contain input 
		When "log(4!) =" is input to the calculator
		Then the calculator input displays "1.38021124171"

	Scenario: Log and trigonometric functions
		Given the calculator is in Deg mode
		When "log(sin(45)) =" is input to the calculator
		Then the calculator input displays "-0.15051499783"

	Scenario: Exponentiation and trigonometric functions
		Given the calculator is in Deg mode
		When "sin(4!) =" is input to the calculator
		Then the calculator input displays "0.40673664307"
