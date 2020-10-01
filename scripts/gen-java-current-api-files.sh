#!/bin/bash -e

# Copyright (C) 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [[ -z "$1" ]]; then
  echo "usage: $0 <modulePath> scopes..." >&2
  exit 1
fi

api_dir=$1
shift

mkdir -p "$api_dir"

scopes=("" "$@")
apis=(current removed)

for scope in "${scopes[@]}"; do
  for api in "${apis[@]}"; do
    touch "${api_dir}/${scope}${api}.txt"
  done
done

