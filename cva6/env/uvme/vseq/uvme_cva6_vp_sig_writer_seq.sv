//
// Copyright 2021 OpenHW Group
// Copyright 2021 Silicon Labs
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may
// not use this file except in compliance with the License, or, at your option,
// the Apache License version 2.0. You may obtain a copy of the License at
//
//     https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
//

`ifndef __UVME_CVA6_VP_SIG_WRITE_SEQ_SV__
`define __UVME_CVA6_VP_SIG_WRITE_SEQ_SV__


/**
 * Sequence implementing the virtual status flags decoding
 */
class uvme_cva6_vp_sig_writer_seq_c extends uvme_cva6_base_vseq_c;;

   uvme_cva6_cntxt_c cva6_cntxt;

   `uvm_object_utils_begin(uvme_cva6_vp_sig_writer_seq_c)
   `uvm_object_utils_end

   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cva6_vp_sig_writer_seq_c");

   /**
    * Implement a body to pre-validate some configuration before allowing parent class body to run
    */
   extern virtual task body();

   /**
    * Set virtual exit in core
    */
   extern virtual task set_exit_valid();

endclass : uvme_cva6_vp_sig_writer_seq_c

function uvme_cva6_vp_sig_writer_seq_c::new(string name="uvme_cva6_vp_sig_writer_seq_c");

   super.new(name);

endfunction : new

task uvme_cva6_vp_sig_writer_seq_c::body();

   if (cva6_cntxt == null) begin
      `uvm_fatal("E40PVPSTATUS", "Must initialize cva6_cntxt in virtual peripheral")
   end

   super.body();

endtask : body

task uvme_cva6_vp_sig_writer_seq_c::set_exit_valid();

   cva6_cntxt.rvfi_vif.rvfi_o[0].halt   = 1;
   cva6_cntxt.rvfi_vif.rvfi_o[0].halt   = 1;

   `uvm_info("HALT", "Halt bit is set in rvfi_if", UVM_NONE);

endtask : set_exit_valid

`endif // __UVME_CVA6_VP_SIG_WRITER_SEQ_SV__
