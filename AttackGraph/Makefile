all: architecture scenario1-path1 scenario1-path2 scenario2 scenario3 scenario4

architecture:
	./genScript.sh -a architecture.pl -r interaction_rules.P -o architecture

scenario1-path1:
	./genScript.sh -a scenario1-path1.pl -r interaction_rules.P -o scenario1-path1

scenario1-path2:
	./genScript.sh -a scenario1-path2.pl -r interaction_rules.P -o scenario1-path2

scenario2:
	./genScript.sh -a scenario2.pl -r interaction_rules.P -o scenario2

scenario3:
	./genScript.sh -a scenario3.pl -r interaction_rules.P -o scenario3

scenario4:
	./genScript.sh -a scenario4.pl -r interaction_rules.P -o scenario4

clean:
	rm -rf architecture scenario1-path1 scenario1-path2 scenario2 scenario3 scenario4 