# Smart Contract Wallet

A simple smart contract wallet developed by Harvey Yorke. This wallet allows the owner to transfer and withdraw funds, and initiate a wallet recovery process.

## Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Yamamuchi/smart-contract-wallet.git
   cd smart-contract-wallet
   ```

2. Install Dependencies:
    ```bash
    npm install
    ```

3. Setup Environment Variables:
    Create a .env file in the root of your project.
    Fill in the necessary environment variables based on the networks you want to use. For example, if you only want to use Sepolia, your .env file would look like this:

    ```env
    PRIVATE_KEY=your-private-key
    ETHEREUM_SEPOLIA_RPC_URL=https://sepolia-url
    ```

    Note: Only write in the .env file the networks that you want to use.

4. Compile the Contract:
    ```bash
    npx hardhat compile
    ```

5. Deployment Instructions
    Deploy the Contract:

    ```bash
    npx hardhat run --network networkName scripts/deploy.js
    ```

    Replace networkName with the name of the network you want to deploy to, for example ethereumSepolia.

6. Verify the Contract (Optional):
    If you have set up an Etherscan, Polygonscan, or Arbiscan API key in your .env file, you can verify your contract on the respective block explorer:

    ```bash
    npx hardhat verify --network networkName deployed-contract-address
    ```

    Replace networkName with the name of the network you deployed to, and deployed-contract-address with the address of your deployed contract.

## Contract
The contract code can be found in the contracts/Wallet.sol file.

## Deploy Script
The deploy script can be found in the scripts/deploy.js file.

## Configuration
The Hardhat configuration can be found in the hardhat.config.js file.