package ir.maktabSharif.q2;

import java.util.*;
import java.util.stream.Collectors;

public class Q2LengthFrequency {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Map<Integer, List<String>> wordMap = new HashMap<>();

        while (true) {
            System.out.println("Please enter a word: (if you want to exit, just type 'exit')");
            String myWord = input.next().trim();

            if (myWord.equals("exit")) {
                break;
            }

            int length = myWord.length();
            wordMap.computeIfAbsent(length, k -> new ArrayList<>()).add(myWord);

            String status = wordMap.entrySet().stream()
                    .map(entry -> entry.getKey() + ": " + entry.getValue())
                    .collect(Collectors.joining(", ", "[", "]"));

            System.out.println("current status: " + status);
        }

    }
}
