img = imread('1.jpg');
% img = rgb2gray(img);
img_float = double(img) / 255;
% img_float = img_float(:, 1:350);
img_float = double(img_float > 0.5);
% img_float = padarray(img_float,3,0);
% imshow(img_float);
[img_out, res] = raster_scan(img_float)
[h, w] = size(img_float);
a = zeros(h, w);
for i = 1:length(res)
    try
    cont = res{i};
        for j = 1:length(cont)
            r = cont(j, 1);
            c = cont(j, 2);
            a(r, c) = 1;
        end
    catch e
        
    end
end
imshowpair(img_float, a, 'montage');