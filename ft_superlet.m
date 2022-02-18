function [results]=ft_superlet(cfg,data)
% cfg.maxcycle

for i=1:cfg.maxcycle
cfg.width      = i;   
wav_res{i}= ft_freqanalysis(cfg,data);
end

wavges=wav_res{1}.powspctrm; 

for i=1:cfg.maxcycle-1
   wavges=wav_res{i+1}.powspctrm.*wavges;
end

wavges=wavges.^(1/cfg.maxcycle);

results=wav_res{1};
results.powspctrm=wavges;
results.cfg.maxcycle=cfg.maxcycle;
end