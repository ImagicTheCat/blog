#!/bin/bash
hugo
(cd public && git add * && git commit -a -m 'Publish.' && git push)
