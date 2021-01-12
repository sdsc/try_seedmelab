#!/bin/bash
backup_dir="/backup"
volumes_dir="/volumes"

for volume_dir in $volumes_dir/*/ ; do
  folder_name=`basename "$volume_dir"`
  dest_tar_filepath="$backup_dir/$folder_name.tar"

  echo "Backing up $folder_name to $dest_tar_filepath..."
  tar cf $dest_tar_filepath $volume_dir
done