
close all;
clear;

dQ=pi/3;  % --v
dQ21=pi/10; % --d (Rx distance) => direction1
dQ22=pi/3; % --d (Rx distance) => direction2

NChirp=128; % chirp total
Nfft=512;

y=zeros(1,NChirp);

%%
NRx=128;
Yfft=zeros(NRx,Nfft);
iMaxMag=zeros(1,NRx);
maxMag=zeros(1,NRx);
dQAcquire=zeros(1,NRx);
for m=1:NRx
    for k=1:NChirp
        y(k)=exp(1i*( m*dQ21 + k*dQ))+exp(1i*( m*dQ22 + k*dQ));  % Rx (128Chirp)
    end
    Yfft(m,:)=fft(y,Nfft);
    [maxMag(m),iMaxMag(m)]=max(abs(Yfft(m,:)));
    dQAcquire(m)=360/Nfft*iMaxMag(m);
end
%%2d fft
y_Yfft=zeros(1,NChirp);
Nfft2=128;
for n=1:NChirp
    y_Yfft(n)=Yfft(n,iMaxMag(n));
end
y_Yfft_fft=fft(y_Yfft,Nfft2);
figure, plot(abs(y_Yfft_fft));
[maxMag,iMaxMag]=max(abs(y_Yfft_fft));
dQAcquire5=360/Nfft2*iMaxMag;

%% 
for k=1:NChirp
    y(k)=exp(1i*(k*dQ));                                                                % Rx1
end
Y1fft=fft(y,Nfft);
figure, plot(abs(Y1fft));
[maxMag,iMaxMag1]=max(abs(Y1fft));
dQAcquire1=360/Nfft*iMaxMag1;

for k=1:NChirp
    y(k)= exp(1i*( dQ21 +k* dQ )) + exp(1i*( dQ22 +k* dQ ));    % Rx2
end
Y2fft=fft(y,Nfft);
figure, plot(abs(Y2fft));
[maxMag,iMaxMag2]=max(abs(Y2fft));
dQAcquire2=360/Nfft*iMaxMag2;

for k=1:NChirp
    y(k)=exp(1i*( 2*dQ21 + k*dQ )) + exp(1i*( 2*dQ22 +k* dQ )); % Rx3
end
Y3fft=fft(y,Nfft);
figure, plot(abs(Y3fft));
[maxMag,iMaxMag3]=max(abs(Y3fft));
dQAcquire3=360/Nfft*iMaxMag3;

for k=1:NChirp
    y(k)=exp(1i*( 3*dQ21 + k*dQ)) + exp(1i*( 3*dQ22 +k* dQ )); % Rx4
end
Y4fft=fft(y,Nfft);
figure, plot(abs(Y4fft));
[maxMag,iMaxMag4]=max(abs(Y4fft));
dQAcquire4=360/Nfft*iMaxMag4;
%%2D fft
yy=[Y1fft(iMaxMag1),Y2fft(iMaxMag2),Y3fft(iMaxMag3),Y4fft(iMaxMag4)];
Nfft2=128;
yyFFT=fft(yy,Nfft2);
figure, plot(abs(yyFFT));
[maxMag,iMaxMag]=max(abs(yyFFT));
dQAcquire5=360/Nfft2*iMaxMag;


re=0;