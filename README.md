# cheers_tdd
The ruby cheers exercise (see: elizabrock/cheers), this time 3 weeks into learning Ruby, with tests.

## Instructions
(What is the class supposed to do)

## Specifications
(How does it work)

Start the program by running './cheers.rb'

The program should ask:
> "Hello! What is your name?"
The user types in their name, for example:
> Austin

The program outputs a cheer in the folowing format:

>Give me an... A
>Give me a ... B
>Give me a ... B
>Give me a ... Y
>Abby's just GRAND!

* Follow the proper grammatical rules for 'a' and 'and'. The rule is based on whether the spelling of a letter would begin with a vowel.
* Ignore all special characters (i.e. non-word characters) when printing the cheer (e.g. "Give me ...")
* Print the user's name out as it was originally input for the "just GRAND" line
* If there was no input, ask again.

After printing out the user's cheer, the program asks:

> Hey, Abby, what's your birthday? (mm/dd)

The user types in their birthdate

> 08/25

* If there was no input, asks again until valid input is provided
* If there was input that couldn't be parsed, the program tries again, but with the prompt:

> I couldn't understand that. Could you give that to me in mm/dd format?

The program then outputs the number of days until the user's birthday

> Awesome! Your birtheday is in 45 days! Happy Birthday in advance

