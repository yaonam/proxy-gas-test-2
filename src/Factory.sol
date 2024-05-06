// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";
import {ERC1967Utils} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol";
import {LibClone} from "solady/utils/LibClone.sol";

contract Factory {
    bytes32 constant SALT = keccak256(abi.encode("hello"));

    function createV3(address impl) external {
        new V3Proxy{salt: SALT}().initialize(impl);
    }

    function getTstoreImpl() external view returns (address impl) {
        assembly {
            impl := tload(0)
        }
    }

    function createTstore(address impl) external {
        assembly {
            tstore(0, impl)
        }
        new TstoreProxy{salt: SALT}();
    }

    function updateTemp(address actualImpl) external {
        ERC1967Utils.upgradeToAndCall(actualImpl, "");
    }

    // Self as temp init impl OZ
    function createTempOZ(address impl) external {
        Factory proxy = Factory(
            address(new TempOzProxy{salt: SALT}(address(this)))
        );
        proxy.updateTemp(impl);
    }

    // self as temp init impl solady
    function createTempSol(address impl) external {
        (, address proxy) = LibClone.createDeterministicERC1967(
            address(this),
            SALT
        );
        Factory(proxy).updateTemp(impl);
    }
}

contract V3Proxy is Proxy {
    function initialize(address implementation) external {
        require(_implementation() == address(0), "Already initialized");
        ERC1967Utils.upgradeToAndCall(implementation, "");
    }

    function _implementation()
        internal
        view
        virtual
        override
        returns (address)
    {
        return ERC1967Utils.getImplementation();
    }
}

contract TstoreProxy is Proxy {
    constructor() {
        address implementation = Factory(msg.sender).getTstoreImpl();
        ERC1967Utils.upgradeToAndCall(implementation, "");
    }

    function _implementation()
        internal
        view
        virtual
        override
        returns (address)
    {
        return ERC1967Utils.getImplementation();
    }
}

contract TempOzProxy is Proxy {
    constructor(address implementation) {
        ERC1967Utils.upgradeToAndCall(implementation, "");
    }

    function _implementation()
        internal
        view
        virtual
        override
        returns (address)
    {
        return ERC1967Utils.getImplementation();
    }
}
