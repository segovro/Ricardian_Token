pragma solidity ^0.4.8;

contract ricardianVoucher {
	// Generic Voucher Language https://tools.ietf.org/html/draft-ietf-trade-voucher-lang-07
	// The Ricardian Financial Instrument Contract http://www.systemics.com/docs/ricardo/issuer/contract.html
	
    // Owner of this smart contract
    address public owner;
    
    // Functions with this modifier can only be executed by the owner
    modifier onlyOwner() {
        if (msg.sender != owner) {
           throw;
        }
       _;
    }
    
    // Functions with this modifier can only be executed when voucherToken is in circulation
    modifier inCirculation {
        if ((now < validity_start) || (now < validity_end))
            throw;
        _;
    } 
    
    // Functions with this modifier can only be executed when voucherToken is in circulation
    modifier beforeCirculation {
        if (now > validity_start)
            throw;
        _;
    } 
  
    /* voucherToken MANAGEMENT */ 
	
	/* Public variables of the voucherToken */	
    string public standard = 'Token 0.1';
    uint256 public totalSupply;
    string public voucherTokenName;
    uint8 public decimals;
    string public voucherTokenSymbol;
    address public voucherTokenLogoBzz;  		// swarm hash of a voucher or voucherToken icon or logo
    uint256 public validity_start; 				// start date of the contract. Validity period of the voucher to redeem merchandises
    uint256 public validity_end; 				// end date of the contract. Provides restrictions on the validity period of the voucher
    uint8 public thisMonth = uint8((now - validity_start) / (4 * 1 weeks));
    
    /* Initializes voucherToken with initial supply voucherTokens to the creator of the contract */
    function ricardianVoucher(
        uint256 _totalSupply,
        string _voucherTokenName,
        uint8 _decimals,
        string _voucherTokenSymbol,
        address _voucherTokenLogoBzz,
        uint256 _validity_start_inWeeks, 					// in how many weeks the period starts
        uint256 _validity_end_inWeeks 					// in how many weeks the period ends
        ) {
    	owner = msg.sender;
        balances[owner] = uint256(totalSupply);       	// Give the creator all initial supply
        totalSupply = _totalSupply;                        	// Update total supply
        voucherTokenName = _voucherTokenName;                                  // Set the name for display purposes
        voucherTokenSymbol = _voucherTokenSymbol;                              // Set the symbol for display purposes
        decimals = _decimals; 								// Amount of decimals for display purposes
        voucherTokenLogoBzz = _voucherTokenLogoBzz;
        validity_start = now + (_validity_start_inWeeks * 1 weeks);
        validity_end = now + (_validity_end_inWeeks * 1 weeks);         
    }
    
    // Balances for each account, member or not member
    mapping(address => uint256) balances; 
    
    /* CONTRACT MANAGEMENT */
    
    address public contractBzz; 				// swarm hash of the signer human readable contract
    
    function linkContract (address _contractBzz) onlyOwner beforeCirculation { 
    	contractBzz = _contractBzz;
    }
    
    string[] merchandises; 						// Provides restrictions on the object to be claimed. Domain-specific meaning of the voucher
    string[] definitions; 						// Includes terms and definitions that generally desire to be defined in a contract
    string[] conditions; 						// Provides any other applicable restrictions
    
     
    /* write contract terms */
    // only the owner can write the contract terms
    // contract terms can only be written before circulation 
    
    function writeMerchandises (uint8 _number, string _merchandise) onlyOwner beforeCirculation {
    	merchandises[_number] = _merchandise;
    }
    function writeDefinitions (uint8 _number, string _definition) onlyOwner beforeCirculation {
    	definitions[_number] = _definition;
    }
    function writeConditions (uint8 _number, string _condition) onlyOwner beforeCirculation  {
    	conditions[_number] = _condition;
    }
    
    /* ASSOCIATION MANAGEMENT */    
    
    function declareAssociation (
        	string _name, 			// the name you are normally known by in the street
            string _shortname, 		// short name is displayed by trading software, 8 chars max
            string _longname, 		// full legal name
            string _postaddress, 		// formal address for snail-mail notices
            string _country, 		// two letter ISO code that indicates the jurisdiction
            string _registration, 	// legal registration code of the provider (legal person or legal entity)
            address _Bzz 			// swarm hash of the signer human readable registry document
           ) onlyOwner beforeCirculation {
    		provider[owner].member=true;
        	provider[owner].name=_name; 			
            provider[owner].shortname=_shortname; 		
            provider[owner].longname=_longname; 		
            provider[owner].postaddress=_postaddress; 		
            provider[owner].country=_country; 		
            provider[owner].registration=_registration; 	
            provider[owner].Bzz=_Bzz;
            ApplicationProvider(owner, _name, now);
        }
    
    /* PROVIDERS MANAGEMENT */
    
    // Providers
    struct providers {
    	bool member;
    	string name; 			// the name you are normally known by in the street
        string shortname; 		// short name is displayed by trading software, 8 chars max
        string longname; 		// full legal name
        string postaddress; 			// formal address for snail-mail notices
        string country; 			// two letter ISO code that indicates the jurisdiction
        string registration; 	// legal registration code of the provider (legal person or legal entity)
        address Bzz; 			// swarm hash of the signer human readable registry document
        uint256 allowed;
    }
   
    mapping(address => providers) provider;
    
    function applyProvider (
    	string _name, 			// the name you are normally known by in the street
        string _shortname, 		// short name is displayed by trading software, 8 chars max
        string _longname, 		// full legal name
        string _address, 		// formal address for snail-mail notices
        string _country, 		// two letter ISO code that indicates the jurisdiction
        string _registration, 	// legal registration code of the provider (legal person or legal entity)
        address _Bzz 			// swarm hash of the signer human readable registry document
       ) {
    	provider[msg.sender].name=_name; 			
        provider[msg.sender].shortname=_shortname; 		
        provider[msg.sender].longname=_longname; 		
        provider[msg.sender].postaddress=_address; 		
        provider[msg.sender].country=_country; 		
        provider[msg.sender].registration=_registration; 	
        provider[msg.sender].Bzz=_Bzz;
        ApplicationProvider(msg.sender, _name, now);
    }
    
    function approveProvider (address _providerAddress) onlyOwner {
    	provider[_providerAddress].member=true;
    	ApproveProvider (_providerAddress, provider[_providerAddress].name, now);
    }
    
    function deleteProvider (address _providerAddress) {
    	if (_providerAddress==msg.sender || msg.sender==owner) {
    	provider[_providerAddress].member=false;
    	DeleteProvider (_providerAddress, provider[_providerAddress].name, now);
    	}
    }
    
    /* PROMISES MANAGEMENT */
    

    struct promises {
    	    int256[] monthPromise;
    }
    
    mapping(address => promises) providerPromise;
    
    function addPromise (uint256 _month, uint256 _amount) {
    	if (provider[msg.sender].member==true){
    		int256 _promise=int256(_amount);
    		providerPromise[msg.sender].monthPromise[_month]=+_promise;
    		AddPromise (msg.sender, _month, _promise);
    	}
    }

	function approvePromise (address _provider, uint256 _month, uint256 _amount) onlyOwner {
			int256 _promise=int256(_amount);
			providerPromise[_provider].monthPromise[_month]=_promise;
			ApprovePromise (_provider, _month, _promise);
			// If the promise is approved the provider is allowed to withdraw now the corresponding quentity
			approve(_provider, _amount);
	}
	
	function carryOverPromise (address _provider, uint256 _fromMonth, uint256 _toMonth) onlyOwner {
		providerPromise[_provider].monthPromise[_toMonth]=+providerPromise[_provider].monthPromise[_fromMonth];
		ApprovePromise (_provider, _month, _promise);
	}
    
    
    /* VOUCHER CICULATION */  

    /* Send voucherTokens */
    function transfer(address _to, uint256 _amount) inCirculation {
        if (balances[msg.sender] >= _amount && _amount > 0) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            Transfer(msg.sender, _to, _amount);
        } 
    }

    // Allow _spender to withdraw from your account, multiple times, up to the _amount amount.
    // If this function is called again it overwrites the current allowance with _amount.
     function approve(address _spender, uint256 _amount) inCirculation {
         allowed[msg.sender][_spender] = _amount;
         Approval(msg.sender, _spender, _amount);
    }
     
     // Send _amount amount of voucherTokens from address _from to address _to
     // The transferFrom method is used for a withdraw workflow, allowing contracts to send
     // voucherTokens on your behalf, for example to "deposit" to a contract address and/or to charge
     // fees in sub-currencies; the command should fail unless the _from account has
     // deliberately authorized the sender of the message via some mechanism; we propose
     // these standardized APIs for approval:
     function transferFrom(address _from, address _to, uint256 _amount) inCirculation {
         //same as above. Replace this line with the following if you want to protect against wrapping uints.
         //if (balances[_from] >= _amount && allowed[_from][msg.sender] >= _amount && balances[_to] + _amount > balances[_to]) {
         if (balances[_from] >= _amount && allowed[_from][msg.sender] >= _amount && _amount > 0) {
             balances[_to] += _amount;
             balances[_from] -= _amount;
             allowed[_from][msg.sender] -= _amount;
             Transfer(_from, _to, _amount);
                      } 
     }

       
    /* SALES MANAGEMENT */
    
    /* GET INFORMATION */
     
    // What is this month with respect to the validity_start
     
    // What is the balance of a particular account?
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

	function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
	    return allowed[_owner][_spender];
	}
	
	function getVoucher () constant returns (
	        uint256 _totalSupply,
	        string _voucherTokenName,
	        uint8 _decimals,
	        string _voucherTokenSymbol,
	        address _voucherTokenLogoBzz,
	        uint8 _validity_start, 				
	        uint8 _validity_ends 					
	        ) {
		return (totalSupply,
	        voucherTokenName,
	        decimals,
	        voucherTokenSymbol,
	        voucherTokenLogoBzz,
	        validity_start, 				
	        validity_ends);
	}
	
	function getMerchandise (uint256 _number) constant returns (string _merchandise) {
		return merchandises[_number];
	}
	
	function getDefinition (uint256 _number) constant returns (string _definition) {
		return defitions[_number];
	}
	
	function getCondition (uint256 _number) constant returns (string _condition) {
		return conditions[_number];
	}
	
	function getProvider (address _provider) constant returns (string _name, 
	        string _shortname,
	        string _longname,
	        string _address,
	        string _country,
	        string _registration,
	        address _Bzz) {
		return (
		provider[_provider].name=_name,			
        provider[_provider].shortname=_shortname,	
        provider[_provider].longname=_longname, 		
        provider[_provider].postaddress=_address,		
        provider[_provider].country=_country, 		
        provider[_provider].registration=_registration, 	
        provider[_provider].Bzz=_Bzz
        );
	}
    
    /* EVENTS */
	
    /* This generates public events on the blockchain that will notify clients */
	
	//Triggered when a new provider applies
	event ApplicationProvider (address indexed _from, string _name, uint256 _timestamp);
	
	//Triggered when a new provider is approved
	event ApproveProvider (address indexed _from, string _name, uint256 _timestamp);
	
	//Triggered when a provider is deleted
	event DeleteProvider (address indexed _from, string _name, uint256 _timestamp);	
    
    // Triggered when voucherTokens are transferred.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

     // Triggered whenever approve(address _spender, uint256 _value) is called.
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    event AddPromise (address _provider, uint8 _month, uint256 _promise);
    
    /* OVERALL */
    

    /* This unnamed function is called whenever someone tries to send ether to it */
    function () {
        throw;     // Prevents accidental sending of ether
    }
}