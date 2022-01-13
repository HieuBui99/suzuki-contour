function [r, c, new_dir, save] = next_cell(curr_pixel, curr_dir)
    i = curr_pixel(1);
    j = curr_pixel(2);
    save = NaN;
    if curr_dir == 0
        r = i - 1;
        c = j;
        new_dir = 1;
        save = [i, j+1];
    elseif  curr_dir == 1
        r = i;
        c = j-1;
        new_dir = 2;  
    elseif curr_dir == 2
        r = i+1;
        c = j;
        new_dir = 3;
    elseif curr_dir == 3
        r = i; 
        c = j+1;
        new_dir = 0;
    end