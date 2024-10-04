// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract HealthData {
    struct Record {
        string data;
        address owner;
        bool exists;
    }

    mapping(bytes32 => Record) public records;

    event RecordCreated(bytes32 indexed recordId, address indexed owner);
    event RecordUpdated(bytes32 indexed recordId, string data);

    function createRecord(bytes32 recordId, string memory data) public {
        records[recordId] = Record(data, msg.sender, true);
        emit RecordCreated(recordId, msg.sender);
    }

    function updateRecord(bytes32 recordId, string memory data) public {
        require(records[recordId].exists, "Record does not exist");
        require(msg.sender == records[recordId].owner, "Not authorized");
        records[recordId].data = data;
        emit RecordUpdated(recordId, data);
    }

    function getRecord(bytes32 recordId) public view returns (string memory, address) {
        require(records[recordId].exists, "Record does not exist");
        return (records[recordId].data, records[recordId].owner);
    }
}
