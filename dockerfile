FROM python

 
# Install Robot Framework and Selenium Library 
RUN pip install robotframework 
RUN pip install robotframework-seleniumlibrary
RUN pip install robotframework-datadriver

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable
    
    # install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.141/linux64/chrome-linux64.zip
RUN unzip /tmp/chromedriver.zip -d /tmp
RUN mv /tmp/chrome-linux64 /usr/local/bin/
RUN rm /tmp/chromedriver.zip

RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome && \
    mkdir -p /home/chrome && chown -R chrome:chrome /home/chrome

USER chrome
# set display port to avoid crash
ENV DISPLAY=:99

