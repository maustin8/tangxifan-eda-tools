%% SRAM MUX
% Size <= 12, use area, delay and power of one-level mux
% Size > 12, use area, delay and power of two-level mux

%% Area
area_sram_mux = 2:2:32;
pn_ratio = 1;
for i=1:1:length(area_sram_mux)
  area_multiplexing = (2*i) * (trans_area(1)+ trans_area(1*pn_ratio));
  if ( 2*i > 12) 
    area_multiplexing = area_multiplexing + ceil(sqrt(2*i)) * (trans_area(1)+ trans_area(1*pn_ratio));
  end 

  area_buf = (2*i + 1) * (trans_area(1)+ trans_area(1*pn_ratio));

  area_sram_mux(i) = area_multiplexing + area_buf;
end

%% Delay and power when VDD=0.5V 
% 16 index: 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32
sram_mux_0p5V = [ % size, delay, leakage, dynamic_power, energy_per_toggle
2, 1.5425e-11,3.618e-11,1.6074e-06,2.1682e-17;
4, 1.8045e-11,7.3545e-11,1.5199e-06,2.09035e-17;
6, 2.0585e-11,1.1089e-10,1.54778e-06,2.2899e-17;
8, 2.3045e-11,1.48265e-10,1.6198e-06,2.51395e-17;
10,2.5325e-11,1.8565e-10,1.65605e-06,2.71845e-17;
12,2.76e-11,2.23e-10,1.6842e-06,2.90735e-17;
14,3.018e-11,2.065e-10,1.6519e-06,2.80905e-17;
16,3.018e-11,2.2845e-10,1.65185e-06,2.80905e-17;
18,3.311e-11,2.591e-10,1.66425e-06,3.03005e-17;
20,3.311e-11,2.8105e-10,1.66425e-06,3.03005e-17;
22,3.311e-11,3.0975e-10,1.6642e-06,3.03005e-17;
24,3.311e-11,3.3165e-10,1.6642e-06,3.03e-17;
26,3.6215e-11,3.6235e-10,1.7028e-06,3.1425e-17;
28,3.6215e-11,3.8425e-10,1.7028e-06,3.1425e-17;
30,3.6215e-11,4.0625e-10,1.70275e-06,3.1425e-17;
32,3.6215e-11,4.3495e-10,1.70275e-06,3.14245e-17;
];

%% Delay and power when VDD=0.6V 
sram_mux_0p6V = [ % size, delay, leakage, dynamic_power, energy_per_toggle
2, 1.0835e-11,5.172e-11,3.3085e-06,3.629e-17;
4, 1.2435e-11,1.06115e-10,3.19785e-06,3.67695e-17;
6, 1.3655e-11,1.6055e-10,3.2541e-06,3.93005e-17;
8, 1.509e-11,2.1495e-10,3.20148e-06,4.053055e-17;
10,1.63e-11,2.694e-10,3.34185e-06,4.40005e-17;
12,1.7825e-11,3.2375e-10,3.4655e-06,4.68325e-17;
14,1.961e-11,3.085e-10,3.37555e-06,4.66945e-17;
16,1.961e-11,3.429e-10,3.3755e-06,4.6694e-17;
18,2.1475e-11,3.896e-10,3.4572e-06,4.9874e-17;
20,2.1475e-11,4.2405e-10,3.45715e-06,4.98735e-17;
22,2.1475e-11,4.6635e-10,3.45715e-06,4.98735e-17;
24,2.1475e-11,5.008e-10,3.45715e-06,4.9873e-17;
26,2.2995e-11,5.474e-10,3.50775e-06,5.3284e-17;
28,2.2995e-11,5.819e-10,3.5077e-06,5.3284e-17;
30,2.2995e-11,6.164e-10,3.5077e-06,5.32835e-17;
32,2.2995e-11,6.5865e-10,3.5077e-06,5.32835e-17;
];

%% Delay and power when VDD=0.7V 
sram_mux_0p7V = [ % size, delay, leakage, dynamic_power, energy_per_toggle
2, 8.767e-12,7.191e-11,5.692e-06,5.731e-17;
4, 9.761e-12,1.489e-10,5.555e-06,5.8465e-17;
6, 1.074e-11,2.259e-10,5.4748e-06,6.02245e-17;
8, 1.168e-11,3.029e-10,5.57755e-06,6.2653e-17;
10,1.2575e-11,3.799e-10,5.69705e-06,6.67255e-17;
12,1.3415e-11,4.569e-10,5.7496e-06,7.0379e-17;
14,1.512e-11,4.4675e-10,5.5381e-06,6.90645e-17;
16,1.512e-11,4.988e-10,5.5381e-06,6.9064e-17;
18,1.6225e-11,5.6735e-10,5.70715e-06,7.41125e-17;
20,1.6225e-11,6.1945e-10,5.7071e-06,7.4112e-17;
22,1.6225e-11,6.7995e-10,5.7071e-06,7.41115e-17;
24,1.6225e-11,7.3205e-10,5.70705e-06,7.41115e-17;
26,1.722e-11,8.0065e-10,5.79305e-06,7.9342e-17;
28,1.722e-11,8.527e-10,5.793e-06,7.93415e-17;
30,1.722e-11,9.0485e-10,5.793e-06,7.93415e-17;
32,1.722e-11,9.6535e-10,5.79295e-06,7.9341e-17;
];

