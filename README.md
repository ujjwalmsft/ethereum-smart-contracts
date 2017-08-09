# Get started with Smart Contracts

## Extensions
*   Visual Studio Code
    *   [solidity](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)
*   Visual Studio 2015
    *   [Solidity](https://marketplace.visualstudio.com/items?itemName=ConsenSys.Solidity)
*   Atom
    *   `language-ethereum`
    *   `autocomplete-solidity`


## Deploy a Smart Contract
### Via Command Line - Option 1
*   Install the compiler on Ubuntu
```
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install solc
which solc
```
*   Compile the contract
```
var contractCode = 'contract ...';
var compiledCode = web3.eth.compile.solidity(contractCode);

var _initVariable = ...;

var contract = web3.eth.contract(compiledCode.contractName.info.abiDefinition);
var contractDeployment = contract.new(_initVariable,{from:web3.eth.accounts[0], data: compiledCode.contractName.code, gas: 1000000}, function(e, contract){
  if(!e) {

    if(!contract.address) {
      console.log("Contract transaction send: TransactionHash: " + contract.transactionHash + " waiting to be mined...");

    } else {
      console.log("Contract mined! Address: " + contract.address);
      console.log(contract);
    }

  }
})
```
*   Copy and store the address and the ABI of the contract!

### Via Command Line - Option 2
*   Install the compiler on Ubuntu
```
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install solc
which solc
```
*   Create the Smart Contract locally on the machine where it shall be compiled -> `contractName.sol`
*   Compile the contract locally
```
echo "var contractOutput=`solc --optimize --combined-json abi,bin,interface contractName.sol`" > contractName.js
```
*   Attach to the geth session via `geth attach` and load the script created via `loadScript('contractName.js')`
*   Get the application binary interface (ABI) via `var contractNameAbi = contractOutput.contracts['contractName.sol:contractName'].abi`
*   Reference the contract via `var contractName = eth.contract(JSON.parse(contractNameAbi))`
*   Reference the contract binary via `var contractBinCode = "0x" + contractOutput.contracts['contractName.sol:contractName'].bin`
*   Deploy the contract
    *   Unlock the account to pay for the gas via `personal.unlockAccount(eth.accounts[0], pwd)`
    *   Create the transaction object via `var deployTransationObject = { from: eth.accounts[0], data: contractBinCode, gas: 1000000 };`
    *   Create a new instance of the contract via `var contractInstance = contractName.new(deployTransationObject)`
        *   This can some seconds
        *   If you enter just `contractInstance` you see the information about the instance -> as soon as address has an actual value the contract is deployed
*   To get the address of the contract
    *   `var contractNameAddress = eth.getTransactionReceipt(contractInstance.transactionHash).contractAddress`


### Online Compiler and then command line
*   Go to [Ethereum Online Compiler](https://remix.ethereum.org/#version=soljson-v0.4.11+commit.68ef5810.js)
*   Paste the code of the contract
*   Click on `Contract details`
*   Copy the code in `Web3 deploy`
*   Enter a value for inital variables
*   Connect to a transaction node
*   Unlock the account specified -> `personal.unlockAccount(eth.accounts[0])`
*   Paste the code and run it
*   Copy and store the address and the ABI of the contract!

### Via tools like Mist
*   Important: Increase maximum fee to be provided (e.g. x 10). The provided amount is usually not enough.


## To interact with the contract
### Get the contract
*   You need
    *   The address of the contract
    *   The ABI (Application Binary Interface)
*   Then
    *   `var address = 0x...;`
    *   `var abi = [{...`
    *   If you are not on the node with the contract stored in a variable
        *   `var contract = eth.contract(abi).at(address);`
    *   If you have a reference to the contract (see step from option 2 with output `eth.contract(JSON.parse(contractNameAbi))`)
        *   `var contract = contractInstance.at(address);`

### Run functions
*   Call functions (Read)
    * `contract.functionName.call(params);`
*   Transactional functions (Write)
    * `contract.functionName.sendTransaction(params, {from: eth.accounts[x], gas: xxx});`   