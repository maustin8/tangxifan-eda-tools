%% SRAM MUX TSMC40nm
% Size <= 2, use area, delay and power of one-level mux
% Size > 2, use area, delay and power of two-level mux

%% Area
area_sram_mux = 2:2:32;
pn_ratio = 1;
for i=1:1:length(area_sram_mux)
  area_multiplexing = (2*i) * (trans_area(1)+ trans_area(1*pn_ratio));
  if ( 2*i > 2) 
    area_multiplexing = area_multiplexing + ceil(sqrt(2*i)) * (trans_area(1)+ trans_area(1*pn_ratio));
  end 

  area_buf = (2*i + 1) * (trans_area(1)+ trans_area(1*pn_ratio));

  area_sram_mux(i) = area_multiplexing + area_buf;
end

%% Delay and power when VDD=0.9V 
% 16 index: 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32
sram_mux_0p9V = [ % size, delay, leakage, dynamic_power, energy_per_toggle
2, 1.799e-11,3.07e-08,5.2835e-05,1.7955e-15;
4, 2.673e-11,3.9895e-08,2.029e-05,7.342e-16;
6, 3.0885e-11,5.646e-08,2.093e-05,7.8715e-16;
8, 3.0885e-11,7.425e-08,2.0945e-05,7.8775e-16;
10, 3.5125e-11,9.0825e-08,2.174e-05,8.4625e-16;
12, 3.5125e-11,1.0383e-07,2.175e-05,8.47e-16;
14, 3.5125e-11,1.216e-07,2.1765e-05,8.473e-16;
16, 3.5125e-11,1.346e-07,2.178e-05,8.4805e-16;
18, 3.9115e-11,1.642e-07,2.2725e-05,9.363e-1;
20, 3.9115e-11,1.642e-07,2.2725e-05,9.363e-1;
22, 3.9115e-11,1.8195e-07,2.2745e-05,9.371e-16;
24, 3.9115e-11,1.95e-07,2.2755e-05,9.374e-16;
26, 4.329e-11,2.115e-07,2.357e-05,1.0108e-15;
28, 4.329e-11,2.245e-07,2.358e-05,1.01105e-15;
30, 4.329e-11,2.3755e-07,2.3595e-05,1.01185e-15;
32, 4.3285e-11,2.553e-07,2.361e-05,1.01265e-15;
34, 4.4005e-11,2.7775e-07,2.4795e-05,1.06645e-15;
36, 4.4005e-11,2.9105e-07,2.481e-05,1.06725e-15;
38, 4.812e-11,3.0815e-07,2.562e-05,1.13375e-15;
40, 4.812e-11,3.2155e-07,2.564e-05,1.13455e-15;
42, 4.812e-11,3.3485e-07,2.565e-05,1.13485e-15;
44, 4.812e-11,3.5335e-07,2.5665e-05,1.1357e-15;
46, 4.812e-11,3.667e-07,2.568e-05,1.136e-15;
48, 4.812e-11,3.8005e-07,2.5695e-05,1.1368e-15;
50, 5.2075e-11,3.9715e-07,2.648e-05,1.2315e-15;
];

rram_mux_0p9V = [ % size, delay, leakage, dynamic_power, energy_per_toggle
2, 1.7315e-11,4.922e-08,1.3145e-05,7.5925e-16;
4, 1.772e-11,9.077e-08,1.327e-05,7.7975e-16;
6, 1.8125e-11,1.301e-07,1.3655e-05,8.0075e-16;
8, 1.8555e-11,1.694e-07,1.3895e-05,8.2295e-16;
10, 1.8715e-11,2.095e-07,1.399e-05,8.3995e-16;
12, 1.9135e-11,2.496e-07,1.4245e-05,8.615e-16;
14, 1.968e-11,2.862e-07,1.4405e-05,8.8265e-16;
16, 2.0475e-11,3.298e-07,1.477e-05,9.1335e-16;
18, 2.0395e-11,3.697e-07,1.4965e-05,9.257e-16;
20, 2.1405e-11,4.096e-07,1.5105e-05,9.446e-16;
22, 2.1165e-11,4.495e-07,1.542e-05,9.6745e-16;
24, 2.166e-11,4.896e-07,1.565e-05,9.9185e-16;
26, 2.255e-11,5.299e-07,1.598e-05,1.0259e-15;
28, 2.278e-11,5.699e-07,1.616e-05,1.0451e-15;
30, 2.2655e-11,6.097e-07,1.6345e-05,1.0571e-15;
32, 2.317e-11,6.498e-07,1.654e-05,1.0798e-15;
34, 2.333e-11,6.899e-07,1.6625e-05,1.09225e-15;
36, 2.388e-11,7.299e-07,1.694e-05,1.12465e-15;
38, 2.4215e-11,7.699e-07,1.714e-05,1.1467e-15;
40, 2.4525e-11,8.1e-07,1.7285e-05,1.16765e-15;
42, 2.4945e-11,8.406e-07,1.7495e-05,1.19035e-15;
44, 2.536e-11,8.911e-07,1.759e-05,1.203e-15;
46, 2.5655e-11,9.362e-07,1.789e-05,1.23255e-15;
48, 2.605e-11,9.842e-07,1.8085e-05,1.25315e-15;
50, 2.537e-11,9.982e-07,1.801e-05,1.2449e-15;
];

