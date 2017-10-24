#!/usr/bin/env bash

# COLOR VARIABLES

no_color="\033[0m"
white="\033[0;37m"
light_white="\033[1;37m"
gray="\033[1;30m"
black="\033[0;30m"

red="\033[0;31m"
light_red="\033[1;31m"
green="\033[0;32m"
light_green="\033[1;32m"
yellow="\033[0;33m"
light_yellow="\033[1;33m"
blue="\033[0;34m"
light_blue="\033[1;34m"
magenta="\033[0;35m"
light_magenta="\033[1;35m"
cyan="\033[0;36m"
light_cyan="\033[1;36m"

# PROGRAM TEMP FILE VARIABLES

program='_test-program.out'
output='_test-output.txt'

# PROGRAM VARIABLES

projects=()
source_code='main.c'
samples='samples/*_in.txt'
only_warnings=false
error_count=0
fail_count=0
exit_with_error=false
compile=true
repeat_times=1
clean_temps=false

# FUNCTIONS

function printStart {
  echo -e "${light_yellow}--- IO tests for PROGTEST $1 ---${no_color}"
  echo
}

function printEnd {
  echo
  echo -e "$1"
}

function helpRule {
  printf "  ${light_green}-%-1s${no_color} | ${light_green}--%-14s${no_color} %-20s \n" "$1" "$2" "$3" 
}

function printHelp {
  echo -e "usage: ${light_yellow}./iotest.sh${no_color} ${light_green}[options]${no_color} ${light_magenta}<project-directory>${no_color}"
  echo

  helpRule "c" "clean-temp" "Clean temporary files after run."
  helpRule "h" "help" "Display help page."
  helpRule "w" "only-warnings" "Display only warnings, e.g. all errors and fails, but no OKs."
  helpRule "r" "repeat" "Times of repeating test for each file."
}

function terminateTest {
  echo -e "${light_red}Error:${no_color} $1"

  if [ "$2" != "" ]; then
    echo "$2"
  fi

  printHelp
  printEnd "${light_yellow}The test has been terminated.${no_color}"
  exit_with_error=true
}

# SWITCHES

OPTS=`getopt -o chwr: -l clean-temp,help,only-warnings,repeat: -- "$@"`
if [ $? != 0 ]; then
    exit 1
fi

eval set -- "$OPTS"

while true; do
    case "$1" in
        -c | --clean-temp) 
          clean_temps=true 
          shift
          ;;
        -h | --help) 
          printStart
          printHelp
          printEnd "${light_yellow}The help page was successfully shown.${no_color}"
          exit 0
          shift
          ;;
        -w | --only-warnings)
          only_warnings=true
          shift
          ;;
        -r | --repeat)
          if (( $2 > 1 )); then 
            repeat_times=$2
          else 
            echo # -e "${light_red}-r | --repeat requires a positive number.${no_color}"
          fi
          shift 2
          ;;
        --) 
          shift
          break
          ;;
    esac
done

for arg; do
  projects+=(${arg})
done

# PROGRAM

# If projects are not specified.
if [ ${#projects[@]} -eq 0 ]; then
  printStart
  terminateTest "No project has been specified."
fi

# Run tests on each project.
for project in ${projects[@]}; do
  if [ "${project:$((${#project}-1)):1}" != '/' ]; then
    project="${project}/"
  fi
  source_code="${project}${source_code}"
  samples="${project}${samples}"
  program="${project}${program}"
  output="${project}${output}"

  printStart "${project}"

  # If sample files do not exist.
  if ! compgen -G ${samples} > /dev/null; then
    terminateTest "No input samples found."
    continue
  fi

  # If compilation is requested.
  if ${compile}; then
    message_compilator=`gcc -Wall -pedantic -o "${program}" "${source_code}" -lm 2>&1`

    # If compilation fails.
    if [ $? -ne 0 ]; then
      terminateTest "The program failed to compile." "${message_compilator}"
      continue
    fi
  fi

  # Run through all sample files.
  for file in ${samples}; do
    for i in $(seq 1 ${repeat_times}); do
      out_file="${file//_in/_out}"

      # Executable file exists.
      if [ ! -f "${program}" ]; then
        terminateTest "File not found!"
        continue
      fi

      message_program=`"${program}" < "${file}" 2>&1 > "${output}"`

      # Run error of the program.
      if [ $? -ne 0 ]; then
        echo -e "${light_magenta}Error${no_color}: ${file}"
        echo "${message_program}"
        ((error_count++))
        continue
      fi

      message_diff=`diff "${output}" "${out_file}" 2>&1`

      # Decide what to do with diff results.
      if [ $? -ne 0 ]; then
        echo -e "${light_red}Fail${no_color}: ${file}";
        echo "${message_diff}"
        ((fail_count++))
      else
        if ! ${only_warnings}; then
          echo -e "${light_green}OK${no_color}: ${file}";
        fi
      fi  
    done
  done

  # Print test status according to fails and errors.
  if [ ${fail_count} -eq 0 ] && [ ${error_count} -eq 0 ]; then
    printEnd "${light_yellow}The test has been finished successfully.${no_color}"
    
  else
    printEnd "${light_yellow}The test has been finished with ${light_red}${fail_count} fails${no_color} ${light_yellow}and${no_color} ${light_magenta}${error_count} errors${no_color}."
    
    exit_with_error=true
  fi
done

# If the flag to clean temp files is set.
if ${clean_temps}; then
    rm "${output}"
    rm "${program}"
fi

# If the flag to exit with error is set.
if ${exit_with_error}; then
  exit 1
fi
