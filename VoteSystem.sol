// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.18;

contract Elections {
    struct Candidate {
        uint256 id;
        string name;
        uint256 votes;
    }

    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public voters;
    uint256 numberOfCandidates = 0;
    address public adressOwner;

    event CandidateAdded(uint256 id, string name, uint256 votes);
    event Voted(address voter, uint256 candidateId);
    event Winner(Candidate[] winners);

    constructor() {
        adressOwner = msg.sender;
    }

    function addCandidate(string memory _name) public {
        require(msg.sender == adressOwner, "Only the owner can add candidates");

        candidates[numberOfCandidates] = Candidate(
            numberOfCandidates,
            _name,
            0
        ); // save candidate
        Candidate memory candidate = candidates[numberOfCandidates];
        emit CandidateAdded(candidate.id, candidate.name, candidate.votes);
        numberOfCandidates++;
    }

    function vote(uint256 _idCandidate) public {
        require(!this.voters(msg.sender), "You have already voted");

        voters[msg.sender] = true;
        candidates[_idCandidate].votes++;
        emit Voted(msg.sender, _idCandidate);
    }

    function getWinner() public returns (Candidate[] memory, string[] memory) {
        require(
            msg.sender == adressOwner,
            "Only the owner can calculate votes"
        );
        uint256 maxVotes = 0;

        uint256 winnerId = 1;
        bool doubleWinner = false;
        uint256 winnerId2 = 0;

        for (uint256 i = 0; i < numberOfCandidates; i++) {
            Candidate memory candidate = candidates[i];
            if (maxVotes < candidate.votes) {
                doubleWinner = false;
                maxVotes = candidate.votes;
                winnerId = candidate.id;
            } else if (maxVotes == candidate.votes) {
                doubleWinner = true;
                winnerId2 = candidate.id;
            }
        }
        Candidate[] memory winners = new Candidate[](doubleWinner ? 2 : 1);
        string[] memory winnersName = new string[](doubleWinner ? 2 : 1);

        winners[0] = candidates[winnerId];
        winnersName[0] = candidates[winnerId].name;
        if (doubleWinner) {
            winners[1] = candidates[winnerId2];
            winnersName[1] = candidates[winnerId2].name;
        }
        emit Winner(winners);
        return (winners, winnersName);
    }
}


