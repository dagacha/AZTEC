pragma solidity >=0.5.0 <0.6.0;

import "../201907/Behaviour201907.sol";

/**
 * @title Behaviour201911
 * @author AZTEC
 * @dev Details the methods and the storage schema of a note registry.
        Is an ownable contract, and should always inherrit from the previous
        epoch of the behaviour contract. This contract defines the shared methods
        between all asset types for the 201911 generation (epoch 2).

        This epoch adds the ability to slow release assets for a fixed amount of time.
 * Methods are documented in interface.
 *
 * Copyright Spilsbury Holdings Ltd 2019. All rights reserved.
 **/
contract Behaviour201911 is Behaviour201907 {
    uint256 public constant slowReleaseEnd = 1580515200;
    bool public isAvailableDuringSlowRelease = false;

    modifier onlyIfAvailable() {
        // Not sensitive to small differences in time
        require(isAvailableDuringSlowRelease == true || slowReleaseEnd < block.timestamp,
        "AZTEC is in burn-in period, and this asset is not available");
        _;
    }

    function makeAvailable() public onlyOwner {
        require(isAvailableDuringSlowRelease == false, "asset is already available");
        isAvailableDuringSlowRelease = true;
    }

    function updateNoteRegistry(
        uint24 _proof,
        bytes memory _proofOutput
    ) public onlyOwner onlyIfAvailable returns (
        address publicOwner,
        uint256 transferValue,
        int256 publicValue
    ) {
        (
            publicOwner,
            transferValue,
            publicValue
        ) = super.updateNoteRegistry(_proof, _proofOutput);
    }
}
