img = imread('test_image.jpg');
[~, ~, c] = size(img);
if c == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end
% img_gray = img_gray(:, 1:350);
img_float = double(img_gray) / 255;
img_float = double(img_float > 0.5);
% img_float = edge(img_float,'Canny');
img_float = padarray(img_float, [1, 1]);
imshow(img_float);
res = traceit(img_float);

[h, w] = size(img_float);
a = zeros(h, w);
for i = 1:length(res)
    try
        for j = 1:length(res)
            r = res(i, 1);
            c = res(i, 2);
%             if r ~= -1 && c ~= -1
                a(r, c) = 1;
%             end 
        end
    catch e
        
    end
end
imshowpair(img_float, a, 'montage');
