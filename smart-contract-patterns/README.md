#   General
*   New, rather complex patterns are necessary as contracts are not like classes or objects.
*   Reasons
    *   When working object oriented
        *   The state is stored within the object
        *   Behavior is stored with the class -> all object use the logic stored in the class
        *   I.e. versioning is only necessary with the class.
    *   When working with Smart Contracts
        *   State (address references, primitive types, structs, mappings) and logic (functions, events, function modifiers) are stored together
        *   Smart Contracts manage versioning and upgrades differently
            *   Contract can't be changed after they have been created.

#   Tips
*   Keep models as simple as possible but no simpler
*   Interfaces tend to be useful, Inheritance tends to be evil
*   Favor composition over inheritance
*   Only one contract is created regardless the inheritance chain