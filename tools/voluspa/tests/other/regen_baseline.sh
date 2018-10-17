#!/bin/bash
#
#  Licensed to the Apache Software Foundation (ASF) under one
#  or more contributor license agreements.  See the NOTICE file
#  distributed with this work for additional information
#  regarding copyright ownership.  The ASF licenses this file
#  to you under the Apache License, Version 2.0 (the
#  "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

. properties.sh

if [ $# -gt 0 ]; then
    CUST=($1)
fi

CMD=../../voluspa
SCHEMA=../..

for i in ${CUST[@]}; do
    DEST=./${i}/base
    rm -rf $DEST
    mkdir $DEST
    ./$CMD --schema-location $SCHEMA --dest $DEST ${i}/*.conf 2> $DEST/stderr.txt
done

# Ignore failures from voluspa
exit 0