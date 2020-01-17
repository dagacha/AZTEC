Deposit funds into zero-knowledge form - convert public ERC20 tokens into zero-knowledge AZTEC notes.

__Arguments__
- {String} __to__: Ethereum address to which the user is 'depositing' the zero-knowledge funds. The address will become the owner of the notes
- {Number} __amount__: Number of public ERC20 tokens being converted into notes

## Examples
### Convert 50 ERC20 tokens into zero-knowledge notes, owned by the user
```js
// Enable the SDK
const apiKey = '7FJF5YK-WV1M90Y-G25V2MW-FG2ZMDV';
await window.aztec.enable({ apiKey });

// Fetch the zkAsset
const address = '0x7Fd548E8df0ba86216BfD390EAEB5026adCb5B8a';
const asset = await window.aztec.zkAsset(address);
console.info( asset );


const userPreDepositBalance = await asset.balance();
console.info({ userPreDepositBalance });

// Deposit funds into the ZkAsset
const user = '0xCF4cca97754C0C6a54621B6850f764354Ab2Cb3d';
const depositAmount = 50;
await asset.deposit(
  [
    {
      to: user,
      amount: depositAmount,
    },
  ],
  {},
);

const userPostDepositBalance = preDepositBalance + depositAmount;
console.info({ userPostDepositBalance });

```
&nbsp  


### Give a third party zero-knowledge notes worth 50 ERC20 tokens
```js
// Enable the SDK
const apiKey = '7FJF5YK-WV1M90Y-G25V2MW-FG2ZMDV';
await window.aztec.enable({ apiKey });

// Fetch the zkAsset
const address = '0x7Fd548E8df0ba86216BfD390EAEB5026adCb5B8a';
const asset = await window.aztec.zkAsset(address);
console.info( asset );


const preDepositBalance = await asset.balance();
console.info({ preDepositBalance });

// Deposit funds into the ZkAsset
const thirdParty = '0xD4CD0b1EF54E8E4D73f68b01b5ccc125b13E3d1e';
const depositAmount = 50;
await asset.deposit(
  [
    {
      to: thirdParty,
      amount: depositAmount,
    },
  ],
  {},
);

const postDepositBalance = preDepositBalance + depositAmount;
console.info({ postDepositBalance });
```