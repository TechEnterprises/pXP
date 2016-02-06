contract token { 
    mapping (address => uint) public repBalanceOf;
    event RepTransfer(address sender, address receiver, uint amount);

  /* Initializes contract with initial supply 100 million GuildRep to Tech Enterprises, creator of the contract */
  function token(uint supply) {
        if (supply == 0) supply = 100000000;
        repBalanceOf[msg.sender] = supply;
    }

  /* Very simple trade function */
    function sendRep(address receiver, uint amount) returns(bool sufficient) {
        if (repBalanceOf[msg.sender] < amount) return false;
        repBalanceOf[msg.sender] -= amount;
        repBalanceOf[receiver] += amount;
        RepTransfer(msg.sender, receiver, amount);
        return true;
    }
}
