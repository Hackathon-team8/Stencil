_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is storing 128 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>16</td></tr><tr><td>loop length</td><td>64</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\n<table><tr><td>front end</td><td>2.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>P10</th><th>P11</th><th>P12</th><th>P13</th><th>P14</th></tr><tr><td>uops</td><td>0.50</td><td>0.50</td><td>3.50</td><td>3.50</td><td>0.00</td><td>0.00</td><td>4.00</td><td>4.00</td><td>0.00</td><td>0.00</td><td>4.00</td><td>4.00</td><td>0.00</td><td>0.00</td><td>0.00</td></tr><tr><td>cycles</td><td>0.50</td><td>0.50</td><td>3.50</td><td>3.50</td><td>0.00</td><td>0.00</td><td>4.00</td><td>4.00</td><td>0.00</td><td>0.00</td><td>4.00</td><td>4.00</td><td>0.00</td><td>0.00</td><td>0.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>1.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>2.00</td></tr><tr><td>Data deps.</td><td>1.00</td></tr><tr><td>Overall L1</td><td>4.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>88%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 4.00 cycles. At this rate:\n<ul><li>50% of peak store performance is reached (32.00 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4046a4\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>P10</th><th>P11</th><th>P12</th><th>P13</th><th>P14</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>ADD X24, X0, #1</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>UBFM X1, X0, #60, #59</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>ADD X25, X8, X0,LSL #4</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>UBFM X3, X24, #60, #59</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>ADD X2, X8, X24,LSL #4</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>ADD X0, X0, #8</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>STR Q21, [X8, X1]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>CMP X0, X30</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.33</td></tr><tr><td>STR Q21, [X8, X3]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X2, #16]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #48]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #64]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #80]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #96]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #112]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>B.CC 4046a4 <_Z4initv+0x41c></td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr></table>",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "88% of VPU instructions are used in vector version (process two or more data elements in vector registers):\n<ul><li>0% of VPU addition or subtraction instructions are used in vector version.</li></ul>Since your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 47% of vector register length is used (average across all VPU instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 4.00 to 2.00 cycles (2.00x speedup).",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop does not contain any FP arithmetical operations.\nThe binary loop is storing 128 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>16</td></tr><tr><td>loop length</td><td>64</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\n<table><tr><td>front end</td><td>2.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>P10</th><th>P11</th><th>P12</th><th>P13</th><th>P14</th></tr><tr><td>uops</td><td>0.50</td><td>0.50</td><td>3.50</td><td>3.50</td><td>0.00</td><td>0.00</td><td>4.00</td><td>4.00</td><td>0.00</td><td>0.00</td><td>4.00</td><td>4.00</td><td>0.00</td><td>0.00</td><td>0.00</td></tr><tr><td>cycles</td><td>0.50</td><td>0.50</td><td>3.50</td><td>3.50</td><td>0.00</td><td>0.00</td><td>4.00</td><td>4.00</td><td>0.00</td><td>0.00</td><td>4.00</td><td>4.00</td><td>0.00</td><td>0.00</td><td>0.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>1.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>2.00</td></tr><tr><td>Data deps.</td><td>1.00</td></tr><tr><td>Overall L1</td><td>4.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>88%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>NA (no other vectorizable/vectorized instructions)</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 4.00 cycles. At this rate:\n<ul><li>50% of peak store performance is reached (32.00 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 4046a4\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>P10</th><th>P11</th><th>P12</th><th>P13</th><th>P14</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>ADD X24, X0, #1</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>UBFM X1, X0, #60, #59</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>ADD X25, X8, X0,LSL #4</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>UBFM X3, X24, #60, #59</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>ADD X2, X8, X24,LSL #4</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>ADD X0, X0, #8</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>STR Q21, [X8, X1]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>CMP X0, X30</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.33</td></tr><tr><td>STR Q21, [X8, X3]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X2, #16]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #48]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #64]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #80]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #96]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>STR Q21, [X25, #112]</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0.50</td></tr><tr><td>B.CC 4046a4 <_Z4initv+0x41c></td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr></table>",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "88% of VPU instructions are used in vector version (process two or more data elements in vector registers):\n<ul><li>0% of VPU addition or subtraction instructions are used in vector version.</li></ul>Since your execution units are vector units, only a fully vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is partially vectorized.\nOnly 47% of vector register length is used (average across all VPU instructions).\nBy fully vectorizing your loop, you can lower the cost of an iteration from 4.00 to 2.00 cycles (2.00x speedup).",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}
