/*
    stdlib.sol – Solidity TVM-related components

    Copyright (C) 2023 EverX

    This file is part of stdlib.sol.

    stdlib.sol is free software: you can redistribute it and/or 
    modify it under the terms of the GNU Lesser General Public 
    License as published by the Free Software Foundation, either
    version 3 of the License, or (at your option) any later version.

    stdlib.sol is distributed in the hope that it will be useful, 
    but WITHOUT ANY WARRANTY; without even the implied warranty of 
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License 
    along with stdlib.sol. If not, see <https://www.gnu.org/licenses/>.
*/

pragma ton-solidity >= 0.70.0;

// Configuration primitives
function unix_ts()    assembly returns (int)          { "NOW"      }
function block_lt()   assembly returns (int)          { "BLOCKLT"  }
function cur_lt()     assembly returns (int)          { "LTIME"    }
function cur_seed()   assembly returns (int)          { "RANDSEED" }
function my_balance() assembly returns (int, TvmCell) { "BALANCE"  }
function my_address() assembly returns (TvmSlice)     { "MYADDR"   }

// Hashing and cryptography primitives
function cell_hash(TvmCell)   assembly returns (uint256) { "HASHCU"  }
function slice_hash(TvmSlice) assembly returns (uint256) { "HASHSU"  }
function raw_sha256(TvmSlice) assembly returns (uint256) { "SHA256U" }

function check_signature(uint256 hash, TvmSlice signature, 
uint256 public_key) assembly returns (bool) { "CHKSIGNU" }

function check_data_signature(TvmSlice data, TvmSlice signature, 
uint256 public_key) assembly returns (bool) { "CHKSIGNS" }

// Outbound message and output action primitives
function raw_reserve(varUint16 amount, int mode)   assembly { "RAWRESERVE" }
function send_raw_message(TvmCell msg_c, int mode) assembly { "SENDRAWMSG" }
function set_code(TvmCell code)                    assembly { "SETCODE"    }

// Debug primitives
function dump_stack() assembly { "DUMPSTK" }

// Gas primitives
function commit()               assembly { "COMMIT"      }
function accept_message()       assembly { "ACCEPT"      }
function set_gas_limit(uint63)  assembly { "SETGASLIMIT" }

// Persistent storage load and save
function get_data(TvmCell) assembly { "PUSH c4" }
function set_data(TvmCell) assembly { "POP c4"  }

// Pseudo-random number generator primitives
function random()           assembly returns (uint256)  { "RANDU256" }
function rand_in(int)       assembly returns (int)      { "RAND"     }
function set_seed(uint256)  assembly                    { "SETRAND"  }
function randomize(uint256) assembly                    { "ADDRAND" }
function randomize_lt()     assembly                    { "LTIME", "ADDRAND" }

// Tuple, List, and Null primitives
function is_cell_null(TvmCell) assembly retunrs (bool) { "ISNULL" }
