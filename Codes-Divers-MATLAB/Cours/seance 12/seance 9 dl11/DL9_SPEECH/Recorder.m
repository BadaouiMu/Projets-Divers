
% a
disp('Préparez vous à dire "a"')
pause(1)
recobj=audiorecorder(8000,16,1);
disp('Dites "a"....')
recordblocking(recobj,3);
disp('Fin de l''enregistrement')
a=getaudiodata(recobj);

% e
disp('Préparez vous à dire "e"')
pause(1)
recobj=audiorecorder(8000,16,1);
disp('Dites "e"....')
recordblocking(recobj,3);
disp('Fin de l''enregistrement')
e=getaudiodata(recobj);

% i
disp('Préparez vous à dire "i"')
pause(1)
recobj=audiorecorder(8000,16,1);
disp('Dites "i"....')
recordblocking(recobj,3);
disp('Fin de l''enregistrement')
i=getaudiodata(recobj);

% o
disp('Préparez vous à dire "o"')
pause(1)
recobj=audiorecorder(8000,16,1);
disp('Dites "o"....')
recordblocking(recobj,3);
disp('Fin de l''enregistrement')
o=getaudiodata(recobj);

% u
disp('Préparez vous à dire "u"')
pause(1)
recobj=audiorecorder(8000,16,1);
disp('Dites "u"....')
recordblocking(recobj,3);
disp('Fin de l''enregistrement')
u=getaudiodata(recobj);

% creation de matrice
filename = 'a.wav';
audiowrite(filename,a,Fs);

filename = 'e.wav';
audiowrite(filename,e,Fs);

filename = 'i.wav';
audiowrite(filename,i,Fs);

filename = 'o.wav';
audiowrite(filename,o,Fs);

filename = 'u.wav';
audiowrite(filename,u,Fs);







