

fs = 27;                                                       % fs: sample points per second (Hz) (fs>2*f_signal)
t = 0+1/fs : 1/fs : 1;                                               % one second time of sample
Nobserve = length(t);
%f = 10;                                                           % f circle per second;
signal = 1 * sin( 2*pi* 14 * t + 0 ) + 2 * sin( 2*pi * 12.3 * t + pi/2 ) + 6;           % (acquire: fs > fsignal)
figure, subplot(1,2,1), plot(t,signal,'-x'); grid minor; xlabel('t (s)'), ylabel('A');

signal_fft = fft(signal);  
signal_fft_abs = abs(signal_fft);
frequency_fft = (0 : Nobserve-1) * fs / Nobserve; % df = fsample / Nobserve
subplot(1,2,2), plot(frequency_fft, signal_fft_abs * 2 / Nobserve,'-x'); grid minor; xlabel('Frequency'), ylabel('A');

