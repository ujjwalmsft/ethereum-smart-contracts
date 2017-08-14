## Motivation
*   Often there are several contracts involved, one representing a main process and the others representing sub-processes
*   It is useful to decomposite different elements of an overall process (i.e. separate a main flow and sub flows)

## Introduce Hub and Spoke Pattern
*   Create multiple contracts
    *   One for the main flow / main process / core business process (Hub)
    *   Several for the sub flows / sub processes (Spokes)
*   This allows
    *   Work on different part of an overall process separately
    *   Provides decomposition
    *   Adds opacity where needed (i.e. not everything is for everyone)
    *   Upgrading
        *   Hubs
            *   Unregister "old" Hub contract
            *   Register "new" Hub contract
            *   Update the pointers in the Spokes contracts (e.g. via a "change owner" method)
            *   Optionally let the "old" Hub contract kill itself
        *   Spoke
            *   Spin up a new Spoke contract
            *   Unregister "old" Spoke contract
            *   Register "new" Spoke contract
            *   Update pointer in Hub contract
            *   Optionally let the "old" Spoke contract kill itself
    *   Branching -> implement different paths for different contexts
