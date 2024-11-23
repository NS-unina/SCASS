#!/bin/bash

# Run mulval to generate the attack graph (without metrics)
# INPUT:
# -a --architecture mulval architecture file
# -r --rules interaction rule file

############################################################
# Help function                                            #
############################################################
help(){
  echo "Run mulval to generate the attack graph (without metrics)."
  echo "all file must be in the same directory of the script"
  echo
  echo "Syntax: scriptTemplate [-a|-r|-h]"
  echo "options:"
  echo "-a --architecture      Print the GPL license notification."
  echo "-r --rules             Interaction rule file."
  echo "-o --output            Output directory."
  echo "-h --help              Show help."
  echo
}

############################################################
# Main script                                              #
############################################################

while [ $# -ne 0 ]; do
  case $1 in
    -a | --architecture)
      shift
      architecture=$1
      shift
      ;;

    -r | --rules)
      shift
      rules=$1
      shift
      ;;

    -o | --output)
      shift
      output=$1
      shift
      ;;

    -h | --help)
      help
      exit 0
      ;;

    *)
      echo >&2 "Invalid command"
      help
      exit 1
      ;;
  esac
done

echo $architecture $rules $output
[ -d $output ] && echo >&2 "output directory alredy exist" && exit 1;

mkdir $output
docker run -ti --name mulval -v "$(pwd)"/"$output":/input -d --rm wilbercui/mulval bash -c "tail -f /dev/null"
docker cp $architecture mulval:/input
docker cp $rules mulval:/input
docker exec mulval bash -c "graph_gen.sh $architecture -v -p -r $rules --nometric"
docker stop mulval