# Simple-MIPS-Calculator
This is a simple MIPS calculator for my Computer Organization and Assembly class

User Manual Document:
1. Load the file “Final Project Assembly Code” into QtSpim
2. Run the program and open the console
3. Follow the instructions in the console, which will require the user to:

    a. Input a number from 1-9 depending on which equation the user wants to execute
    from the options shown in the console
		
    b. Input the variable that will be used in the equation:
				(i.) Depending on which equation the user chooses, they will be guided to
        input another variable
				(ii.) Due to exception handling, if a user inputs an incorrect variable they will
        be prompted to re-input the correct integers
				
    c. Once the answer to the equation is calculated and printed, the user will be asked if
    they would like another equation to be solved. Inputting the number 1 will prompt
    the computer to go back to point a, inputting 0 (or any other number for
    exception handling) will terminate the program
    
Errors and Exceptions:
1. Due to exception handeling, the powers problem function and the modulo problem function will
ask the user to input new, non-negative values instead of calculating them
