# Converting videos to images
They say a picture is worth a thousand words, so I took that literally and built average color pictures for each episode in the first season of Game of Thrones. Each vertical line represents one second of the show. Here's what I got : https://imgur.com/a/naPeJ

Here's some examples using a couple of popular movies: https://imgur.com/a/4g2lJ

----------------------------------

Source code for converting videos to film strips

FFMPEG is a convenient command line tool that can be used to extract frames from a video file.

This command 

	ffmpeg -i foo.avi -r 1 -s WxH -f image2 foo-%03d.jpeg 

will extract one video frame per second from the video and will output them in files named foo-001.jpeg, foo-002.jpeg, etc. Images will be rescaled to fit the new WxH (width by height) values. You can safely keep these values pretty small e.g. 320*240 without losing much resolution in the final image. By keeping the pictures small, you vastly improve the performance of the program.

If you want to extract just a limited number of frames, you can use the above command in combination with the -vframes or -t option, or in combination with -ss to start extracting from a certain point in time.

---- Steps ----

1) Download and install ffmpeg, a command line tool:

	http://ffmpeg.org/download.html

2) Extract images from the video

	a) Navigate to C:\Users\Ashwin\Documents\ffmpeg-20160610-git-0a9e781-win64-static (or wherever you unzipped ffmpeg to)

	b) Open ff-prompt

	c) Within FF Prompt, navigate to the video directory using:
	
		cd {directory name}

	d) in FF Prompt, type the following:
	
		ffmpeg -i foo.avi -r 1 -s WxH -f image2 s{season number e.g. 01}e{episode number e.g. 01}-%03d.jpeg
	
	  Replace foo.avi with whatever video file you want to process. Doesn't have to be .avi. Might want to rename video file so you can more easily type the file name in command prompt. Also replace WxH with the desired image resolution. Smaller images vastly improve performance. This will extract one video frame per second from the video and will output them in files named {desired image title}-001.jpeg, {desired image title}-002.jpeg, etc. Images will be rescaled to fit the new WxH values. This command could take 5+ minutes to run per hour of video, but once again keeping images small will allow the program to run much faster. 

3) Move all the generated images into their own folder. Copy averageColorGrab.m into the same folder as the images.

4) open the MATLAB script averageColorGrab.m that you just copied over. 
	
	a) Modify the season and episode number - you may need to modify the image title to match the format you described above in {desired image title}-xxx.jpg. Change the videoLength to the duration of the video in seconds. Easiest way to do this is to see how many jpegs you generated in step 1c. Save the file with ctrl+S
	
	b) Run the script by typing in the console:
	
		averageColorGrab
	
	  Script takes about 60 seconds to analyze 1 hour worth of 1080p video. 
	
	c) Next, we'll print and save the film strips. In the console, type the following (replace videoLength with the actual video length in seconds): 
	
		imshow(mat2gray(averageEpisodeColor));
	
		set(gcf,'PaperUnits','inches','PaperPosition',[0,0,videoLength,715])
 	
 		set(gca,'position',[0 0 1 1],'units','normalized')
	
		print -djpeg averagesXXeXXRGB -r1
	
	d) type csvwrite('averagesXXeYYRGB', averageEpisodeColor) to save the final RGB matrix, in case you'd like to do a reprint of the RAW data at another time. 

	
