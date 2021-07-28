const HDWalletProvider = require('truffle-hdwallet-provider');

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      provider: () => new HDWalletProvider('b9f36e6e3739256677d4b6aaee6ba2f8928f710e73f8a9931a51f6cb8901fd23', `https://rinkeby.infura.io/v3/bf50f5f6f38142ecbab15c8bb90dcdbe`),
      network_id: 4,       // Rinkeby's id
      gas: 6721975,        
      gasPrice: 1000000000,  // 1 gwei (in wei) (default: 100 gwei)
      confirmations: 2,    // # of confs to wait between deployments. (default: 0)
      timeoutBlocks: 200,  // # of blocks before a deployment times out  (minimum/default: 50)
      skipDryRun: true     // Skip dry run before migrations? (default: false for public nets )
    },
  }
};