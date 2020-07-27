Fpass = 2000;
Fstop = 11000;
Apass = 0.0174;
Astop = 500;
Fs = 44.100;

 

lowpassSpec = fdesign.lowpass(Fpass,Fstop,Apass,Astop,Fs);
eqripFilter = design(lowpassSpec,'equiripple','SystemObject',true);
cost(eqripFilter)

 

scope = dsp.SpectrumAnalyzer('SpectralAverages',50,'SampleRate',Fs,...
    'PlotAsTwoSidedSpectrum',false,'YLimits', [-90 10],...
    'ShowLegend',true','ChannelNames',{'Equiripple design',...
    'IFIR design','Multirate/multistage design'});
tic,
while toc < 20
    x = randn(6000,1);
     y1 = eqripFilter(x);
     y2 = HelperIFIRFilter(x);
     y3 = HelperMultiFIRFilter(x);
     scope([y1,y2,y3])
end