import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import { HardhatConfig } from "hardhat/types";

const config: HardhatUserConfig = {
  solidity: "0.8.18",
  networks: {
    sepolia: {
      url: "https://sepolia.infura.io/v3/440853ffa75b4849b32917da43ad499b",
      accounts: [
        "d63313159a7d359ab1538941c60b7a98da451353b2f9006436b498cc89f4fab6",
      ],
    },
  },
};

export default config;
