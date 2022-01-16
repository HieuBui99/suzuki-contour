img = imread('1.jpg');
[~, ~, c] = size(img);
if c == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end
% img = rgb2gray(img);
img_float = double(img_gray) / 255;
img_float = double(img_float > 0.5);
% img_float = edge(img_float,'Canny');
img_float = padarray(img_float, [3, 3]);
imshow(img_float);
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