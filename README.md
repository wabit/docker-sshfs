# SSHFS

This Dockerfile creates a container with SSHFS installed to mount a remote directory over SSH.

## Getting Started

### Build the Docker Image

To build the Docker image, run the following command from the root directory of this project:

```bash
docker build -t <image-name> .
```

### Run the Container

To run the container, use the following command:

```bash
docker run --privileged \
-v /path/to/id_ed25519:/root/.ssh/id_ed25519:ro \
-e SERVER_ADDRESS=<server-address> \
-e REMOTE_USER=<remote-user> \
-e REMOTE_DIRECTORY=<remote-directory> \
-e MOUNT_POINT=<mount-point> \
--name wabit-sshfs \
-d <image-name>
```

Make sure to replace `<image-name>`, `<container-name>`, `<local-mount-point>`, `<server-address>`, `<remote-user>`, and `<remote-directory>` with your own values. Also, replace `/path/to/id_ed25519` with the path to your private key file on your local machine

### Environment Variables

The container uses the following environment variables:

* SERVER_ADDRESS: The address of the remote server to connect to.
* REMOTE_USER: The user to log in as on the remote server.
* REMOTE_DIRECTORY: The directory on the remote server to mount.
* MOUNT_POINT: Where to mount the remote directory on the local machine.

If any of these environment variables are not provided, the container will not start.

### License

This project is licensed under the GNU General Public License v3.0. See the LICENSE file for details.