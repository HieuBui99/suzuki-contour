function [img, contours] = raster_scan(img)
    [row, col] = size(img);
    LNBD = 1;
    NBD = 1;
    contours = {};
    count = 1;
    for m = 2:(row-2)
        LNBD = 1;
        for n = 2:(col-2)
            if img(m, n)==1 & img(m, n-1)==0
               NBD = NBD + 1; 
               direction = 2;
               [img, contour] = border_follow(img, [m, n], [m, n-1], direction, NBD);
               contours{count} = contour;
               count = count + 1;
%                return;
            elseif img(m, n) >= 1 & img(m, n+1) == 0 
                NBD = NBD + 1;
                direction = 0;
                [img, contour] = border_follow(img, [m, n], [m, n+1], direction, NBD);
                contours{count} = contour;
                count  = count + 1;
%                 return;
            end
        end
    end
    