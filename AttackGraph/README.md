# Attack Graph
All attack paths for exploiting vulnerabilities in SCASS have already been compiled and are available in the *ag-pdf* directory. However, if you are interested in recompiling the attack paths, you can utilize the Makefile utility by executing the following commands:

- To compile all scenarios:
  ```bash
  make all
  ```

- To compile only the first scenario: 
  ```bash
  make scenario1
  ```

- To compile only the second scenario:
  ```bash
  make scenario2
  ```

Notably, this utility requires Docker to work.
