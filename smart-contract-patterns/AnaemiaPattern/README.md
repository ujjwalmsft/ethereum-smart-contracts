## Motivation
*   Separate responsibility for storing state and performing logic
*   I.e. have one contract keep the logic and one contract to keep the state
*   This allows e.g. to upgrade the logic without affecting state