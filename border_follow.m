function [img, cont] = border_follow(img, start, prev, direction, NBD)
    cont = [];
    curr = start;
    exam = prev;
    save = NaN;
    save2 = exam;
    cont = [cont; curr];
    while img(exam(1), exam(2)) == 0
       [a, b, direction, save_pixel] = next_cell(curr, direction);
       exam(1) = a;
       exam(2) = b;
       if ~all(isnan(save_pixel))
           save = save_pixel;
       end
       if all(save2 == exam)
           img(curr(1), curr(2)) = -NBD;
           return
       end
    end
    if ~all(isnan(save))
        img(curr(1), curr(2)) = -NBD;
        save = NaN;
    elseif (all(isnan(save)) | (~all(isnan(save)) & img(save(1), save(2))~=0)) & img(curr(1), curr(2))==1
         img(curr(1), curr(2)) = NBD;
    else
        
    end
    
    prev = curr;
    curr = exam;
    cont = [cont; curr];
    
    if direction >= 2
        direction = direction - 2;
    else
        direction = direction + 2;
    end
    
    flag = 0;
    start_next = curr;
    
    while true
        if ~(all(curr == start_next) & all(prev == start) & flag == 1)
            flag = 1;
           [a, b, direction, save_pixel] = next_cell(curr, direction);
           exam(1) = a;
           exam(2) = b;
            if ~all(isnan(save_pixel))
                save = save_pixel;
            end 
            while img(exam(1), exam(2)) == 0
               [a, b, direction, save_pixel] = next_cell(curr, direction);
               exam(1) = a;
               exam(2) = b;
                if ~all(isnan(save_pixel))
                    save = save_pixel;
                end 
            end
            if ~all(isnan(save)) & img(save(1), save(2)) == 0
               img(curr(1), curr(2)) = -NBD;
               save = NaN;
            elseif (all(isnan(save)) | (~all(isnan(save)) & img(save(1), save(2))~=0)) & img(curr(1), curr(2))==1
                img(curr(1), curr(2)) = NBD;
            else
                
            end
            prev = curr;
            curr = exam;
            cont = [cont; curr];
            if direction >= 2 
                direction = direction - 2;
            else
                direction = direction + 2;
            end
        else 
            break;
        end
    end 
    
    
    
    
    