import static org.junit.jupiter.api.Assertions.assertEquals;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Wait;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import static java.util.Map.entry;


public class StepDefinitions {
	
	private final Map<String, String> BUTTONS = assignButtonID();
	private final List<String> OPERANDS = assignLongOperands();
	private WebDriver driver;
	private WebElement DISPLAY;
	private String angleMode;

	@Before
	public void init() {
		driver = new FirefoxDriver();
        driver.get("https://www.google.com/search?q=calculator");
		DISPLAY = driver.findElement(By.cssSelector(".z7BZJb"));
		angleMode = "Rad";
	}

	@Given("the calculator does not contain input")
	public void initEmpty() {
	}

	@Given("the calculator input contains {string}")
	public void performOperations(String instructions) {
		List<String> buttons = parseInstructions(instructions);
		for(String b : buttons) { 
			pressButton(b);
		}
	}

	@Given("the previous answer was {string}")
	public void previousState(String state) {
		if (state.equals("Infinity")) {
			performOperations("1000! =");
		} else if (state.equals("Error")) {
			performOperations("log(-1) =");
		}
	}

	@Given("the calculator is in {word} mode")
	public void setAngleMode(String mode) {
		if (!angleMode.equals(mode)) {
			pressButton(mode);
		}
	}

	@When("the {word} button is pressed")
	public void pressButton(String buttonName) {
		WebElement button = driver.findElement(By.cssSelector(BUTTONS.get(buttonName)));
		Wait<WebDriver> wait = new WebDriverWait(driver, Duration.ofSeconds(2));
		wait.until(d -> button.isDisplayed());
		button.click();
	}

	@When("{string} is input to the calculator")
	public void inputCalculator(String instructions) {
		List<String> buttons = parseInstructions(instructions);
		for(String b : buttons) { 
			pressButton(b);
		}
	}

	@Then("the calculator input displays {string}")
	public void checkDisplay(String expected) throws InterruptedException {
		Wait<WebDriver> wait = new WebDriverWait(driver, Duration.ofSeconds(2));
		wait.until(d -> DISPLAY.getText().equals(expected));
		assertEquals(expected, DISPLAY.getText());
	}

	@Then("the previous answer is {string}")
	public void checkAnswer(String expected) {
		performOperations("Ans =");
		assertEquals(expected, DISPLAY.getText());
	}

	@After
	public void closeDriver() {
        driver.quit();
	}
	
	private List<String> parseInstructions(String instructions) {

		List<String> buttonNames = new ArrayList<String>(Arrays.asList(
										instructions.split(" ")));

		for (int i = 0; i < buttonNames.size(); i++) {

			String b = buttonNames.get(i);

			// Remove instructions that are only whitespace
			if (b.trim().length() == 0) {
				buttonNames.remove(i);
			}
			
			// Check for compound instructions
			if (b.length() > 1) {
				int idx = b.indexOf("(");

				// contains parentheses, so must be ln(), log(), or trig functions
				// split on parentheses
				if (idx != -1) {
					String operator = b.substring(0, idx);
					String operand = b.substring(idx+1);

					// remove trailing ")"
					if (operand.charAt(operand.length()-1) == ')') {
						operand = operand.substring(0, operand.length()-1);
					}

					buttonNames.set(i, operator);

					buttonNames.addAll(i+1, parseInstructions(operand));

				// must be negative number or factorial, split on each character
				} else if (OPERANDS.contains(b)) {
					buttonNames.set(i, b);

				// split on each character
				} else {
					String[] expandedInstructions = b.split("(?<=\\G.)");
					buttonNames.set(i, expandedInstructions[0]);

					for (int j = 1; j < expandedInstructions.length; j++) {
						buttonNames.add(i+j, expandedInstructions[j]);
					}

				}
			}
		}
		return buttonNames;
	}

	private static List<String> assignLongOperands() {
		return Arrays.asList("Ans", "AC", "CE", "Rad", "Deg", "ln", "log", "Inv", "e^x", "10^x", "x^2", "sin", "cos", "tan", "arcsin", "arccos", "arctan");
	}

