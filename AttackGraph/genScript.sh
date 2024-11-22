rm -rf output/ && mkdir output
docker run -ti --name mulval -v "$(pwd)"/output:/input -d --rm wilbercui/mulval bash -c "tail -f /dev/null"
docker cp scass.pl mulval:/input
docker cp interaction_rules_def.P mulval:/input
docker exec mulval bash -c "graph_gen.sh scass.pl --nometric -v -p -r interaction_rules_def.P"
docker stop mulval
