-- if there is space in the application name escape it or wrap the entire name in single qoutes.
set textEditor to "'Sublime Text'"

do shell script "open -a" & textEditor & " ~/.bash_profile"