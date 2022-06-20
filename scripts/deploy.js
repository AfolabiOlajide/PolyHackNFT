const hre = require("hardhat");

async function main() {
	const PolyHackNFT = await hre.ethers.getContractFactory("PolyHackNFT");
	const polyHackNft = await PolyHackNFT.deploy();

	await polyHackNft.deployed();

	console.log("PolyHackNFT deployed to:", polyHackNft.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.error(error);
		process.exit(1);
	});

// Testnet Deployment Address : 0x469319f102DfB615176b91dfb9A5cA1693a9fF97
