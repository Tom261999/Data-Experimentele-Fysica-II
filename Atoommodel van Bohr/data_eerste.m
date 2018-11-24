clc, clear
disp('De ingestuurdee potentiaal is gegeven in "t_in_n","v_in_n" met n de set.')
disp('Analoog zal de gemetenpotentiaal gegeven zijn door "t_gem_n" & "v_gem_n".')

%Ingestuurde potentialen
[t_in_1,v_in_1] = importdatabohr('1e piek\ingestuurde potentiaal\set 1.txt');
[t_in_2,v_in_2] = importdatabohr('1e piek\ingestuurde potentiaal\set 2.txt');
[t_in_3,v_in_3] = importdatabohr('1e piek\ingestuurde potentiaal\set 3.txt');
[t_in_4,v_in_4] = importdatabohr('1e piek\ingestuurde potentiaal\set 4.txt');
[t_in_5,v_in_5] = importdatabohr('1e piek\ingestuurde potentiaal\set 5.txt');

%Gemeten potentialen
[t_gem_1,v_gem_1] = importdatabohr('1e piek\gemeten potentiaal\set 1.txt');
[t_gem_2,v_gem_2] = importdatabohr('1e piek\gemeten potentiaal\set 2.txt');
[t_gem_3,v_gem_3] = importdatabohr('1e piek\gemeten potentiaal\set 3.txt');
[t_gem_4,v_gem_4] = importdatabohr('1e piek\gemeten potentiaal\set 4.txt');
[t_gem_5,v_gem_5] = importdatabohr('1e piek\gemeten potentiaal\set 5.txt');