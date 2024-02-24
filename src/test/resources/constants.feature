Feature: Constants (0-9, π, e) can be input into the calculator

	Scenario Outline: Pressing a button on the calculator displays its value
  		Given the calculator does not contain input
 		When the <button> button is pressed
  		Then the calculator input displays "<output>"

		Examples:
			| button | output |
			|    0   |    0   |
			|    1   |    1   |
			|    2   |    2   |
			|    3   |    3   |
			|    4   |    4   |
			|    5   |    5   |
			|    6   |    6   |
			|    7   |    7   |
			|    8   |    8   |
			|    9   |    9   |
			|    π   |    π   |
			|    e   |    e   |
	

