Feature: Trigonometric functions (sin, cos, tan, arcsin, arccos, arctan)
	
	Scenario Outline: Trig functions calculate exact values for special angles
		Given the calculator is in <mode> mode
 		When the <function> button is pressed
		And "<angle> =" is input to the calculator
  		Then the calculator input displays "<output>"

		Examples:
			| mode | function | angle |     output    |
			|  Deg |    sin   |   0   |       0       |
			|  Deg |    cos   |   0   |       1       |
			|  Deg |    tan   |   0   |       0       |
			|  Deg |    sin   |   45  | 0.70710678118 |
			|  Deg |    cos   |   45  | 0.70710678118 |
			|  Deg |    tan   |   45  |       1       |
			|  Rad |    sin   |  π÷4  | 0.70710678118 |
			|  Rad |    cos   |  π÷4  | 0.70710678118 |
			|  Rad |    tan   |  π÷4  |       1       |
			|  Deg |    sin   |   90  |       1       |
			|  Deg |    cos   |   90  |       0       |
			|  Deg |    tan   |   90  |     Error     |
			|  Rad |    sin   |  π÷2  |       1       |
			|  Rad |    cos   |  π÷2  |       0       |
			|  Rad |    tan   |  π÷2  |     Error     |

		Scenario Outline: Inverse trig functions calculate exact angles for special values
			Given the calculator is in <mode> mode
			And the calculator input contains "Inv"
			When the <function> button is pressed
			And "<value> =" is input to the calculator
			Then the calculator input displays "<output>"
		
		Examples:
			| mode | function |  value |    output     |
			|  Deg |  arcsin  |    0   |       0       |
			|  Deg |  arccos  |    1   |       0       |
			|  Deg |  arctan  |    0   |       0       |
			|  Deg |  arcsin  | √(2)÷2 |      45       |
			|  Deg |  arccos  | √(2)÷2 |      45       |
			|  Deg |  arctan  |    1   |      45       |
			|  Rad |  arcsin  | √(2)÷2 | 0.78539816339 |
			|  Rad |  arccos  | √(2)÷2 | 0.78539816339 |
			|  Rad |  arctan  |    1   | 0.78539816339 |
			

		Scenario Outline: Trig functions approximate solutions to extreme inputs
			Given the calculator does not contain input
			When the <function> button is pressed
			And "<angle> =" is input to the calculator
			Then the calculator input displays "<output>"

			Examples:
				| function |   angle  | output |
				|    sin   |  5 E 100 |    0   |
				|    cos   |  5 E 100 |    0   |
				|    tan   |  5 E 100 |    0   |
				|    sin   | 5 E -100 | 5e-100 |
				|    cos   | 5 E -100 |    1   |
				|    tan   | 5 E -100 | 5e-100 |

			
		Scenario Outline: Trig functions fail when input is Infinity
			Given the previous answer was "Infinity"
			When the <function> button is pressed
			And "Ans =" is input to the calculator
			Then the calculator input displays "Error"

			Examples:
				| function |
				|    sin   |
				|    cos   |
				|    tan   |