import { ethers } from "hardhat";

async function main() {
  const wallet = await ethers.deployContract("Wallet");
  await wallet.waitForDeployment();

  console.log("Wallet deployed to:", wallet.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});