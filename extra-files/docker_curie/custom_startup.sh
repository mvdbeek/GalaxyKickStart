#!/usr/bin/env bash
usermod -g galaxy galaxy
groupadd -g 11435 Users-bioinfo-servers
groupadd -g 12100 u934
groupadd -g 12105 u934ab
usermod -a -G Users-bioinfo-servers galaxy
usermod -a -G u934 galaxy
usermod -a -G u934ab galaxy
