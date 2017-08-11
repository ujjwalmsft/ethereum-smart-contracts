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

## Misc
*   Keep models as simple as possible but no simpler
*   Interfaces tend to be useful, Inheritance tends to be evil
*   Favor composition over inheritance
*   Only one contract is created regardless the inheritance chain
*   Modify contracts via methods in methods
*   Mark untrusted contracts when interacting with such a contract
*   Explicitely mark visibility in functions and state variables
    *   private, public, internal...
*   Avoid race conditions
    *   I.e. a function can be called before the call before is finished (e.g. withdraw)
    *   Or two function share the same state

## Off chain interaction
*   Avoid external calls when possible
    *   Unexpected risks or errors
    *   May execute malicious code
    *   Can introduce blocking while other contracts may be called with a not updated state
*   Don't make control flow assumptions after external calls
    *   Assume that malicious code will execute if an external contract is untrusted
*   Favor pull over push for external calls
    *   External calls can fail accidentially or deliberately