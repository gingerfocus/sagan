public class dndTest {

	public static void main (String [] args) {
		int[] diceValues = new int[]{0, 4, 6, 8, 12};
		int index = 3;


		int numberOfRolls = 50;
		int iterations = 10000;

		int totalRollsBeforeFail = 0;
		int rollsBeforeFail = 0;

		int totalRollsValue = 0;
		int totalNumberRolls = 0;


		int[] numberTimesRolled = new int[diceValues.length];


		for (int interation = 0; interation < iterations; interation++) {
			index = 2;
			rollsBeforeFail = 0;
			for (int i = 0; i < numberOfRolls; i++) {

				int roll = (int)(Math.random() * diceValues[index]) + 1;
				totalNumberRolls++;
				rollsBeforeFail++;

				numberTimesRolled[index]++;// = numberTimesRolled[index] + 1;

				totalRollsValue += roll;

				if (roll == 1) {
					index--;
					if (index == 0) {
						numberTimesRolled[0] = numberTimesRolled[0] + 1;
						totalRollsBeforeFail += rollsBeforeFail;
						i = numberOfRolls;
					}
				} else if (roll == diceValues[index] && roll != diceValues[diceValues.length - 1]) {
					index++;
				}
			}
		}

		for (int i = 0; i < diceValues.length; i++) {
			System.out.println(diceValues[i] + ": " + numberTimesRolled[i]);
		}

		System.out.println("Average rolls before fail: " + ((double)totalRollsBeforeFail / iterations));
		System.out.println("Average rolls value: " + ((double)totalRollsValue / totalNumberRolls));

	}
}
