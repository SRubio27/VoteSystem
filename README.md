# 🗳️ Elections Smart Contract

A simple and transparent smart contract for running decentralized elections on the Ethereum blockchain, written in Solidity.

## ✨ Features

- 👤 Only the contract owner can add candidates
- ✅ One vote per address (voter)
- 🏆 Calculates the winner and handles ties
- 📡 Emits events for key actions (adding candidates, voting, announcing winner)

## 🧱 Built With

- [Solidity ^0.8.10](https://docs.soliditylang.org/)
- Ethereum-compatible blockchain
- Remix IDE / Hardhat (for development and testing)

## 🛠️ Functions

### `addCandidate(string memory _name)`
> Adds a new candidate to the election. Only callable by the contract owner.

### `vote(uint256 _idCandidate)`
> Casts a vote for a candidate. Each address can vote only once.

### `getWinner()`
> Calculates the winner(s) of the election. Returns one or two candidates if there's a tie.

## 📦 Deployment

You can deploy this contract using [Remix IDE](https://remix.ethereum.org) or integrate it into your Hardhat/Truffle project.

### Example in Remix:
1. Paste the code into a new Solidity file.
2. Compile using compiler version `^0.8.10`.
3. Deploy the contract.
4. Use the interface to add candidates, vote, and check winners.

## 🔐 Access Control

- Only the contract **owner** (`adressOwner`) can add candidates and calculate the winner.
- Every **voter** (address) can only vote once.

## 📤 Events

- `CandidateAdded(uint256 id, string name, uint256 votes)`
- `Voted(address voter, uint256 candidateId)`
- `Winner(Candidate[] winners)`

## 🚨 Note

- This contract is for educational and testing purposes.
- It does not handle candidate deletion or advanced vote verification.

## 📄 License

MIT License

---

🔗 Follow or contribute to this project for more decentralized solutions!  
Made with ❤️ using Solidity
