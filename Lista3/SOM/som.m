clear;
if exist('out', 'dir')
   rmdir('out', 's');
end
results = fopen('results.txt','w');

%load images
bakery = imread('in\bakery_01_19_yahoo.jpg');
concert_hall = imread('in\09260032.jpg');
airport_inside = imread('in\airport_inside_0001.jpg');
greenhouse = imread('in\BA_Greenhouse.jpg');
bar = imread('in\bar_0006.jpg');

%images dimension
fprintf(results, "bakery dimensions: %ix%i\n", size(bakery,1), size(bakery,2));
fprintf(results, "concert_hall dimensions: %ix%i\n", size(concert_hall,1), size(concert_hall,2));
fprintf(results, "airport_inside dimensions: %ix%i\n", size(airport_inside,1), size(airport_inside,2));
fprintf(results, "greenhouse dimensions: %ix%i\n", size(greenhouse,1), size(greenhouse,2));
fprintf(results, "bar dimensions: %ix%i\n", size(bar,1), size(bar,2));
fprintf(results, "\n");

%colors
fprintf(results, "bakery colors: %i\n", size(unique(reshape(bakery, [], 3),'rows'), 1));
fprintf(results, "concert_hall colors: %i\n", size(unique(reshape(concert_hall, [], 3),'rows'), 1));
fprintf(results, "airport_inside colors: %i\n", size(unique(reshape(airport_inside, [], 3),'rows'), 1));
fprintf(results, "greenhouse colors: %i\n", size(unique(reshape(greenhouse, [], 3),'rows'), 1));
fprintf(results, "bar colors: %i\n", size(unique(reshape(bar, [], 3),'rows'), 1));
fprintf(results, "\n");

%quantify
quantify(bakery, "bakery", results)
quantify(concert_hall, "concert_hall", results)
quantify(airport_inside, "airport_inside", results)
quantify(greenhouse, "greenhouse", results)
quantify(bar, "bar", results)

fclose(results);