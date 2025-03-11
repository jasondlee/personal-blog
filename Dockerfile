FROM fedora:latest

# Update the package index and install necessary packages
RUN dnf update --refresh -y && dnf install -y ruby rubygems ruby-devel gcc gcc-c++ rpm-build

# Set the working directory to /app
WORKDIR /app

EXPOSE 4000

# Display Ruby version and bundler version
RUN ruby --version && bundle --version && gem install bundler jekyll

# Command to run when the container starts
CMD ["bash", "build.sh", "-cs"]
