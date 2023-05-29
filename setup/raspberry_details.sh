mount_destination=raspios
mount_path=/mnt/$mount_destination

last_raspberry_update=2023-05-03
image_extension=img
os_flavor=raspios-bullseye-armhf-lite
raspberry_stem=${last_raspberry_update}-$os_flavor
resized_image=$raspberry_stem-resize.$image_extension
