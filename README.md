# Gas tests for comparing various proxy deployments

| src/Factory.sol:Factory contract |                 |        |        |        |         |
| -------------------------------- | --------------- | ------ | ------ | ------ | ------- |
| Deployment Cost                  | Deployment Size |        |        |        |         |
| 1008202                          | 4447            |        |        |        |         |
| Function Name                    | min             | avg    | median | max    | # calls |
| createDirect                     | 91329           | 91329  | 91329  | 91329  | 1       |
| createTempOZ                     | 113774          | 113774 | 113774 | 113774 | 1       |
| createTempSol                    | 94000           | 94000  | 94000  | 94000  | 1       |
| createTstore                     | 111550          | 111550 | 111550 | 111550 | 1       |
| createV3                         | 258581          | 258581 | 258581 | 258581 | 1       |
| getTstoreImpl                    | 288             | 288    | 288    | 288    | 1       |
| updateTemp                       | 2029            | 2029   | 2029   | 2029   | 2       |
