// SPDX-License-Identifier: MIT
// Bridge between ethereum and verus

pragma solidity >=0.6.0 < 0.8.0;
library VerusAddressCalculator{

    
    function stringToUint160(string memory value) public pure returns(uint160){
        bytes32 interimString = stringToBytes32(value);
        return uint160(bytes20(interimString));   
    }

    function uint160ToString(uint160 value) public pure returns(string memory){
        //convert to bytes20
        return bytes20ToString(bytes20(value));
    }

    function stringToBytes32(string memory source) public pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
            result := mload(add(source, 32))
        }
    }

    function uint160ToAddress(uint160 value) public pure returns(address){
        return address(value);
    }

    function addressToUint160(address value) public pure returns(uint160){
        return uint160(value);
    }

    function bytes20ToString(bytes32 x) public pure returns (string memory) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 20; j++) {
            byte char = byte(bytes32(uint256(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (uint j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        return string(bytesStringTrimmed);
    }

}