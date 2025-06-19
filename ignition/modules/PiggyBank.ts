// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";



const LockModule = buildModule("PiggyBank", (m) => {
 

  const PiggyBank = m.contract("PiggyBank");

  return { PiggyBank };
});

export default LockModule;
