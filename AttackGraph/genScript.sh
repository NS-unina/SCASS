rm -rf output/ && mkdir output
docker run -ti --name mulval -v "$(pwd)"/output:/input -d --rm wilbercui/mulval bash -c "tail -f /dev/null"
docker cp Scenario1/epic_def.pl mulval:/input
docker cp mulval-knowledge-base/interaction_rules_def.P mulval:/input
docker exec mulval bash -c "graph_gen.sh epic_def.pl -v -p -r interaction_rules_def.P"
docker stop mulval