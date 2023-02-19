FROM alpine

# Set the maintainer
LABEL maintainer="wabit"

# Install required packages
RUN apk add --no-cache openssh-client sshfs

# Set the environment variables
ENV MOUNT_POINT /mnt/sshfs
ENV SSHFS_FLAGS -o allow_other -o StrictHostKeyChecking=no

# Create the mount point
RUN mkdir -p $MOUNT_POINT

# Run the sshfs command on container startup
CMD sshfs $REMOTE_USER@$SERVER_ADDRESS:$REMOTE_DIRECTORY $MOUNT_POINT $SSHFS_FLAGS && tail -f /dev/null
