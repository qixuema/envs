sudo docker run \
--name=novnc \
-p 5555:80 \
-p 5909:5900 \
-v ~/studio/:/studio \
novnc:latest

