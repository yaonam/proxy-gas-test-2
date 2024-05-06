# Gas tests for comparing various proxy deployments

| src/Factory.sol:Factory contract |                 |        |        |        |         |
| -------------------------------- | --------------- | ------ | ------ | ------ | ------- |
| Deployment Cost                  | Deployment Size |        |        |        |         |
| 748562                           | 3245            |        |        |        |         |
| Function Name                    | min             | avg    | median | max    | # calls |
| createTempOZ                     | 113795          | 113795 | 113795 | 113795 | 1       |
| createTempSol                    | 93954           | 93954  | 93954  | 93954  | 1       |
| createTstore                     | 111571          | 111571 | 111571 | 111571 | 1       |
| getTstoreImpl                    | 265             | 265    | 265    | 265    | 1       |
| updateTemp                       | 2006            | 2006   | 2006   | 2006   | 2       |
