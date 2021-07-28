pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'ConsumerRole' to manage this role - add, remove, check
contract ConsumerRole{

  // Define 2 events, one for Adding, and other for Removing

  event consumerAdded(address consumerAddress);

  event consumerRemoved(address consumerRemoved);

  // Define a struct 'consumers' by inheriting from 'Roles' library, struct Role

  Roles.Role consumer;

  // In the constructor make the address that deploys this contract the 1st consumer
  constructor() public {
    consumer.bearer[msg.sender] = true;
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyConsumer() {
    require(consumer.bearer[msg.sender]==true);
    _;
  }

  // Define a function 'isConsumer' to check this role
  function isConsumer(address account) public view returns (bool) {
    return consumer.bearer[msg.sender];
  }

  // Define a function 'addConsumer' that adds this role
  function addConsumer(address account) public onlyConsumer {
  _addConsumer(account);
  emit consumerAdded(account);
  }

  // Define a function 'renounceConsumer' to renounce this role
  function renounceConsumer() public {
    _removeConsumer(msg.sender);
        emit consumerRemoved(msg.sender);
  }

  // Define an internal function '_addConsumer' to add this role, called by 'addConsumer'
  function _addConsumer(address account) internal {
      Roles.add(consumer, account);
  }

  // Define an internal function '_removeConsumer' to remove this role, called by 'removeConsumer'
  function _removeConsumer(address account) internal {
    Roles.remove(consumer, account);

  }
}