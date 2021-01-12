#!/bin/bash
backup_dir="/backup"
volumes_dir="/volumes"

for volume_dir in $volumes_dir/*/ ; do
  folder_name=`basename "$volume_dir"`
  backup_tar_filepath="$backup_dir/$folder_name.tar"

  echo "Restoring $folder_name from $backup_tar_filepath..."
  tar xf $backup_tar_filepath -C $volume_dir
done