// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {Factory} from "../src/Factory.sol";

contract FactoryTest is Test {
    address immutable impl = address(this);
    Factory public factory;

    function setUp() public {
        factory = new Factory();
    }

    function test_V3() public {
        factory.createV3(impl);
    }

    function test_Tstore() public {
        factory.createTstore(impl);
    }

    function test_TempOz() public {
        factory.createTempOZ(impl);
    }

    function test_TempSol() public {
        factory.createTempSol(impl);
    }
}
