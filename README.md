# PolyHackNFT

### Mint a NFT on Polygon using hardhat and verify the contract on Polygonscan.

This project is a Demo NFT project which mints a NFT and verifies the smart contract all on the polygon Blockchain.

This project demonstrates a basic Hardhat use case. You can preview and edit the smart contract if you want to test it out. The deploy script has already been written and i will walk you through below on how to compile, deploy and verify the smart contract.

First we need to install all the dependencies you need for the project

Run

```
npm install
```

After installing the dependencies and must have gone through the smart contract, you need some specific things before you move forward.

-   You need to get your own RPC provider you can get it after you must have signed up with [Alchemy](https://www.alchemy.com/) or [Infura](https://infura.io/), for this project I used Alchemy i'll advice you do also. Create a new Application or project on the website and copy the RPC url of that project.
-   Create a .env file in your root directory that is where we will be storing sensitive information like your private key for your wallet, your RPC link and also your PolygonScan API key.
-   The third thing you are going to need is your Polygon API key, you can get that when you signUp to [PolygonScan](https://polygonscan.com/). Then go to your profile and Navigate your way to the API-KEYs section, add a new API key and copy the key.
-   Export your private key from your metamask wallet or which ever EVM compatible wallet you are using.
-   Store your PolygonScan API key, your RPC url and your private key in your .env file.

If you have done those steps above you are good to go, open your terminal and run these commands.

```
npx hardhat clean
```

```
npx hardhat compile
```

If you want to deploy on the Polygon mumbai Testnet run

```
npx hardhat run scripts/deploy.js --network mumbai
```

but if you want to deploy on the mainnet run

```
npx hardhat run scripts/deploy.js --network polygon
```

Either you deploy on the mumbai network or Polygon mainnet you will be greeted with the smart contract address, copy the address and store somewhere you will be needing if for the next command.

Before you run the next command you can go ahead to search your contract address on [PolygonScan.com](https://polygonscan.com/) or [Mumbai-Polygonscan.com](https://mumbai.polygonscan.com/) depends on whichever network you deployed the smart contract to.

To verify the smart Contract run

```
npx hardhat verify smart-contract-address --network mumbai
```

Replace smart-contract-address with your own smartcontract address

use mumbai as the network if you deployed on the polygon test network and use Polygon as the network if you deployed on the mainnet.

You can go ahead and read or Write to the smart contract you can do so on Polygonscan or mumbai-polygonscan whichever network you designed thats what
