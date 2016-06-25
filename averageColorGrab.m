tic
season = '01';
episode = '03';
videoLength = 3699; 

averageEpisodeColor = zeros(1,videoLength,3); % preallocates an array
for j=1:9
    imageName = strcat('s',season,'e',episode,'-00',int2str(j),'.jpeg');
    imageMatrix = imread(imageName);
    averageR = floor(sum(sum(imageMatrix(:,:,1)))/720/1280 + 0.5);
    averageG = floor(sum(sum(imageMatrix(:,:,2)))/720/1280 + 0.5);
    averageB = floor(sum(sum(imageMatrix(:,:,3)))/720/1280 + 0.5);

    averageEpisodeColor(1,j,1) = averageR;
    averageEpisodeColor(1,j,2) = averageG;
    averageEpisodeColor(1,j,3) = averageB;
end
        
 for j=10:99
    imageName = strcat('s',season,'e',episode,'-0',int2str(j),'.jpeg');
    imageMatrix = imread(imageName);
    averageR = floor(sum(sum(imageMatrix(:,:,1)))/720/1280 + 0.5);
    averageG = floor(sum(sum(imageMatrix(:,:,2)))/720/1280 + 0.5);
    averageB = floor(sum(sum(imageMatrix(:,:,3)))/720/1280 + 0.5);

    averageEpisodeColor(1,j,1) = averageR;
    averageEpisodeColor(1,j,2) = averageG;
    averageEpisodeColor(1,j,3) = averageB;
end
 
 for j=100:videoLength
    imageName = strcat('s',season,'e',episode,'-',int2str(j),'.jpeg');
    imageMatrix = imread(imageName);
    averageR = floor(sum(sum(imageMatrix(:,:,1)))/720/1280 + 0.5);
    averageG = floor(sum(sum(imageMatrix(:,:,2)))/720/1280 + 0.5);
    averageB = floor(sum(sum(imageMatrix(:,:,3)))/720/1280 + 0.5);
 
    averageEpisodeColor(1,j,1) = averageR;
    averageEpisodeColor(1,j,2) = averageG;
    averageEpisodeColor(1,j,3) = averageB;
 end
 
 csvwrite(strcat('average','s',season,'e',episode,'R'), averageEpisodeColor(:,:,1));
 csvwrite(strcat('average','s',season,'e',episode,'G'), averageEpisodeColor(:,:,2));
 csvwrite(strcat('average','s',season,'e',episode,'B'), averageEpisodeColor(:,:,3));
 toc