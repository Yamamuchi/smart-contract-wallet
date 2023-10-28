// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

/// @title Wallet
/// @author Harvey Yorke
/// @notice This contract implements a simple wallet. The wallet allows the owner to transfer funds, withdraw funds, and initiate a wallet recovery process. The contract emits events for tracking fund transfers and withdrawals.
contract Wallet {
    /// @notice The address of the wallet owner.
    /// @dev This state variable is set in the constructor and is used in the onlyOwner modifier.
    address public owner;

    /// @notice Event emitted when funds are sent from the wallet to another address.
    /// @param from The address of the sender.
    /// @param to The address of the receiver.
    /// @param amount The amount of funds sent.
    event Sent(address indexed from, address indexed to, uint256 amount);
    
    /// @notice Event emitted when funds are received by the wallet.
    /// @param from The address of the sender.
    /// @param amount The amount of funds received.
    event Received(address indexed from, uint256 amount);
    
    /// @notice Event emitted when funds are withdrawn from the wallet by the owner.
    /// @param amount The amount of funds withdrawn.
    event Withdrawn(uint256 amount);

    /// @notice Modifier to restrict access to the owner.
    /// @dev This modifier uses the require statement to ensure that only the owner can call the function.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    /// @notice Constructor sets the contract owner to the address that deployed the contract.
    /// @dev The constructor sets the initial state of the owner state variable.
    constructor() {
        owner = msg.sender;
    }

    /// @notice Transfer funds from the wallet to another address.
    /// @dev This function can only be called by the owner of the wallet.
    /// @param _to The address to send funds to.
    /// @param _amount The amount of funds to send.
    function transfer(address payable _to, uint256 _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Insufficient funds");
        _to.transfer(_amount);
        emit Sent(msg.sender, _to, _amount);
    }

    /// @notice Withdraw funds from the wallet to the owner's address.
    /// @dev This function can only be called by the owner of the wallet.
    /// @param _amount The amount of funds to withdraw.
    function withdraw(uint256 _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Insufficient funds");
        payable(owner).transfer(_amount);
        emit Withdrawn(_amount);
    }

    /// @notice Initiate the wallet recovery process.
    /// @dev This function is a placeholder for the wallet recovery logic to be implemented in the future. This function can only be called by the owner of the wallet.
    function initiateWalletRecovery() public onlyOwner {
        // Recovery logic to be implemented
    }

    /// @notice Function to receive funds.
    /// @dev This function is triggered when the contract is sent ether.
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}
