#!/bin/bash

exec git fetch origin master
exec git reset --hard FETCH_HEAD
exec git clean -df
exec yarn run dev
