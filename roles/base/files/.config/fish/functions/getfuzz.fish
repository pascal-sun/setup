function getfuzz --description "Generate payload for fuzzing"

  if test -z "$FUZZ_NAME"
    set --universal --export FUZZ_NAME sun
  end
  if test -z "$FUZZ_INT"
    set --universal --export FUZZ_INT 1
  end

  echo -e 'Based on \e]8;;https://www.yeswehack.com/fr/learn-bug-bounty/black-box-testing-techniques-web-application\e\\YesWeHack article\e]8;;\e\\'
  echo -e "Current ID: $FUZZ_INT\n"

  echo -n "$(set_color red)<$FUZZ_NAME$FUZZ_INT>$(set_color normal)"
  echo -n "$(set_color yellow)\"$FUZZ_NAME$(math $FUZZ_INT+1)'$FUZZ_NAME$(math $FUZZ_INT+2)`$(set_color normal)"
  echo -n "$(set_color green)%$(set_color normal)"
  echo -n "$(set_color cyan)}}$(set_color normal)"
  echo -n "$(set_color blue))$FUZZ_NAME$(math $FUZZ_INT+3)"
  echo -n "$(set_color cyan)\${{$FUZZ_NAME$(math $FUZZ_INT+4)$(set_color normal)"
  echo -n "$(set_color magenta)\\$(set_color normal)"

  echo -n "<$FUZZ_NAME$(math $FUZZ_INT)>\"$FUZZ_NAME$(math $FUZZ_INT+1)'$FUZZ_NAME$(math $FUZZ_INT+2)`%}})$FUZZ_NAME$(math $FUZZ_INT+3)\${{$FUZZ_NAME$(math $FUZZ_INT+4)\\" | xclip -selection clipboard

  set --universal --export FUZZ_INT $(math $FUZZ_INT+5)

  echo -e "\n\n"
  echo "$(set_color red)Detect HTML injections (Likely vulnerable to XSS)$(set_color normal)"
  echo "$(set_color yellow)Quotation marks with 'sun<int>' in between to trigger possible syntax errors$(set_color normal)"
  echo "$(set_color green)Use to detect URL decoding in the backend, sometimes only '%' can cause errors$(set_color normal)"
  echo "$(set_color cyan)Trigger an error in the template engine by exiting a template tag and applying '%' to exit possible template statements$(set_color normal)"
  echo "$(set_color blue)Use the character ')' to end any paranthesis that was used with the quotation marks and 'sun<int>' to trigger a synthax error$(set_color normal)"
  echo "$(set_color magenta)Backlash at the end to escape the last quote if the input is isolated in quotation marks$(set_color normal)"
  echo ""
end
