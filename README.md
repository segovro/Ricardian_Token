# Ethereum Ricardian-Voucher Token
Ethereum **ERC:20** and **legally valid token** that is a promise of a real world goods, products or merchandises

# Self-credit currencies issued by producers of goods or services
* Anyone who offers goods and services for sale in the market is qualified to issue currency. *THE END OF MONEY AND THE FUTURE OF CIVILIZATION, by Thomas H. Greco, Jr., 2009* 
* Buyers and sellers should be free to use any payment medium that is mutually agreeable to them, including the issuance and acceptance of their own currencies.
* Only the issuer of a currency should be obliged to accept it as payment, and must always accept it at face value (“at par”).
* There should be no forced circulation of any currency. Legal tender should obligate government only, and should not apply to transactions between private parties.
* Credit Coin is a contract backed by promises of future productivity, and in that sense, is no different than conventional bank credit, time-dollars or LETS systems. *DIGITAL COIN IN BRIEF, by Paul Grignon, 2009*
* ..., it is apparent that the buyer who issued the monetary instrument to the seller has made a commitment to the community that he, in his turn, will engage in business, i.e., will bid for money by offering his own goods and services in the open market. *FLIGHT FROM INFLATION, The Monetary Alternative, by E.C. Riegel, 2003*

![selfcredit](https://cloud.githubusercontent.com/assets/6016780/25551242/c1054e3e-2c47-11e7-8d19-46c37df6c93f.png)

Product vouchers are legal contracts with a specific data model *INTERNET-DRAFT Ko Fujimura XML Voucher: Generic Voucher Language https://tools.ietf.org/html/draft-ietf-trade-voucher-lang-07* 

![merchandise](https://cloud.githubusercontent.com/assets/6016780/25551320/91fef9d6-2c48-11e7-969d-cf482e6d301e.png)

Most of the ethereum ERC20: Token standard (ERC: Token standard 20) tokens rely only on promises just stated at a website. *ERC20: Token standard https://github.com/ethereum/EIPs/issues/20* 

In the end, their value relies only on the trust expressed in the market, and the investment made at the ICO, but have no legal validity. A Ricardian contract based token would bring to reality Thomas Greco, Bernard Leathaer and Paul Grigon dreams that every producer of a good is entitled to issue money as a promise about its production. 

# Smart contracts
A contract is a mutually agreeable arrangement of rules among mutually suspicious parties so they may cooperate with limited risks to each other's mischief. It is a game both are willing to play because both expect to win. A conventional contract is passive paper interpreted at great expense by lawyers and courts. A smart contract is written in program code, in which the logic of the program's execution enforce the terms of the contract. Smart contracts reduce costs by orders of magnitude, leading to a more cooperative world. *ERights.org, home of E, the secure distributed pure-object platform for writing Smart Contracts: Patterns of Cooperation without Vulnerability https://www.cypherpunks.to/erights/*

Smart contracts also known as a smart property are computer protocols that facilitate, verify, or enforce the negotiation or performance of a contract, or that make a contractual clause unnecessary. Smart contracts often emulate the logic of contractual clauses. Proponents of smart contracts claim that many kinds of contractual clauses may thus be made partially or fully self-executing, self-enforcing, or both. Smart contracts aim to provide security superior to traditional contract law and to reduce other transaction costs associated with contracting.  

A smart contract is a computerized transaction protocol that executes the terms of a contract. The general objectives are to satisfy common contractual conditions (such as payment terms, liens, confidentiality, and even enforcement), minimize exceptions both malicious and accidental, and minimize the need for trusted intermediaries. Related economic goals include lowering fraud loss, arbitrations and enforcement costs, and other transaction costs. *The Idea of Smart Contracts, 1997 by Nick Szabo, https://goo.gl/1CKyOj*  

Smart contracts go beyond the vending machine in proposing to embed contracts in all sorts of property that is valuable and controlled by digital means. Smart contracts reference that property in a dynamic, often proactively enforced form, and provide much better observation and verification where proactive measures must fall short.

A Smart Contract has to be: 
* **Smart** for computers: enforced by an executable script. Turing complete. 
* A **Contract** in the eyes of humans (lawyers). Semantics is human. A valid legal document.

# Ricardian contract
A Ricardian contract is a document which is legible to both a court of law and to a software application. Its purpose is to provide digital trading systems of various kinds the solidity of legally binding claims on property, so that you and your partners can concentrate on the business opportunity. *The Ricardian Contract http://iang.org/ricardian/*

The documents known as Ricardian contracts are the essential method to describe "value" in financial cryptography. The Ricardian contract is both a document that presents a form for a legal contract, and a design pattern to incorporate that document securely into an accounting system. When used properly, they are pervasive, being found in some sense from the client GUI layer down to the secure Internet protocol level. *Ricardian contracts http://www.webfunds.org/guide/ricardian.html*

![Ricardian Contract](http://www.webfunds.org/images/RC-bow-tie.png)

The Ricardian contract is a method of recording a document as a contract at law, and linking it securely to other systems such as accounting for the contract as an issuance of value. It is robust through use of identification by Cryptographic hash function, transparent through use of readable text for legal prose and efficient through markup language to extract essential information.  

In the simplest possible terms, a Ricardian Contract is a formatted document that is both human readable and program parsable. It identifies a Legal Issuer and an Issuance Server, and includes (OpenPGP) keys for those parties. The document is signed in (OpenPGP) cleartext form by the Legal Issuer's contract signing key. A unique identifier is formed by a canonical message digest (hash) which provides an unforgeable link to the accounting system. *Sistemics, The Ricardian Financial Instrument Contract http://www.systemics.com/docs/ricardo/issuer/contract.html*

# Ethereum Ricardian Tokens
The ethereum Standardized Contract APIs for Transferable Fungibles, ERC: Token standard 20, provides the basis for the executable part of a Ricardian contract. *Standardized_Contract_APIs https://github.com/ethereum/wiki/wiki/Standardized_Contract_APIs*    

As regards the semantic part, the swarm protocol allows to bind any ethereum ERC: Token standard 20 token to a human readable and legal valid document through it swarm hash. *Semantics, Blockchains and Ricardian Contracts https://www.slideshare.net/christopherbrewster/semantics-blockchains-and-ricardian-contracts*

Its the intersection of the two components that can create a blockchain based and legally valid currency that is a promise of a real world good. *On the intersection of Ricardian and Smart Contracts http://iang.org/papers/intersection_ricardian_smart.html*  

# Implementation
## Conformance to the ethereum ERC20 Token standard
**function** totalSupply() constant returns (uint256 totalSupply)  
**function** balanceOf(address _owner) constant returns (uint256 balance)  
**function** transfer(address _to, uint256 _value) returns (bool success)  
**function** transferFrom(address _from, address _to, uint256 _value) returns (bool success)  
**function** approve(address _spender, uint256 _value) returns (bool success)  
**function** allowance(address _owner, address _spender) constant returns (uint256 remaining)  
**event** Transfer(address indexed _from, address indexed _to, uint256 _value)  
**event** Approval(address indexed _owner, address indexed _spender, uint256 _value)  
## Conformance to the Ricardian contract
### Association and Producers fields
string **_brandname**; 		// the name you are normally known by in the street  
string **_shortname**; 		// short name is displayed by trading software, 8 chars  
string **_longname**; 		// full legal name  
string **_address**; 		// formal address for snail-mail notices  
string **_country**; 		// two letter ISO code that indicates the jurisdiction  
string **_registration**; 	// legal registration code of the legal person or legal entity   
address **_registryBzz**; 	// swarm hash of the signer human readable registry document  
### Token fields
uint256 **totalSupply**;  
string **voucherTokenName**;  
uint8 **decimals**;  
string **voucherTokenSymbol**;  
address **voucherTokenLogoBzz**;  		// swarm hash of the voucher icon or logo  
uint8 **validity_start**; 				// start date of the contract. Validity period of the voucher to redeem merchandises  
uint8 **validity_end**; 					// end date of the contract. Provides restrictions on the validity period of the voucher  
### Contract fields
address **contractBzz**; 	// swarm hash of the signer human readable contract  
string[] **merchandises**; 	// Provides restrictions on the object to be claimed   
string[] **definitions**; 	// Includes terms and definitions to be defined in a contract  
string[] **conditions**; 	// Provides any other applicable restrictions  
## Functioning
* There is an **Association** grouping the **Producers**, and issuing the voucher **tokens**. It also writes and signs the legal **contract**, defining the **merchandises** or goods, the **definitions** and the **conditions**
* The Association issues a value **V** of voucher tokens, valid for a period **M** of months. It holds it in the association wallet
* The Association accepts or rejects membership applications of Producers 
* Each Producer makes **promises** of production and sells of value **p** for month **m**
* The Association approves, or not, the promise. It will consider the capacity of the producer to conform to the quality parameters of the contract. Authorises the producer to **withdraw** tokens for value **p** to their wallet
* Sales consist in transferring tokens for value **s**, selling the price, from the buyer to the association wallet, redeeming the voucher. Deduct **s** to the promises **p** of the producer for that month **m**
* Any month **m**, the association adds the net remaining promise **p** (positive or negative) of each producer at any previous month **m-x** to the promise of month **m**
* At approving a new promise of a producer for a future month **m**, the association may consider decrease the requested promise in view of a prexisting promise or a carry over promisering **voucherTokenSymbol**;  
* Sales consist in transferring tokens for value **s**, selling the price, from the buyer to the association wallet, redeeming the voucher. Deduct **s** to the promises **p** of the producer for that month **m**
* Any month **m**, the association adds the net remaining promise **p** (positive or negative) of each producer at any previous month **m-x** to the promise of month **m**
* At approving a new promise of a producer for a future month **m**, the association may consider decrease the requested promise in view of a prexisting promise or a carry over promise

# Github
[https://github.com/segovro/Ricardian_Token](https://github.com/segovro/Ricardian_Token)

![alt](http://plastenka.hu/wp-content/uploads/2012/02/by-nc-nd.eu_.png)

[Attribution-NonCommercial-NoDerivatives 4.0 International CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/)
