import { ethers } from "hardhat";
import { Todo } from "../typechain-types";

async function main() {
  const Todo = await ethers.getContractFactory("todo");
  const todo = await Todo.deploy();
  await todo.waitForDeployment();
  console.log("Deployed to ", await todo.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
