_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 16 bytes.\nThe binary function is storing 16 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>5</td></tr><tr><td>loop length</td><td>20</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\n<table><tr><td>front end</td><td>0.63 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>P10</th><th>P11</th><th>P12</th><th>P13</th><th>P14</th></tr><tr><td>uops</td><td>1.00</td><td>1.00</td><td>1.00</td><td>1.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.83</td><td>0.50</td><td>0.67</td><td>1.00</td><td>1.00</td></tr><tr><td>cycles</td><td>1.00</td><td>1.00</td><td>1.00</td><td>1.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.83</td><td>0.50</td><td>0.67</td><td>1.00</td><td>1.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>0.63</td></tr><tr><td>Overall L1</td><td>1.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "No vectorizable/vectorized instructions\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 1.00 cycles. At this rate:\n<ul><li>16% of peak load performance is reached (16.00 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>25% of peak store performance is reached (16.00 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 401078\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>P10</th><th>P11</th><th>P12</th><th>P13</th><th>P14</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>STP X29, X30, [SP, #1008]!</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0.50</td><td>0.50</td><td>1</td><td>0.50</td></tr><tr><td>ADD X29, SP, #0</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>BL 401798 <call_weak_fn></td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>1</td><td>0.50</td></tr><tr><td>LDP X29, X30, [SP], #16</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>4</td><td>1</td></tr><tr><td>RET</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr></table>",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "No VPU instruction: only general purpose registers are used and data elements are processed one at a time.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 1.00 to 0.50 cycles (2.00x speedup).",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function is loading 16 bytes.\nThe binary function is storing 16 bytes.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>5</td></tr><tr><td>loop length</td><td>20</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\n<table><tr><td>front end</td><td>0.63 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>P10</th><th>P11</th><th>P12</th><th>P13</th><th>P14</th></tr><tr><td>uops</td><td>1.00</td><td>1.00</td><td>1.00</td><td>1.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.83</td><td>0.50</td><td>0.67</td><td>1.00</td><td>1.00</td></tr><tr><td>cycles</td><td>1.00</td><td>1.00</td><td>1.00</td><td>1.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.00</td><td>0.83</td><td>0.50</td><td>0.67</td><td>1.00</td><td>1.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>0.63</td></tr><tr><td>Overall L1</td><td>1.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "No vectorizable/vectorized instructions\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 1.00 cycles. At this rate:\n<ul><li>16% of peak load performance is reached (16.00 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>25% of peak store performance is reached (16.00 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 401078\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>P8</th><th>P9</th><th>P10</th><th>P11</th><th>P12</th><th>P13</th><th>P14</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>STP X29, X30, [SP, #1008]!</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0.50</td><td>0.50</td><td>1</td><td>0.50</td></tr><tr><td>ADD X29, SP, #0</td><td>1</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>BL 401798 <call_weak_fn></td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>1</td><td>0.50</td></tr><tr><td>LDP X29, X30, [SP], #16</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>4</td><td>1</td></tr><tr><td>RET</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr></table>",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.00 out of 16.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "No VPU instruction: only general purpose registers are used and data elements are processed one at a time.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 1.00 to 0.50 cycles (2.00x speedup).",
        },
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}
