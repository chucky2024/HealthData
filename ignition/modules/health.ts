import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const HealthDataModule = buildModule("HealthDataModule", (m) => {

    const Health = m.contract("HealthData");

    return { Health };
});

export default HealthDataModule;
//contract address = 0x811D05323b5777E2B9acFc62AE1011A108884bE5;