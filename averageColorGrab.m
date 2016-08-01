tic
season = '01';
episode = '05';
videoLength = 3699;
parpool(8); % declares how many cores you want to use. 
% Set this to the number of real cores your computer has (not virtual cores). 
% If your run into issues, comment out parpool() and change all "parfor"'s below to "for"

averageEpisodeColor = zeros(1,videoLength,3); % preallocates an array
parfor j=1:9
    imageName = strcat('s',season,'e',episode,'-00',int2str(j),'.jpeg');
    imageMatrix = imread(imageName);
    averageR = floor(sum(sum(imageMatrix(:,:,1)))/720/1280 + 0.5);
    averageG = floor(sum(sum(imageMatrix(:,:,2)))/720/1280 + 0.5);
    averageB = floor(sum(sum(imageMatrix(:,:,3)))/720/1280 + 0.5);

    averageEpisodeColor(1,j,1) = averageR;
    averageEpisodeColor(1,j,2) = averageG;
    averageEpisodeColor(1,j,3) = averageB;
end
        
 parfor j=10:99
    imageName = strcat('s',season,'e',episode,'-0',int2str(j),'.jpeg');
    imageMatrix = imread(imageName);
    averageR = floor(sum(sum(imageMatrix(:,:,1)))/720/1280 + 0.5);
    averageG = floor(sum(sum(imageMatrix(:,:,2)))/720/1280 + 0.5);
    averageB = floor(sum(sum(imageMatrix(:,:,3)))/720/1280 + 0.5);

    averageEpisodeColor(1,j,1) = averageR;
    averageEpisodeColor(1,j,2) = averageG;
    averageEpisodeColor(1,j,3) = averageB;
end
 
 parfor j=100:videoLength
    imageName = strcat('s',season,'e',episode,'-',int2str(j),'.jpeg');
    imageMatrix = imread(imageName);
    averageR = floor(sum(sum(imageMatrix(:,:,1)))/720/1280 + 0.5);
    averageG = floor(sum(sum(imageMatrix(:,:,2)))/720/1280 + 0.5);
    averageB = floor(sum(sum(imageMatrix(:,:,3)))/720/1280 + 0.5);
 
    averageEpisodeColor(1,j,1) = averageR;
    averageEpisodeColor(1,j,2) = averageG;
    averageEpisodeColor(1,j,3) = averageB;
 end
 
 averageEpisodeColor = repmat(averageEpisodeColor, 720, 1);
 imshow(mat2gray(averageEpisodeColor));
 set(gcf,'PaperUnits','inches','PaperPosition',[0,0,videoLength,715])
 set(gca,'position',[0 0 1 1],'units','normalized')
 toc
  
 
