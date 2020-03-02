const path = require('path');
const fs = require('fs-extra');
const solc = require('solc');

// Specify the build output directory
const buildPath = path.resolve('build');

// Creating the build output directory
const createBuildFolder = () => {
  console.log("Creating the build output directory...")
	fs.emptyDirSync(buildPath);
}

// Get the contracts source
const buildSources = () => {
  console.log("Getting the contracts source...")
  // Specify the directory where the contracts are stored
  const contractsFolderPath = path.resolve('eth-to-do-list-react', '../contracts');
  const sources = {};
  const contractsFiles = fs.readdirSync(contractsFolderPath);

  contractsFiles.forEach(file => {
    const contractFullPath = path.resolve(contractsFolderPath, file);
    sources[file] = {
      content: fs.readFileSync(contractFullPath, 'utf8')
    };
  });
  return sources;
}


// Compile the contracts
const compileContracts = () => {
  // Specify the input for the Solidity compiler
  const input = {
  	language: 'Solidity',
  	sources: buildSources(),
  	settings: {
  		outputSelection: {
  			'*': {
  				'*': [ 'abi', 'evm.bytecode' ]
  			}
  		}
  	}
  }
  console.log("Compiling the contracts....")
	const compiledContracts = JSON.parse(solc.compile(JSON.stringify(input))).contracts;

	for (let contract in compiledContracts) {
		for(let contractName in compiledContracts[contract]) {
      console.log(contractName + " compiled")
			fs.outputJsonSync(
				path.resolve(buildPath, `${contractName}.json`),
				compiledContracts[contract][contractName],
				{
					spaces: 2
				}
			)
		}
	}
}

createBuildFolder()
compileContracts()
