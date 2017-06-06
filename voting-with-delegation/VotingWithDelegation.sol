pragma solidity ^0.4.9;

contract Ballot {
    /*
    * @title Voting with delegation
    * @author Joe
    */

    /*******************************************/
    // Data Structures
    /*******************************************/
    struct Voter {
        uint weight; // weight of the vote -> accumulated by delegation
        bool voted; // check if voted
        address delegate; // person delegated to
        uint vote; // index of the voted proposal
    }

    struct Proposal {
        bytes32 name; // name of the proposal
        uint voteCount; // number of votes
    }

    /*******************************************/
    // State variables
    /*******************************************/
    address public chairperson;
    mapping(address => Voter) public voters;
    Proposal[] public proposals;

    /*******************************************/
    // Constructor
    /*******************************************/
    /**@dev Create a new ballot
     */
    function Ballot(bytes32[] proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    /*******************************************/
    // Functions
    /*******************************************/
    /**@dev Give voter the right to vote on this ballot
      * Can only be called by `chairperson`
      * @param voter   Address of the voter
      */
    function giveRightToVote(address voter) {
        if (msg.sender != chairperson || voters[voter].voted) {
            throw;
        }
        voters[voter].weight = 1;
    }

    /**@dev Delegate vote to `to`
      * @param to   Address the vote right is delegated to
      */
    function delegate(address to) {
        Voter sender = voters[msg.sender];
        if (sender.voted){
            throw;
        }

        while (
            voters[to].delegate != address(0) &&
            voters[to].delegate != msg.sender
        ) {
            to = voters[to].delegate;
        }

        if (to == msg.sender) {
            throw;
        }

        sender.voted = true;
        sender.delegate = to;
        Voter delegate = voters[to];
        if (delegate.voted) {
            proposals[delegate.vote].voteCount += sender.weight;
        } else {
            delegate.weight += sender.weight;
        }
    }

    /**@dev Give vote to the proposal specified
      * @param proposal   Proposal ID
      */
    function vote(uint proposal) {
        Voter sender = voters[msg.sender];
        if (sender.voted) {
            throw;
        }

        sender.voted = true;
        sender.vote = proposal;

        // revert automatically if the proposal is not in the array
        proposals[proposal].voteCount += sender.weight;
    }

    /** @dev Computes the winning proposal
      * @notice constant -> only call needed, not sendTransaction
      * @return winningProposal ID of the winning proposal
      */
    function winningProposal () constant
            returns (uint winningProposal) {
        uint winningVoteCount = 0;
        for (uint p=0; p < proposals.length; p++) {
            winningVoteCount = proposals[p].voteCount;
            winningProposal = p;
        }
    }

    /** @dev Disclose the winners name (of the proposal)
      * @return winnerName  The name of the winner
      */
    function winnerName () constant
            returns (bytes32 winnerName) {
        winnerName = proposals[winningProposal()].name;
    }
}