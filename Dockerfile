# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the script into the container at /app
ADD speedtest-ifttt.sh /app
# Make it executable
RUN chmod +x speedtest-ifttt.sh

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/speedtest

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/speedtest

# Install needed packages to run the script
RUN pip install speedtest-cli
RUN apt-get update && apt-get install -qq -y curl cron

# Run the script when the container launches
#CMD ["cron", "-f"]
CMD ["bash", "/app/speedtest-ifttt.sh"]
