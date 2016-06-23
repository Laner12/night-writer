# Night Writer

### Overview
Night Writer is a program that translates Braille to English or English to Braille. Inspiration for this assignment came from the earliest use of Braille by Napoleon's army.

To run the program, clone down the [project](https://github.com/Laner12/night-writer) and change directories into the root directory.

The original assignment can be found [here](https://github.com/turingschool/curriculum/blob/master/source/projects/night_writer.markdown)
### Getting Started
* In order for it to translate, you first need to add text lines to the message.txt file.

* Then in your terminal run the command:
```
ruby ./lib/night_write.rb message.txt braille.txt
```
* The newly created Braille text can be found in the braille.txt file.

* Then to turn the Braille back into the original message, run the command:
```
ruby ./lib/night_read.rb braille.txt original_message.txt
```
