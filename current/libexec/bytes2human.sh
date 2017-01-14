#!/bin/sh
# 
# Shell script to convert bytes to a more human-readable form.
# Eg. KB, MB, GB, TB, PB, YB, EB, etc.

###                     ###
### SCRIPT EXPECTATIONS ###
###                     ###

# Input Expected:
# bytes2human.sh (numeric integer value)

# Output Expected:
# (numeric integer value)

###       ###
### TO DO ###
###       ###

# 1) -

###          ###
### PROGRAMS ###
###          ###
PRINTF="/usr/bin/printf"
BC="/usr/bin/bc"

###           ###
### VARIABLES ###
###           ###
DEBUG_FLAG=0
CURRENT_STEP=0
NEXT_STEP=1

###        ###
### ARRAYS ###
###        ###
ARRAY_FILE_SIZES=($0)
ARRAY_FILE_SIZES_NAMES=(B KB MB GB TB EB PB YB ZB)

###           ###
### FUNCTIONS ###
###           ###

fn_HELP() {
    $PRINTF "This is the help menu.\n"
}

###      ###
### MAIN ###
###      ###

# Read input from arguments. 
ARRAY_FILE_SIZES[$CURRENT_STEP]=$1

# Debug:
if [ $DEBUG_FLAG -eq 0 ]; then
    $PRINTF "CURRENT_STEP is: $CURRENT_STEP\n"
    $PRINTF "NEXT_STEP is: $NEXT_STEP\n"
    $PRINTF "ARRAY_FILE_SIZES[$CURRENT_STEP] is: ${ARRAY_FILE_SIZES[$CURRENT_STEP]}\n"
    $PRINTF "X-----\n"
fi

# I couldn't figure out the logic to get this to work. Tried another way.
##while [ ${ARRAY_FILE_SIZES[$CURRENT_STEP]} -ge 1024 ]
while [ $CURRENT_STEP -ne $NEXT_STEP ]
do 

    if [ ${ARRAY_FILE_SIZES[$CURRENT_STEP]} -ge 1024 ]; then
        # We need to use bc because we require floating point numbers.
        ARRAY_FILE_SIZES[$NEXT_STEP]=`$PRINTF "scale=2; ${ARRAY_FILE_SIZES[$CURRENT_STEP]} / 1024 \n" | $BC`

        if [ $DEBUG_FLAG -eq 0 ]; then
            $PRINTF "ARRAY_FILE_SIZES[$CURRENT_STEP] is: ${ARRAY_FILE_SIZES[$CURRENT_STEP]} \n"
            $PRINTF "ARRAY_FILE_SIZES[$NEXT_STEP] is: ${ARRAY_FILE_SIZES[$NEXT_STEP]} \n"
            $PRINTF "X-----\n"
        fi 
    
        # Increment NEXT_STEP
        ((NEXT_STEP++))

        if [ $DEBUG_FLAG -eq 0 ]; then
            $PRINTF "CURRENT_STEP is: $CURRENT_STEP\n"
            $PRINTF "NEXT_STEP is: $NEXT_STEP\n"
            $PRINTF "X-----\n"
        fi

    fi
    # Increment CURRENT_STEP
    ((CURRENT_STEP++))

done

# Output final number:
#$PRINTF "${ARRAY_FILE_SIZES[*]:1}\n"
$PRINTF "${ARRAY_FILE_SIZES[$CURRENT_STEP]}\n"

exit 0
#EOF
