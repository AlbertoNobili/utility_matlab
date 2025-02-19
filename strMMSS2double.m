function secs = strMMSS2double(mm_ss)

min = str2double(mm_ss(1:2));
sec = str2double(mm_ss(4:5));

secs = min*60+sec;

end