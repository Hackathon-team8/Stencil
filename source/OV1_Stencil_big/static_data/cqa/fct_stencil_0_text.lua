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
          txt = "nb instructions    : 5\nloop length        : 20\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\nfront end: 0.63 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14\n---------------------------------------------------------------------------------------------------------------\nuops   | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.83 | 0.50 | 0.67 | 1.00 | 1.00\ncycles | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.83 | 0.50 | 0.67 | 1.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 0.63\nOverall L1: 1.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "No vectorizable/vectorized instructions\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 1.00 cycles. At this rate:\n - 16% of peak load performance is reached (16.00 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 25% of peak store performance is reached (16.00 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 401078\n\nInstruction                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6 | P7 | P8 | P9 | P10  | P11  | P12  | P13  | P14  | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------------------------\nSTP X29, X30, [SP, #1008]! | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0  | 0  | 0  | 0.50 | 0.50 | 0    | 0.50 | 0.50 | 1       | 0.50\nADD X29, SP, #0            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0  | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL 401798 <call_weak_fn>   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0  | 0  | 0  | 0  | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nLDP X29, X30, [SP], #16    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0  | 0  | 0  | 0  | 0.33 | 0.33 | 0.33 | 0    | 0    | 4       | 1\nRET                        | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0  | 0  | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\n",
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
          txt = "nb instructions    : 5\nloop length        : 20\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "FIT IN UOP CACHE\nfront end: 0.63 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | P0   | P1   | P2   | P3   | P4   | P5   | P6   | P7   | P8   | P9   | P10  | P11  | P12  | P13  | P14\n---------------------------------------------------------------------------------------------------------------\nuops   | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.83 | 0.50 | 0.67 | 1.00 | 1.00\ncycles | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.83 | 0.50 | 0.67 | 1.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 0.63\nOverall L1: 1.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "No vectorizable/vectorized instructions\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 1.00 cycles. At this rate:\n - 16% of peak load performance is reached (16.00 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 25% of peak store performance is reached (16.00 out of 64.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 401078\n\nInstruction                | Nb FU | P0   | P1   | P2   | P3   | P4 | P5 | P6 | P7 | P8 | P9 | P10  | P11  | P12  | P13  | P14  | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------------------------\nSTP X29, X30, [SP, #1008]! | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0  | 0  | 0  | 0.50 | 0.50 | 0    | 0.50 | 0.50 | 1       | 0.50\nADD X29, SP, #0            | 1     | 0    | 0    | 0.50 | 0.50 | 0  | 0  | 0  | 0  | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nBL 401798 <call_weak_fn>   | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0  | 0  | 0  | 0  | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 0.50\nLDP X29, X30, [SP], #16    | 1     | 0    | 0    | 0    | 0    | 0  | 0  | 0  | 0  | 0  | 0  | 0.33 | 0.33 | 0.33 | 0    | 0    | 4       | 1\nRET                        | 1     | 0.50 | 0.50 | 0    | 0    | 0  | 0  | 0  | 0  | 0  | 0  | 0    | 0    | 0    | 0    | 0    | 1       | 0.50\n",
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
