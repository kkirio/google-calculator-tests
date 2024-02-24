Feature: Previous answer can be retrieved

	Scenario: Ans button inputs "Ans" into calculator
		Given the calculator does not contain input
 		When the Ans button is pressed
  		Then the calculator input displays "Ans"
	
	Rule: Ans returns 0 if there was no previous valid calculation

		Scenario: No previous calculation
			Given the calculator does not contain input
 			When the Ans button is pressed
  			Then the calculator input displays "0"

		Scenario: All previous calculations were invalid
			Given the previous answer was "Error"
			When the Ans button is pressed
			And the = button is pressed
			Then the calculator input displays "0"

	Rule: Ans returns the value of the most recent valid calculation

		Scenario: Most recent calculation was valid
			Given the calculator input contains "1 + 7 ="
			When the Ans button is pressed
			And the = button is pressed
			Then the calculator input displays "8"

		Scenario: Most recent calculation was invalid, 
				  but a previous calculation was valid
			Given the calculator input contains "1 + 7 ="
			And the previous answer was "Error"
			When the Ans button is pressed
			And the = button is pressed
			Then the calculator input displays "8"