	private static Map<String, String> assignButtonID() {
		return Map.ofEntries(
			entry(".", ".mF5fo > .AOvabd"),
			entry("0", "tr:nth-child(5) .A2W7l > .XRsWPe"),
       		entry("1", "tr:nth-child(4) > td:nth-child(1) > .A2W7l > .XRsWPe"),
			entry("2", "tr:nth-child(4) > td:nth-child(2) > .A2W7l > .XRsWPe"),
			entry("3", "tr:nth-child(4) > td:nth-child(3) > .A2W7l > .XRsWPe"),
			entry("4", "tr:nth-child(3) > td:nth-child(1) > .A2W7l > .XRsWPe"),
			entry("5", "tr:nth-child(3) > td:nth-child(2) > .A2W7l > .XRsWPe"),
			entry("6", "tr:nth-child(3) > td:nth-child(3) > .A2W7l > .XRsWPe"),
			entry("7", "tr:nth-child(2) > td:nth-child(1) > .A2W7l > .XRsWPe"),
			entry("8", "tr:nth-child(2) > td:nth-child(2) > .A2W7l > .XRsWPe"),
			entry("9", "tr:nth-child(2) > td:nth-child(3) > .A2W7l > .XRsWPe"),
			entry("=", ".UUhRt"),
			entry("+", "tr:nth-child(5) .mF5fo > .MEdqYd"),
			entry("-", "tr:nth-child(4) .mF5fo > .XRsWPe"),
			entry("×", "tr:nth-child(3) .mF5fo > .XRsWPe"),
			entry("÷", "tr:nth-child(2) .mF5fo > .XRsWPe"),
			entry("CE", "td:nth-child(4) .XRsWPe:nth-child(2)"),
			entry("AC", "td:nth-child(4) > .UpZIS > .XRsWPe:nth-child(1)"),
			entry("Ans", "td:nth-child(1) .Krlpq"),
			entry("(", "td:nth-child(1) > .A2W7l > .MEdqYd"),
			entry(")", "td:nth-child(2) > .A2W7l > .MEdqYd"),
			entry("%", "td:nth-child(3) > .A2W7l > .MEdqYd"),
			entry("!", "tr:nth-child(1) > td:nth-child(2) > .UpZIS > .XRsWPe"),
			entry("ln", "tr:nth-child(2) > td:nth-child(3) .Krlpq"),
			entry("log", "tr:nth-child(3) > td:nth-child(3) .Krlpq"),
			entry("√", "tr:nth-child(4) > td:nth-child(3) .Krlpq"),
			entry("^", "tr:nth-child(5) > td:nth-child(3) .Krlpq"),
			entry("x^y", "tr:nth-child(5) > td:nth-child(3) .Krlpq"),
			entry("sin", "tr:nth-child(2) > td:nth-child(2) .Krlpq"),
			entry("cos", "tr:nth-child(3) > td:nth-child(2) .Krlpq"),
			entry("tan", "tr:nth-child(4) > td:nth-child(2) .Krlpq"),
			entry("E", "tr:nth-child(5) > td:nth-child(2) > .UpZIS > .XRsWPe"),
			entry("Rad", ".Tqvz7b"),
			entry("Deg", ".SwDSDf"),
			entry("π", "tr:nth-child(3) > td:nth-child(1) > .UpZIS > .XRsWPe"),
			entry("e", "tr:nth-child(4) > td:nth-child(1) > .UpZIS > .XRsWPe"),
			entry("Inv", ".feqqG"),
			entry("e^x", "tr:nth-child(2) > td:nth-child(3) .rHLwad"),
			entry("10^x", "tr:nth-child(3) > td:nth-child(3) .rHLwad"),
			entry("x^2", "tr:nth-child(4) > td:nth-child(3) .rHLwad"),
			entry("y√x", "tr:nth-child(5) > td:nth-child(3) .rHLwad"),
			entry("arcsin", "tr:nth-child(2) > td:nth-child(2) .rHLwad"),
			entry("arccos", "tr:nth-child(3) > td:nth-child(2) .rHLwad"),
			entry("arctan", "tr:nth-child(4) > td:nth-child(2) .rHLwad"),
			entry("Rnd", "td:nth-child(1) .rHLwad")			
		);

    }


}