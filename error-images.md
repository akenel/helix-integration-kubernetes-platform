angel@CyBeard:~/HELIX$ ./scripts/automate-helix-setup_v2-0-3.sh
Creating necessary directories... 📁
✅ Directory exists: /home/angel/HELIX/configs
✅ Directory exists: /home/angel/HELIX/helm-charts
✅ Directories created/verified.
Checking for required tools... 🔍
✅ 'docker' found.
✅ 'k3d' found.
✅ 'helm' found.
✅ 'yq' found.
✅ All required tools found.
🐳 Starting local Docker registry at localhost:5000...
✅ Docker registry 'registry' is already running.

--- Pulling and importing directly specified Docker images --- 🚀
--- Processing image: bitnami/redis:8.0.2-debian-12-r0 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/redis:8.0.2-debian-12-r0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/redis:8.0.2-debian-12-r0' as 'localhost:5000/bitnami/redis:8.0.2-debian-12-r0' (attempt 1/3)... Almost there! ✨
Error response from daemon: No such image: bitnami/redis:8.0.2-debian-12-r0
❌ Tagging failed for 'bitnami/redis:8.0.2-debian-12-r0'. Daemon reported 'No such image'. This can happen if Docker's local cache is stale. Retrying pull then tagging in 5 seconds... 🔄
Forcing a re-pull for 'bitnami/redis:8.0.2-debian-12-r0' before retrying tag... 🌐
<3>WSL (332626 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
8.0.2-debian-12-r0: Pulling from bitnami/redis
827da8b40eb1: Pull complete
Digest: sha256:72965da510a610206dfe363f362a2be8eab28c9f84ff049ea72e6b6dd7553239
Status: Downloaded newer image for bitnami/redis:8.0.2-debian-12-r0
docker.io/bitnami/redis:8.0.2-debian-12-r0
🏷️ Tagging 'bitnami/redis:8.0.2-debian-12-r0' as 'localhost:5000/bitnami/redis:8.0.2-debian-12-r0' (attempt 2/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/redis:8.0.2-debian-12-r0' to local registry... The final stretch! 🚀
<3>WSL (334662 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/redis]
6d511f36378d: Pushed
8.0.2-debian-12-r0: digest: sha256:7e214e0832f87c52ddcae1228f62cc678a8e68157a2bbba22e960ac23abcaedb size: 529
✅ Image 'localhost:5000/bitnami/redis:8.0.2-debian-12-r0' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/redis:8.0.2-debian-12-r0' completed. (1/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris can send text messages in braille."

--- Processing image: bitnami/vault-k8s:1.6.2-debian-12-r10 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/vault-k8s:1.6.2-debian-12-r10' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/vault-k8s:1.6.2-debian-12-r10' as 'localhost:5000/bitnami/vault-k8s:1.6.2-debian-12-r10' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/vault-k8s:1.6.2-debian-12-r10' to local registry... The final stretch! 🚀
<3>WSL (336339 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/vault-k8s]
4bdf8b866f6d: Layer already exists
1.6.2-debian-12-r10: digest: sha256:d02ec3ad5d7f629024a558a6cd25233e01f0857a2a250331294ad9cf47d4ac54 size: 529
✅ Image 'localhost:5000/bitnami/vault-k8s:1.6.2-debian-12-r10' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/vault-k8s:1.6.2-debian-12-r10' completed. (2/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "CHUCK NORRIS is the ancestor of the one-celled bacteria"

--- Processing image: bitnami/vault:1.19.5-debian-12-r1 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/vault:1.19.5-debian-12-r1' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/vault:1.19.5-debian-12-r1' as 'localhost:5000/bitnami/vault:1.19.5-debian-12-r1' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/vault:1.19.5-debian-12-r1' to local registry... The final stretch! 🚀
<3>WSL (336771 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/vault]
e732ab99a4f6: Layer already exists
1.19.5-debian-12-r1: digest: sha256:66cd996b0bf9e4be823080cd16d6c8ae7ae5cf7719351a76c440b05a4ca99b69 size: 530
✅ Image 'localhost:5000/bitnami/vault:1.19.5-debian-12-r1' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/vault:1.19.5-debian-12-r1' completed. (3/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris once got an Apache Helicopter pregnant."

--- Processing image: rancher/mirrored-pause:3.6 --- 📦
DEBUG: 🤔 Docker thinks 'rancher/mirrored-pause:3.6' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'rancher/mirrored-pause:3.6' as 'localhost:5000/rancher/mirrored-pause:3.6' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/rancher/mirrored-pause:3.6' to local registry... The final stretch! 🚀
<3>WSL (337129 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/rancher/mirrored-pause]
1021ef88c797: Layer already exists
3.6: digest: sha256:74bf6fc6be13c4ec53a86a5acf9fdbc6787b176db0693659ad6ac89f115e182c size: 526
✅ Image 'localhost:5000/rancher/mirrored-pause:3.6' pushed to local registry. Success! 🎉
✨ Image processing for 'rancher/mirrored-pause:3.6' completed. (4/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Cancer gets Chuck Norris."

--- Processing image: rancher/local-path-provisioner:v0.0.30 --- 📦
DEBUG: 🤔 Docker thinks 'rancher/local-path-provisioner:v0.0.30' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'rancher/local-path-provisioner:v0.0.30' as 'localhost:5000/rancher/local-path-provisioner:v0.0.30' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/rancher/local-path-provisioner:v0.0.30' to local registry... The final stretch! 🚀
<3>WSL (337461 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/rancher/local-path-provisioner]
ba590b250089: Layer already exists
dd34ab1f8410: Layer already exists
80130aa659d9: Layer already exists
5f70bf18a086: Layer already exists
63ca1fbb43ae: Layer already exists
v0.0.30: digest: sha256:3ce53b88a449ca6652403c7f329a4255335321de34b5eb4081ec1a127bf0956e size: 1365
✅ Image 'localhost:5000/rancher/local-path-provisioner:v0.0.30' pushed to local registry. Success! 🎉
✨ Image processing for 'rancher/local-path-provisioner:v0.0.30' completed. (5/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris was once in a crowded elevator when it suddenly stopped. Norris immediately climbed up through the the hatch in the ceiling, grabbed onto the cable, pointed his assult rifle at the pulley, then looked up and said 'there is no spoon. There is only Norris.'"

--- Processing image: rancher/mirrored-library-busybox:1.36.1 --- 📦
DEBUG: 🤔 Docker thinks 'rancher/mirrored-library-busybox:1.36.1' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'rancher/mirrored-library-busybox:1.36.1' as 'localhost:5000/rancher/mirrored-library-busybox:1.36.1' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/rancher/mirrored-library-busybox:1.36.1' to local registry... The final stretch! 🚀
<3>WSL (337944 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/rancher/mirrored-library-busybox]
d41208ff92a2: Layer already exists
1.36.1: digest: sha256:b30d5558be991ccd728c8a275b6a684c8bd5f9ff13c2ac06e5b5798402e7e019 size: 527
✅ Image 'localhost:5000/rancher/mirrored-library-busybox:1.36.1' pushed to local registry. Success! 🎉
✨ Image processing for 'rancher/mirrored-library-busybox:1.36.1' completed. (6/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris knows how the Neverending Story ends."

--- Processing image: n8nio/n8n:latest --- 📦
DEBUG: 🤔 Docker thinks 'n8nio/n8n:latest' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'n8nio/n8n:latest' as 'localhost:5000/n8nio/n8n:latest' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/n8nio/n8n:latest' to local registry... The final stretch! 🚀
<3>WSL (338360 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/n8nio/n8n]
300d1b659b6c: Layer already exists
ca2d4bbcb200: Layer already exists
90f4f3da240e: Layer already exists
844a1d2a3a02: Layer already exists
9302a6acf83e: Layer already exists
5f70bf18a086: Layer already exists
894f741b7185: Layer already exists
d19ca654deb6: Layer already exists
92bbf9665f49: Layer already exists
47a6b026ff7b: Layer already exists
08000c18d16d: Layer already exists
latest: digest: sha256:df0d6160661fb2b5352777aacfb260d6125c6c6c61350ad6d6ffc065fa22306f size: 3038
✅ Image 'localhost:5000/n8nio/n8n:latest' pushed to local registry. Success! 🎉
✨ Image processing for 'n8nio/n8n:latest' completed. (7/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris' favorite flavor of Kool-Aid is Budweiser."

--- Processing image: rancher/mirrored-coredns-coredns:1.12.0 --- 📦
DEBUG: 🤔 Docker thinks 'rancher/mirrored-coredns-coredns:1.12.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'rancher/mirrored-coredns-coredns:1.12.0' as 'localhost:5000/rancher/mirrored-coredns-coredns:1.12.0' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/rancher/mirrored-coredns-coredns:1.12.0' to local registry... The final stretch! 🚀
<3>WSL (338736 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/rancher/mirrored-coredns-coredns]
25359bcca1bb: Layer already exists
3afb45609895: Layer already exists
b336e209998f: Layer already exists
f4aee9e53c42: Layer already exists
1a73b54f556b: Layer already exists
2a92d6ac9e4f: Layer already exists
bbb6cacb8c82: Layer already exists
6f1cdceb6a31: Layer already exists
af5aa97ebe6c: Layer already exists
4d049f83d9cf: Layer already exists
ddc6e550070c: Layer already exists
8fa10c0194df: Layer already exists
03af25190641: Layer already exists
1.12.0: digest: sha256:2324f485c8db937628a18c293d946327f3a7229b9f77213e8f2256f0b616a4ee size: 3024
✅ Image 'localhost:5000/rancher/mirrored-coredns-coredns:1.12.0' pushed to local registry. Success! 🎉
✨ Image processing for 'rancher/mirrored-coredns-coredns:1.12.0' completed. (8/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Whenever Chuck Norris sees a Best Buy, he burns it to the ground, because he firmly believes that a total gym for three payments of 19.99 is the best buy you'll ever find."

--- Processing image: rancher/mirrored-metrics-server:v0.7.2 --- 📦
DEBUG: 🤔 Docker thinks 'rancher/mirrored-metrics-server:v0.7.2' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'rancher/mirrored-metrics-server:v0.7.2' as 'localhost:5000/rancher/mirrored-metrics-server:v0.7.2' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/rancher/mirrored-metrics-server:v0.7.2' to local registry... The final stretch! 🚀
<3>WSL (339256 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/rancher/mirrored-metrics-server]
d4e932ee8cbd: Layer already exists
b336e209998f: Layer already exists
f4aee9e53c42: Layer already exists
1a73b54f556b: Layer already exists
2a92d6ac9e4f: Layer already exists
bbb6cacb8c82: Layer already exists
ac805962e479: Layer already exists
af5aa97ebe6c: Layer already exists
4d049f83d9cf: Layer already exists
945d17be9a3e: Layer already exists
49626df344c9: Layer already exists
f144bb4c7c7f: Layer already exists
v0.7.2: digest: sha256:16c5677beaaaa0ab393e9d17fd609b75503c2bd352874b3fc4ca14c5c8369941 size: 2814
✅ Image 'localhost:5000/rancher/mirrored-metrics-server:v0.7.2' pushed to local registry. Success! 🎉
✨ Image processing for 'rancher/mirrored-metrics-server:v0.7.2' completed. (9/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris has an oscillating penis."

--- Processing image: bitnami/minio:2025.5.24-debian-12-r5 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/minio:2025.5.24-debian-12-r5' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/minio:2025.5.24-debian-12-r5' as 'localhost:5000/bitnami/minio:2025.5.24-debian-12-r5' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/minio:2025.5.24-debian-12-r5' to local registry... The final stretch! 🚀
<3>WSL (339875 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/minio]
8d0ee1c20d6a: Layer already exists
2025.5.24-debian-12-r5: digest: sha256:06d07c837e440841c7e06be7655441dac406858e2691e1a675543aa2ae5c25ec size: 529
✅ Image 'localhost:5000/bitnami/minio:2025.5.24-debian-12-r5' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/minio:2025.5.24-debian-12-r5' completed. (10/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Only one woman has ever survived a slow dance with Chuck Norris, and she was a jeep."

--- Processing image: bitnami/minio-object-browser:2.0.1-debian-12-r1 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/minio-object-browser:2.0.1-debian-12-r1' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/minio-object-browser:2.0.1-debian-12-r1' as 'localhost:5000/bitnami/minio-object-browser:2.0.1-debian-12-r1' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/minio-object-browser:2.0.1-debian-12-r1' to local registry... The final stretch! 🚀
<3>WSL (340383 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/minio-object-browser]
0764e8a0ec83: Layer already exists
2.0.1-debian-12-r1: digest: sha256:52ae18c74045fa7c1f86bb186250a0b50be77549cc7b81ab3016e675ccac337e size: 529
✅ Image 'localhost:5000/bitnami/minio-object-browser:2.0.1-debian-12-r1' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/minio-object-browser:2.0.1-debian-12-r1' completed. (11/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "There was once a 51st state, known as New Idaho. It has not been heard of since it snubbed Chuck Norris as governor and was roundhouse kicked into a parallel dimension, along with Chuck's virginity and the last sonofabitch that overcooked his panda bear steaks. Chuck Norris eats his panda raw"

--- Processing image: quay.io/prometheus/prometheus:v2.52.0 --- 📦
DEBUG: 🤔 Docker thinks 'quay.io/prometheus/prometheus:v2.52.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'quay.io/prometheus/prometheus:v2.52.0' as 'localhost:5000/quay.io/prometheus/prometheus:v2.52.0' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/quay.io/prometheus/prometheus:v2.52.0' to local registry... The final stretch! 🚀
<3>WSL (340752 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/quay.io/prometheus/prometheus]
9520e68dff44: Layer already exists
c8fa07b1bc4b: Layer already exists
fc14cb076963: Layer already exists
ef3be2c1e398: Layer already exists
d005ffff3451: Layer already exists
27373cd1de4f: Layer already exists
1e80bc7d676a: Layer already exists
4338e6dae6b8: Layer already exists
603ff4c44eba: Layer already exists
d6ce738f5c90: Layer already exists
6b83872188a9: Layer already exists
1e604deea57d: Layer already exists
v2.52.0: digest: sha256:60f8194a41d3229b9e70684965ebdaa8f5a265f042d9de3d2079ba2ce677ec78 size: 2824
✅ Image 'localhost:5000/quay.io/prometheus/prometheus:v2.52.0' pushed to local registry. Success! 🎉
✨ Image processing for 'quay.io/prometheus/prometheus:v2.52.0' completed. (12/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "The only time Chuck Norris was ever beaten was in a fictional movie, Way Of The Dragon, by Bruce Lee. Both Lee and his son Brandon would later die in mysterious curcumstances. This is not a motherfucking coincidence."

--- Processing image: quay.io/prometheus/alertmanager:v0.27.0 --- 📦
DEBUG: 🤔 Docker thinks 'quay.io/prometheus/alertmanager:v0.27.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'quay.io/prometheus/alertmanager:v0.27.0' as 'localhost:5000/quay.io/prometheus/alertmanager:v0.27.0' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/quay.io/prometheus/alertmanager:v0.27.0' to local registry... The final stretch! 🚀
<3>WSL (341176 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/quay.io/prometheus/alertmanager]
5f70bf18a086: Layer already exists
5f24d63cc50f: Layer already exists
7762046c5170: Layer already exists
dd9de64bc0c2: Layer already exists
350d647fd75d: Layer already exists
6b83872188a9: Layer already exists
1e604deea57d: Layer already exists
v0.27.0: digest: sha256:45c3a586d4332d710bef92b06e90380c0b1f588968c00100d4b5e4e44c40ca5f size: 1781
✅ Image 'localhost:5000/quay.io/prometheus/alertmanager:v0.27.0' pushed to local registry. Success! 🎉
✨ Image processing for 'quay.io/prometheus/alertmanager:v0.27.0' completed. (13/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris' hula hoop has four samurai blades attached. He only uses it in the moshpit."

--- Processing image: quay.io/thanos/thanos:v0.32.2 --- 📦
DEBUG: 🤔 Docker thinks 'quay.io/thanos/thanos:v0.32.2' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'quay.io/thanos/thanos:v0.32.2' as 'localhost:5000/quay.io/thanos/thanos:v0.32.2' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/quay.io/thanos/thanos:v0.32.2' to local registry... The final stretch! 🚀
<3>WSL (341578 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/quay.io/thanos/thanos]
8860b75c45d9: Layer already exists
e025f7579bf5: Layer already exists
81e0a1377f20: Layer already exists
faf755cf727c: Layer already exists
v0.32.2: digest: sha256:70ecf5f3767a94e9be9a3caa2703a25e376030279362f98c00e8d4121373d428 size: 1161
✅ Image 'localhost:5000/quay.io/thanos/thanos:v0.32.2' pushed to local registry. Success! 🎉
✨ Image processing for 'quay.io/thanos/thanos:v0.32.2' completed. (14/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris can massacre his way through an army of bad guys like he's using a cheat code."

--- Processing image: quay.io/prometheus-operator/prometheus-operator:v0.74.0 --- 📦
DEBUG: 🤔 Docker thinks 'quay.io/prometheus-operator/prometheus-operator:v0.74.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'quay.io/prometheus-operator/prometheus-operator:v0.74.0' as 'localhost:5000/quay.io/prometheus-operator/prometheus-operator:v0.74.0' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/quay.io/prometheus-operator/prometheus-operator:v0.74.0' to local registry... The final stretch! 🚀
<3>WSL (342052 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/quay.io/prometheus-operator/prometheus-operator]
1cd1d3e9afff: Layer already exists
6b83872188a9: Layer already exists
1e604deea57d: Layer already exists
v0.74.0: digest: sha256:3bd6e91d0689fd1648dead176cb79520cc6d95096be1dd374803c8513e5b686e size: 949
✅ Image 'localhost:5000/quay.io/prometheus-operator/prometheus-operator:v0.74.0' pushed to local registry. Success! 🎉
✨ Image processing for 'quay.io/prometheus-operator/prometheus-operator:v0.74.0' completed. (15/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Electronic microscope pictures of the Y chromosome are just tiny photos of Chuck Norris"

--- Processing image: quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0 --- 📦
DEBUG: 🤔 Docker thinks 'quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0' as 'localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0' to local registry... The final stretch! 🚀
<3>WSL (342535 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader]
3fa01d11a59f: Layer already exists
6b83872188a9: Layer already exists
1e604deea57d: Layer already exists
v0.74.0: digest: sha256:4d263e1fc8ad470f0310966663b4dfdc5d47dbcce77cf630ba8400a7e208eb14 size: 949
✅ Image 'localhost:5000/quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0' pushed to local registry. Success! 🎉
✨ Image processing for 'quay.io/prometheus-operator/prometheus-config-reloader:v0.74.0' completed. (16/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "every time Chuck Norris walks into a graveyard he simply smiles and says "good times"."

--- Processing image: quay.io/prometheus/node-exporter:v1.7.0 --- 📦
DEBUG: 🤔 Docker thinks 'quay.io/prometheus/node-exporter:v1.7.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'quay.io/prometheus/node-exporter:v1.7.0' as 'localhost:5000/quay.io/prometheus/node-exporter:v1.7.0' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/quay.io/prometheus/node-exporter:v1.7.0' to local registry... The final stretch! 🚀
<3>WSL (342971 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/quay.io/prometheus/node-exporter]
24cc87562193: Layer already exists
aaa2c4c90b67: Layer already exists
faf755cf727c: Layer already exists
v1.7.0: digest: sha256:52a6f10ff10238979c365c06dbed8ad5cd1645c41780dc08ff813adacfb2341e size: 949
✅ Image 'localhost:5000/quay.io/prometheus/node-exporter:v1.7.0' pushed to local registry. Success! 🎉
✨ Image processing for 'quay.io/prometheus/node-exporter:v1.7.0' completed. (17/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "The most obvious upside to receiving a brutal Chuck Norris roundhouse kick is is that you will enter the afterlife knowing that you have died the most awesome death possible."

--- Processing image: registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0 --- 📦
DEBUG: 🤔 Docker thinks 'registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0' as 'localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0' to local registry... The final stretch! 🚀
<3>WSL (343722 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics]
bed84d691109: Layer already exists
2388d21e8e2b: Layer already exists
c048279a7d9f: Layer already exists
1a73b54f556b: Layer already exists
2a92d6ac9e4f: Layer already exists
bbb6cacb8c82: Layer already exists
ac805962e479: Layer already exists
af5aa97ebe6c: Layer already exists
4d049f83d9cf: Layer already exists
1df9699731f7: Layer already exists
6fbdf253bbc2: Layer already exists
70c35736547b: Layer already exists
v2.11.0: digest: sha256:ec643357b29c7564cd2ea7aa1949a619d11a15b2633d140ad8104e2d84032d28 size: 2814
✅ Image 'localhost:5000/registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0' pushed to local registry. Success! 🎉
✨ Image processing for 'registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.11.0' completed. (18/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "When Chuck Norris was asked if he believed that the world was going to end in 2012 he resonded: "Depends how I'm feeling that day.""

--- Processing image: bitnami/jmx-exporter:1.3.0-debian-12-r3 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/jmx-exporter:1.3.0-debian-12-r3' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/jmx-exporter:1.3.0-debian-12-r3' as 'localhost:5000/bitnami/jmx-exporter:1.3.0-debian-12-r3' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/jmx-exporter:1.3.0-debian-12-r3' to local registry... The final stretch! 🚀
The push refers to repository [localhost:5000/bitnami/jmx-exporter]
77b5d21ba5ec: Layer already exists
1.3.0-debian-12-r3: digest: sha256:d528c69b1322f78c3f6df4ea76f16892d378484da89aea1a285862ff27525dab size: 530
✅ Image 'localhost:5000/bitnami/jmx-exporter:1.3.0-debian-12-r3' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/jmx-exporter:1.3.0-debian-12-r3' completed. (19/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris' recent book tour... 1)PORT-AU-PRINCE, HAITI January 12, 2010 2)NORTHERN CALIFORNIA February 04, 2010 3)RYUKYU ISLANDS, JAPAN February 26, 2010 4)MAULE, CHILE February 27, 2010 5)SOUTHERN SUMATRA, INDONESIA March 05, 2010 6)EASTERN TURKEY March 08, 2010 hmmmmmm."

--- Processing image: kiwigrid/k8s-sidecar:1.30.3 --- 📦
DEBUG: 🤔 Docker thinks 'kiwigrid/k8s-sidecar:1.30.3' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'kiwigrid/k8s-sidecar:1.30.3' as 'localhost:5000/kiwigrid/k8s-sidecar:1.30.3' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/kiwigrid/k8s-sidecar:1.30.3' to local registry... The final stretch! 🚀
<3>WSL (344546 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/kiwigrid/k8s-sidecar]
aca85db41ca2: Layer already exists
0c6cd3d1e733: Layer already exists
336e6a290569: Layer already exists
53d9c097c68d: Layer already exists
052b772c7a04: Layer already exists
08000c18d16d: Layer already exists
1.30.3: digest: sha256:e91ccbceaeb5bd1ea6e6c8fcbc8761465652c5704adf1b96a3b550421414668c size: 1574
✅ Image 'localhost:5000/kiwigrid/k8s-sidecar:1.30.3' pushed to local registry. Success! 🎉
✨ Image processing for 'kiwigrid/k8s-sidecar:1.30.3' completed. (20/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris let the dogs out"

--- Processing image: thanos/thanos:v0.38.0 --- 📦
DEBUG: 🤔 Docker thinks 'thanos/thanos:v0.38.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'thanos/thanos:v0.38.0' as 'localhost:5000/thanos/thanos:v0.38.0' (attempt 1/3)... Almost there! ✨
Error response from daemon: No such image: thanos/thanos:v0.38.0
❌ Tagging failed for 'thanos/thanos:v0.38.0'. Daemon reported 'No such image'. This can happen if Docker's local cache is stale. Retrying pull then tagging in 5 seconds... 🔄
Forcing a re-pull for 'thanos/thanos:v0.38.0' before retrying tag... 🌐
<3>WSL (344972 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
Error response from daemon: pull access denied for thanos/thanos, repository does not exist or may require 'docker login': denied: requested access to the resource is denied
❌ Failed to re-pull 'thanos/thanos:v0.38.0' after tagging error. Cannot proceed with this image. 🛑
❌ Aw, snap! Failed to tag image 'thanos/thanos:v0.38.0' after 3 attempts, even with re-pulls. Skipping this image. 💔
--- Processing image: prometheus/prometheus:v3.4.1 --- 📦
DEBUG: 🤔 Docker thinks 'prometheus/prometheus:v3.4.1' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'prometheus/prometheus:v3.4.1' as 'localhost:5000/prometheus/prometheus:v3.4.1' (attempt 1/3)... Almost there! ✨
Error response from daemon: No such image: prometheus/prometheus:v3.4.1
❌ Tagging failed for 'prometheus/prometheus:v3.4.1'. Daemon reported 'No such image'. This can happen if Docker's local cache is stale. Retrying pull then tagging in 5 seconds... 🔄
Forcing a re-pull for 'prometheus/prometheus:v3.4.1' before retrying tag... 🌐
<3>WSL (345576 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
Error response from daemon: pull access denied for prometheus/prometheus, repository does not exist or may require 'docker login': denied: requested access to the resource is denied
❌ Failed to re-pull 'prometheus/prometheus:v3.4.1' after tagging error. Cannot proceed with this image. 🛑
❌ Aw, snap! Failed to tag image 'prometheus/prometheus:v3.4.1' after 3 attempts, even with re-pulls. Skipping this image. 💔
--- Processing image: grafana/loki:3.5.0 --- 📦
DEBUG: 🤔 Docker thinks 'grafana/loki:3.5.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'grafana/loki:3.5.0' as 'localhost:5000/grafana/loki:3.5.0' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/grafana/loki:3.5.0' to local registry... The final stretch! 🚀
<3>WSL (346516 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/grafana/loki]
e7e57375cb64: Layer already exists
da7505953c31: Layer already exists
a318a4e25021: Layer already exists
8ec03de18c3d: Layer already exists
3f0dbb44ecc4: Layer already exists
b336e209998f: Layer already exists
f4aee9e53c42: Layer already exists
1a73b54f556b: Layer already exists
2a92d6ac9e4f: Layer already exists
bbb6cacb8c82: Layer already exists
6f1cdceb6a31: Layer already exists
af5aa97ebe6c: Layer already exists
4d049f83d9cf: Layer already exists
48c0fb67386e: Layer already exists
8fa10c0194df: Layer already exists
b7f712dabf33: Layer already exists
3.5.0: digest: sha256:2cbddd6e199a2ddeee13573d91f11e54d9c8fa432f44c578d3c55b9a93278c9f size: 3645
✅ Image 'localhost:5000/grafana/loki:3.5.0' pushed to local registry. Success! 🎉
✨ Image processing for 'grafana/loki:3.5.0' completed. (21/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris has seen it all, and done it all, so many times that he has long ago lost count."

--- Processing image: kong:3.9 --- 📦
DEBUG: 🤔 Docker thinks 'kong:3.9' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'kong:3.9' as 'localhost:5000/kong:3.9' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/kong:3.9' to local registry... The final stretch! 🚀
<3>WSL (347066 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/kong]
591976da9003: Layer already exists
753e368db2a7: Layer already exists
cdc32ce74726: Layer already exists
a8346d259389: Layer already exists
3.9: digest: sha256:db1e886a9e36e5cd0a98cbd85b1520885a78a5dcbd96408b5ae6c5695eb330e6 size: 1156
✅ Image 'localhost:5000/kong:3.9' pushed to local registry. Success! 🎉
✨ Image processing for 'kong:3.9' completed. (22/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "The US did not boycot the 1980 Summer Olympics. Chuck Norris was the only US qualifier for every event. He decided not to compete because there was no challenge."

--- Processing image: ecr-public.aws.com/docker/library/redis:7.2.8-alpine --- 📦
DEBUG: 🤔 Docker thinks 'ecr-public.aws.com/docker/library/redis:7.2.8-alpine' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'ecr-public.aws.com/docker/library/redis:7.2.8-alpine' as 'localhost:5000/ecr-public.aws.com/docker/library/redis:7.2.8-alpine' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/ecr-public.aws.com/docker/library/redis:7.2.8-alpine' to local registry... The final stretch! 🚀
<3>WSL (347904 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/ecr-public.aws.com/docker/library/redis]
4d7066b0e143: Layer already exists
5f70bf18a086: Layer already exists
a738c5aa361f: Layer already exists
c581187f88c5: Layer already exists
e19019c8f17e: Layer already exists
80a02d377c0e: Layer already exists
5eb48cee65ab: Layer already exists
08000c18d16d: Layer already exists
7.2.8-alpine: digest: sha256:244c2fe15fb3d2d2f8ae4ee9c0aa30925d22f012539eea1935d00e27f6b22e88 size: 1988
✅ Image 'localhost:5000/ecr-public.aws.com/docker/library/redis:7.2.8-alpine' pushed to local registry. Success! 🎉
✨ Image processing for 'ecr-public.aws.com/docker/library/redis:7.2.8-alpine' completed. (23/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris' pet snake has hair on its scrotum and ingrown toenail."

--- Processing image: quay.io/argoprojlabs/argocd-extension-installer:v0.0.8 --- 📦
DEBUG: 🤔 Docker thinks 'quay.io/argoprojlabs/argocd-extension-installer:v0.0.8' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'quay.io/argoprojlabs/argocd-extension-installer:v0.0.8' as 'localhost:5000/quay.io/argoprojlabs/argocd-extension-installer:v0.0.8' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/quay.io/argoprojlabs/argocd-extension-installer:v0.0.8' to local registry... The final stretch! 🚀
<3>WSL (348442 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/quay.io/argoprojlabs/argocd-extension-installer]
8d1a450e0515: Layer already exists
5f70bf18a086: Layer already exists
8fe09d924837: Layer already exists
ea69330d265e: Layer already exists
d4fc045c9e3a: Layer already exists
v0.0.8: digest: sha256:33c1c2f4d13f6ee58c0c68081a6557c84b6ca75875cf61012d059d1e580a493b size: 1361
✅ Image 'localhost:5000/quay.io/argoprojlabs/argocd-extension-installer:v0.0.8' pushed to local registry. Success! 🎉
✨ Image processing for 'quay.io/argoprojlabs/argocd-extension-installer:v0.0.8' completed. (24/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris has way better fireworks than you"

--- Processing image: ghcr.io/oliver006/redis_exporter:v1.74.0 --- 📦
DEBUG: 🤔 Docker thinks 'ghcr.io/oliver006/redis_exporter:v1.74.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'ghcr.io/oliver006/redis_exporter:v1.74.0' as 'localhost:5000/ghcr.io/oliver006/redis_exporter:v1.74.0' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/ghcr.io/oliver006/redis_exporter:v1.74.0' to local registry... The final stretch! 🚀
<3>WSL (348812 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/ghcr.io/oliver006/redis_exporter]
bcb85796f103: Layer already exists
b886a9e7dfd0: Layer already exists
81c1f5332ad2: Layer already exists
v1.74.0: digest: sha256:d52a68bb6693ede8dade8900d42d35a829d087461ba7e8bced45299889cef06a size: 945
✅ Image 'localhost:5000/ghcr.io/oliver006/redis_exporter:v1.74.0' pushed to local registry. Success! 🎉
✨ Image processing for 'ghcr.io/oliver006/redis_exporter:v1.74.0' completed. (25/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris was originally cast for the main character in the hit series 24. The directors had to cut him because he killed all of the worlds terrorist in 12 minutes and&#65279; 37 seconds."

--- Processing image: ingress-nginx/kube-webhook-certgen:v1.5.3 --- 📦
DEBUG: 🤔 Docker thinks 'ingress-nginx/kube-webhook-certgen:v1.5.3' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'ingress-nginx/kube-webhook-certgen:v1.5.3' as 'localhost:5000/ingress-nginx/kube-webhook-certgen:v1.5.3' (attempt 1/3)... Almost there! ✨
Error response from daemon: No such image: ingress-nginx/kube-webhook-certgen:v1.5.3
❌ Tagging failed for 'ingress-nginx/kube-webhook-certgen:v1.5.3'. Daemon reported 'No such image'. This can happen if Docker's local cache is stale. Retrying pull then tagging in 5 seconds... 🔄
Forcing a re-pull for 'ingress-nginx/kube-webhook-certgen:v1.5.3' before retrying tag... 🌐
Error response from daemon: pull access denied for ingress-nginx/kube-webhook-certgen, repository does not exist or may require 'docker login': denied: requested access to the resource is denied
❌ Failed to re-pull 'ingress-nginx/kube-webhook-certgen:v1.5.3' after tagging error. Cannot proceed with this image. 🛑
❌ Aw, snap! Failed to tag image 'ingress-nginx/kube-webhook-certgen:v1.5.3' after 3 attempts, even with re-pulls. Skipping this image. 💔
--- Processing image: bitnami/kubectl:1.33.1-debian-12-r5 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/kubectl:1.33.1-debian-12-r5' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/kubectl:1.33.1-debian-12-r5' as 'localhost:5000/bitnami/kubectl:1.33.1-debian-12-r5' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/kubectl:1.33.1-debian-12-r5' to local registry... The final stretch! 🚀
<3>WSL (349632 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/kubectl]
130491a6af04: Layer already exists
1.33.1-debian-12-r5: digest: sha256:6a49f1e6b88f8e4666b147b224a001d7ebd20fed04982c28e6e269cd55902cd2 size: 530
✅ Image 'localhost:5000/bitnami/kubectl:1.33.1-debian-12-r5' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/kubectl:1.33.1-debian-12-r5' completed. (26/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris assults your senses with a crowbar."

--- Processing image: prom/memcached-exporter:v0.15.2 --- 📦
DEBUG: 🤔 Docker thinks 'prom/memcached-exporter:v0.15.2' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'prom/memcached-exporter:v0.15.2' as 'localhost:5000/prom/memcached-exporter:v0.15.2' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/prom/memcached-exporter:v0.15.2' to local registry... The final stretch! 🚀
<3>WSL (350148 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/prom/memcached-exporter]
82e244a7949c: Layer already exists
6b83872188a9: Layer already exists
1e604deea57d: Layer already exists
v0.15.2: digest: sha256:71307e6141bfe515484d09456a3984d11982c496416a3c03da964ed63a317704 size: 948
✅ Image 'localhost:5000/prom/memcached-exporter:v0.15.2' pushed to local registry. Success! 🎉
✨ Image processing for 'prom/memcached-exporter:v0.15.2' completed. (27/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "What you know from what you do not know is CHUCK NORRIS!"

--- Processing image: bitnami/kafka:4.0.0-debian-12-r7 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/kafka:4.0.0-debian-12-r7' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/kafka:4.0.0-debian-12-r7' as 'localhost:5000/bitnami/kafka:4.0.0-debian-12-r7' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/kafka:4.0.0-debian-12-r7' to local registry... The final stretch! 🚀
<3>WSL (350740 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/kafka]
05fe6d6aebc1: Layer already exists
4.0.0-debian-12-r7: digest: sha256:600d98a57183ef44ffe24032fbb45151d4a7291998cd8501830fbbd419e2cd08 size: 530
✅ Image 'localhost:5000/bitnami/kafka:4.0.0-debian-12-r7' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/kafka:4.0.0-debian-12-r7' completed. (28/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Children of cannibals think Chuck Norris is the Easter Bunny."

--- Processing image: kong/kubernetes-ingress-controller:3.4 --- 📦
DEBUG: 🤔 Docker thinks 'kong/kubernetes-ingress-controller:3.4' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'kong/kubernetes-ingress-controller:3.4' as 'localhost:5000/kong/kubernetes-ingress-controller:3.4' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/kong/kubernetes-ingress-controller:3.4' to local registry... The final stretch! 🚀
<3>WSL (351225 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/kong/kubernetes-ingress-controller]
b38bc0c09b94: Layer already exists
b336e209998f: Layer already exists
f4aee9e53c42: Layer already exists
1a73b54f556b: Layer already exists
2a92d6ac9e4f: Layer already exists
bbb6cacb8c82: Layer already exists
6f1cdceb6a31: Layer already exists
af5aa97ebe6c: Layer already exists
4d049f83d9cf: Layer already exists
48c0fb67386e: Layer already exists
8fa10c0194df: Layer already exists
f464af4b9b25: Layer already exists
3.4: digest: sha256:770649ce2d69c97a5993dea3c8f9a33868ce0ba2809ab12e3f4d43b744c4ad08 size: 2814
✅ Image 'localhost:5000/kong/kubernetes-ingress-controller:3.4' pushed to local registry. Success! 🎉
✨ Image processing for 'kong/kubernetes-ingress-controller:3.4' completed. (29/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris can surf the net on his abacus"

--- Processing image: bitnami/os-shell:12-debian-12-r46 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/os-shell:12-debian-12-r46' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/os-shell:12-debian-12-r46' as 'localhost:5000/bitnami/os-shell:12-debian-12-r46' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/os-shell:12-debian-12-r46' to local registry... The final stretch! 🚀
<3>WSL (351737 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/os-shell]
0789e1a41564: Layer already exists
12-debian-12-r46: digest: sha256:79b21fbb9f0fdcd3f412f74a685a764ace832e0ba38642be315184deaafb5f7a size: 529
✅ Image 'localhost:5000/bitnami/os-shell:12-debian-12-r46' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/os-shell:12-debian-12-r46' completed. (30/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "If Chuck Norris was a twilight vampire, he wouldn't sparkle, he'd blind you for life b/c nobody will ever see Chuck Norris as such a travisty"

--- Processing image: bitnami/os-shell:12-debian-12-r45 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/os-shell:12-debian-12-r45' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/os-shell:12-debian-12-r45' as 'localhost:5000/bitnami/os-shell:12-debian-12-r45' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/os-shell:12-debian-12-r45' to local registry... The final stretch! 🚀
<3>WSL (352164 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/os-shell]
831ee0e3f433: Layer already exists
12-debian-12-r45: digest: sha256:ed68ea5bb425f1e2c70ac2c86e923b820bbe77381a76af730ff83ba42252fbb8 size: 529
✅ Image 'localhost:5000/bitnami/os-shell:12-debian-12-r45' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/os-shell:12-debian-12-r45' completed. (31/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris got his first pair of nunchucks when he was a zygote."

--- Processing image: bitnami/zookeeper:3.9.3-debian-12-r16 --- 📦
DEBUG: 🤔 Docker thinks 'bitnami/zookeeper:3.9.3-debian-12-r16' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'bitnami/zookeeper:3.9.3-debian-12-r16' as 'localhost:5000/bitnami/zookeeper:3.9.3-debian-12-r16' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/bitnami/zookeeper:3.9.3-debian-12-r16' to local registry... The final stretch! 🚀
<3>WSL (352656 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/bitnami/zookeeper]
a776b58fa891: Layer already exists
3.9.3-debian-12-r16: digest: sha256:6f2f0a07d68fe74e309c07586e9af1123eb4202a137f38583cab14518c8bbd37 size: 530
✅ Image 'localhost:5000/bitnami/zookeeper:3.9.3-debian-12-r16' pushed to local registry. Success! 🎉
✨ Image processing for 'bitnami/zookeeper:3.9.3-debian-12-r16' completed. (32/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris can put a fruit pastel in his mouth without chewing it"

--- Processing image: busybox:latest --- 📦
DEBUG: 🤔 Docker thinks 'busybox:latest' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'busybox:latest' as 'localhost:5000/busybox:latest' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/busybox:latest' to local registry... The final stretch! 🚀
<3>WSL (353020 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/busybox]
65014c70e84b: Layer already exists
latest: digest: sha256:ec06ff94ef8731492058cbe21bc15fb87ec0b98afc20961955200e7e70203c67 size: 527
✅ Image 'localhost:5000/busybox:latest' pushed to local registry. Success! 🎉
✨ Image processing for 'busybox:latest' completed. (33/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "When Chuck Norris needs a new car, he doesn't look for a car, the cars look for him!"

--- Processing image: grafana/enterprise-logs:3.5.1 --- 📦
DEBUG: 🤔 Docker thinks 'grafana/enterprise-logs:3.5.1' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'grafana/enterprise-logs:3.5.1' as 'localhost:5000/grafana/enterprise-logs:3.5.1' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/grafana/enterprise-logs:3.5.1' to local registry... The final stretch! 🚀
<3>WSL (353383 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/grafana/enterprise-logs]
5b98b8788256: Layer already exists
ed8dfdc933d2: Layer already exists
477d73fd0221: Layer already exists
0a61884add1d: Layer already exists
b071328bdfcf: Layer already exists
c0800bb01603: Layer already exists
03aada85ce15: Layer already exists
3f0dbb44ecc4: Layer already exists
b336e209998f: Layer already exists
f4aee9e53c42: Layer already exists
1a73b54f556b: Layer already exists
2a92d6ac9e4f: Layer already exists
bbb6cacb8c82: Layer already exists
6f1cdceb6a31: Layer already exists
af5aa97ebe6c: Layer already exists
4d049f83d9cf: Layer already exists
48c0fb67386e: Layer already exists
8fa10c0194df: Layer already exists
b7f712dabf33: Layer already exists
3.5.1: digest: sha256:55efb3c81cc52cdd45d255472669db260baa580e291861c1a257f31c273af1cc size: 4270
✅ Image 'localhost:5000/grafana/enterprise-logs:3.5.1' pushed to local registry. Success! 🎉
✨ Image processing for 'grafana/enterprise-logs:3.5.1' completed. (34/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "jonson theeee weeeed is not as good as Chuck Norris. chuck has a massive penis"

--- Processing image: nginxinc/nginx-unprivileged:1.28-alpine --- 📦
DEBUG: 🤔 Docker thinks 'nginxinc/nginx-unprivileged:1.28-alpine' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'nginxinc/nginx-unprivileged:1.28-alpine' as 'localhost:5000/nginxinc/nginx-unprivileged:1.28-alpine' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/nginxinc/nginx-unprivileged:1.28-alpine' to local registry... The final stretch! 🚀
<3>WSL (354036 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/nginxinc/nginx-unprivileged]
3644f3009f32: Layer already exists
d05580bb9d0b: Layer already exists
cb4640dd33ca: Layer already exists
22ca692133f6: Layer already exists
1cefd3f9ec0f: Layer already exists
40568b6580e9: Layer already exists
83aa80ee9745: Layer already exists
e0850a55183d: Layer already exists
08000c18d16d: Layer already exists
1.28-alpine: digest: sha256:6ea99401990294d149fda684d06600f0c0c90bd70cd98365bc4cdaca26a4f3d9 size: 2197
✅ Image 'localhost:5000/nginxinc/nginx-unprivileged:1.28-alpine' pushed to local registry. Success! 🎉
✨ Image processing for 'nginxinc/nginx-unprivileged:1.28-alpine' completed. (35/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris was asked if he would be willing to wrestle a Grizzly Bear. Chuck said he would and then added "I didn't know Rosie O'Donnell was in town"."

--- Processing image: prometheus/alertmanager:v0.28.1 --- 📦
DEBUG: 🤔 Docker thinks 'prometheus/alertmanager:v0.28.1' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'prometheus/alertmanager:v0.28.1' as 'localhost:5000/prometheus/alertmanager:v0.28.1' (attempt 1/3)... Almost there! ✨
Error response from daemon: No such image: prometheus/alertmanager:v0.28.1
❌ Tagging failed for 'prometheus/alertmanager:v0.28.1'. Daemon reported 'No such image'. This can happen if Docker's local cache is stale. Retrying pull then tagging in 5 seconds... 🔄
Forcing a re-pull for 'prometheus/alertmanager:v0.28.1' before retrying tag... 🌐
<3>WSL (354443 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
Error response from daemon: pull access denied for prometheus/alertmanager, repository does not exist or may require 'docker login': denied: requested access to the resource is denied
❌ Failed to re-pull 'prometheus/alertmanager:v0.28.1' after tagging error. Cannot proceed with this image. 🛑
❌ Aw, snap! Failed to tag image 'prometheus/alertmanager:v0.28.1' after 3 attempts, even with re-pulls. Skipping this image. 💔
--- Processing image: grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee --- 📦
DEBUG: 🤔 Docker thinks 'grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee' as 'localhost:5000/grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee' to local registry... The final stretch! 🚀
<3>WSL (354889 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/grafana/loki-helm-test]
897ae93d589c: Layer already exists
79804d832789: Layer already exists
9fe9a137fd00: Layer already exists
ewelch-distributed-helm-chart-17db5ee: digest: sha256:9e95e3511f95307cf18d315e743f16ba9c54f52610761b80ea880554d09a85c8 size: 949
✅ Image 'localhost:5000/grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee' pushed to local registry. Success! 🎉
✨ Image processing for 'grafana/loki-helm-test:ewelch-distributed-helm-chart-17db5ee' completed. (36/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris hates Raymond."

--- Processing image: ghcr.io/dexidp/dex:v2.43.1 --- 📦
DEBUG: 🤔 Docker thinks 'ghcr.io/dexidp/dex:v2.43.1' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'ghcr.io/dexidp/dex:v2.43.1' as 'localhost:5000/ghcr.io/dexidp/dex:v2.43.1' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/ghcr.io/dexidp/dex:v2.43.1' to local registry... The final stretch! 🚀
<3>WSL (355274 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/ghcr.io/dexidp/dex]
4f55b514868d: Layer already exists
199ee4864769: Layer already exists
109ac3064007: Layer already exists
9ec8957c9c3b: Layer already exists
6bee10882e97: Layer already exists
926bd8838a05: Layer already exists
4235c6d51473: Layer already exists
ea9aff376857: Layer already exists
31859149ce25: Layer already exists
08000c18d16d: Layer already exists
v2.43.1: digest: sha256:75e51b0149ec30319d56db1b5ff7b1136687c8f9667ef827b0e43f3a825a8598 size: 2412
✅ Image 'localhost:5000/ghcr.io/dexidp/dex:v2.43.1' pushed to local registry. Success! 🎉
✨ Image processing for 'ghcr.io/dexidp/dex:v2.43.1' completed. (37/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Chuck Norris doesn't believe in ravioli. He stuffs a live turtle with beef and smothers it in pig's blood."

--- Processing image: jimmidyson/configmap-reload:v0.12.0 --- 📦
DEBUG: 🤔 Docker thinks 'jimmidyson/configmap-reload:v0.12.0' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'jimmidyson/configmap-reload:v0.12.0' as 'localhost:5000/jimmidyson/configmap-reload:v0.12.0' (attempt 1/3)... Almost there! ✨
Error response from daemon: No such image: jimmidyson/configmap-reload:v0.12.0
❌ Tagging failed for 'jimmidyson/configmap-reload:v0.12.0'. Daemon reported 'No such image'. This can happen if Docker's local cache is stale. Retrying pull then tagging in 5 seconds... 🔄
Forcing a re-pull for 'jimmidyson/configmap-reload:v0.12.0' before retrying tag... 🌐
<3>WSL (355833 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
Error response from daemon: manifest for jimmidyson/configmap-reload:v0.12.0 not found: manifest unknown: manifest unknown
❌ Failed to re-pull 'jimmidyson/configmap-reload:v0.12.0' after tagging error. Cannot proceed with this image. 🛑
❌ Aw, snap! Failed to tag image 'jimmidyson/configmap-reload:v0.12.0' after 3 attempts, even with re-pulls. Skipping this image. 💔
--- Processing image: memcached:1.6.38-alpine --- 📦
DEBUG: 🤔 Docker thinks 'memcached:1.6.38-alpine' is here (exit code 0). Tentatively skipping pull. 💾
🏷️ Tagging 'memcached:1.6.38-alpine' as 'localhost:5000/memcached:1.6.38-alpine' (attempt 1/3)... Almost there! ✨
✅ Image tagged successfully! 🎉
⬆️ Pushing 'localhost:5000/memcached:1.6.38-alpine' to local registry... The final stretch! 🚀
<3>WSL (356567 - ) ERROR: UtilAcceptVsock:271: accept4 failed 110
The push refers to repository [localhost:5000/memcached]
b87fb94c07f7: Layer already exists
392eed06d081: Layer already exists
cbcd34cbca0c: Layer already exists
87b284021f7a: Layer already exists
838a61d9221f: Layer already exists
fd2758d7a50e: Layer already exists
1.6.38-alpine: digest: sha256:a2269ee190e743721e43aadab88e63dc42acc05bb9f61c7d45463668cb30abe3 size: 1570
✅ Image 'localhost:5000/memcached:1.6.38-alpine' pushed to local registry. Success! 🎉
✨ Image processing for 'memcached:1.6.38-alpine' completed. (38/43) You can now use this image in your k3d cluster. Go forth and conquer! 🌟
😂 Here's a Chuck Norris fact for you:
    "Because of their resemblance to volleyballs, Chuck Norris had the brandname 'Wilson' tattooed on both his testicles. Then, on a whim, he tracked down Tom Hanks and threw him through a plate glass window."


--- Processing Helm Charts and extracting their embedded images --- 🎨
Adding Helm repositories... ➕
Repository 'grafana' already added. Skipping.
Repository 'cetic' already added. Skipping.
Repository 'traefik' already added. Skipping.
Repository 'argo' already added. Skipping.
Repository 'bitnami' already added. Skipping.
Repository 'prometheus-community' already added. Skipping.
Repository 'hashicorp' already added. Skipping.
Repository 'elastic' already added. Skipping.
Repository 'kong' already added. Skipping.
Repository 'jetstack' already added. Skipping.
Repository 'kiali' already added. Skipping.
Updating Helm repositories to get the latest charts... 🔄
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "jetstack" chart repository
...Successfully got an update from the "cetic" chart repository
...Successfully got an update from the "kong" chart repository
...Successfully got an update from the "kiali" chart repository
...Successfully got an update from the "traefik" chart repository
...Successfully got an update from the "elastic" chart repository
...Successfully got an update from the "argo" chart repository
...Successfully got an update from the "grafana" chart repository
...Successfully got an update from the "prometheus-community" chart repository
...Successfully got an update from the "hashicorp" chart repository

...Successfully got an update from the "bitnami" chart repository
Update Complete. ⎈Happy Helming!⎈

--- Chart Processing: bitnami/zookeeper ---
🎨 Extracting images from Helm chart: bitnami/zookeeper (repo: bitnami, chart: zookeeper, version: latest)
Error: failed to resolve registry-1.docker.io/bitnamicharts/zookeeper:13.8.3: Get "https://registry-1.docker.io/v2/bitnamicharts/zookeeper/manifests/13.8.3": dial tcp: lookup registry-1.docker.io: i/o timeout
❌ Error: Failed to get values for chart 'bitnami/zookeeper'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: bitnami/zookeeper

--- Chart Processing: bitnami/kafka ---
🎨 Extracting images from Helm chart: bitnami/kafka (repo: bitnami, chart: kafka, version: latest)
Error: failed to resolve registry-1.docker.io/bitnamicharts/kafka:32.2.15: Get "https://registry-1.docker.io/v2/bitnamicharts/kafka/manifests/32.2.15": dial tcp: lookup registry-1.docker.io: i/o timeout
❌ Error: Failed to get values for chart 'bitnami/kafka'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: bitnami/kafka

--- Chart Processing: jetstack/cert-manager ---
🎨 Extracting images from Helm chart: jetstack/cert-manager (repo: jetstack, chart: cert-manager, version: latest)
Error: Get "https://charts.jetstack.io/charts/cert-manager-v1.18.0.tgz": dial tcp: lookup charts.jetstack.io on 8.8.8.8:53: read udp 192.168.27.97:44144->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'jetstack/cert-manager'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: jetstack/cert-manager

--- Chart Processing: elastic/eck-operator ---
🎨 Extracting images from Helm chart: elastic/eck-operator (repo: elastic, chart: eck-operator, version: latest)
Error: Get "https://helm.elastic.co/helm/eck-operator/eck-operator-3.0.0.tgz": dial tcp: lookup helm.elastic.co on 8.8.8.8:53: read udp 192.168.27.97:44128->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'elastic/eck-operator'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: elastic/eck-operator

--- Chart Processing: elastic/kibana ---
🎨 Extracting images from Helm chart: elastic/kibana (repo: elastic, chart: kibana, version: latest)
Error: Get "https://helm.elastic.co/helm/kibana/kibana-8.5.1.tgz": dial tcp: lookup helm.elastic.co on 8.8.8.8:53: read udp 192.168.27.97:40829->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'elastic/kibana'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: elastic/kibana

--- Chart Processing: elastic/elasticsearch ---
🎨 Extracting images from Helm chart: elastic/elasticsearch (repo: elastic, chart: elasticsearch, version: latest)
Error: Get "https://helm.elastic.co/helm/elasticsearch/elasticsearch-8.5.1.tgz": dial tcp: lookup helm.elastic.co on 8.8.8.8:53: read udp 192.168.27.97:60199->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'elastic/elasticsearch'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: elastic/elasticsearch

--- Chart Processing: grafana/loki ---
🎨 Extracting images from Helm chart: grafana/loki (repo: grafana, chart: loki, version: latest)
Error: Get "https://github.com/grafana/helm-charts/releases/download/helm-loki-6.30.1/loki-6.30.1.tgz": dial tcp: lookup github.com on 8.8.8.8:53: read udp 192.168.27.97:43681->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'grafana/loki'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: grafana/loki

--- Chart Processing: grafana/promtail ---
🎨 Extracting images from Helm chart: grafana/promtail (repo: grafana, chart: promtail, version: latest)
Error: Get "https://github.com/grafana/helm-charts/releases/download/promtail-6.17.0/promtail-6.17.0.tgz": dial tcp: lookup github.com on 8.8.8.8:53: read udp 192.168.27.97:41775->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'grafana/promtail'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: grafana/promtail

--- Chart Processing: prometheus-community/kube-prometheus-stack ---
🎨 Extracting images from Helm chart: prometheus-community/kube-prometheus-stack (repo: prometheus-community, chart: kube-prometheus-stack, version: latest)
Error: Get "https://github.com/prometheus-community/helm-charts/releases/download/kube-prometheus-stack-73.2.0/kube-prometheus-stack-73.2.0.tgz": dial tcp: lookup github.com on 8.8.8.8:53: read udp 192.168.27.97:34071->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'prometheus-community/kube-prometheus-stack'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: prometheus-community/kube-prometheus-stack

--- Chart Processing: hashicorp/consul ---
🎨 Extracting images from Helm chart: hashicorp/consul (repo: hashicorp, chart: consul, version: latest)
Error: Get "https://helm.releases.hashicorp.com/consul-1.7.1.tgz": dial tcp: lookup helm.releases.hashicorp.com on 8.8.8.8:53: read udp 192.168.27.97:60331->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'hashicorp/consul'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: hashicorp/consul

--- Chart Processing: argo/argo-cd ---
🎨 Extracting images from Helm chart: argo/argo-cd (repo: argo, chart: argo-cd, version: latest)
Error: Get "https://github.com/argoproj/argo-helm/releases/download/argo-cd-8.0.17/argo-cd-8.0.17.tgz": dial tcp: lookup github.com on 8.8.8.8:53: read udp 192.168.27.97:34684->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'argo/argo-cd'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: argo/argo-cd

--- Chart Processing: kong/kong ---
🎨 Extracting images from Helm chart: kong/kong (repo: kong, chart: kong, version: latest)
Error: Get "https://github.com/Kong/charts/releases/download/kong-2.49.0/kong-2.49.0.tgz": dial tcp: lookup github.com on 8.8.8.8:53: read udp 192.168.27.97:45400->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'kong/kong'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: kong/kong

--- Chart Processing: kiali/kiali-server ---
🎨 Extracting images from Helm chart: kiali/kiali-server (repo: kiali, chart: kiali-server, version: latest)
Error: Get "https://kiali.org/helm-charts/kiali-server-2.11.0.tgz": dial tcp: lookup kiali.org on 8.8.8.8:53: read udp 192.168.27.97:50669->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'kiali/kiali-server'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: kiali/kiali-server

--- Chart Processing: traefik/traefik ---
🎨 Extracting images from Helm chart: traefik/traefik (repo: traefik, chart: traefik, version: latest)
Error: Get "https://traefik.github.io/charts/traefik/traefik-36.1.0.tgz": dial tcp: lookup traefik.github.io on 8.8.8.8:53: read udp 192.168.27.97:38216->8.8.8.8:53: i/o timeout
❌ Error: Failed to get values for chart 'traefik/traefik'. This could be due to network issues, chart not found, or invalid version. 🛑
Skipping image extraction for chart due to error: traefik/traefik
./scripts/automate-helix-setup_v2-0-3.sh: line 479: ALL_HELM_IMAGES: unbound variable
angel@CyBeard:~/HELIX$
angel@CyBeard:~/HELIX$ helm upgrade --install redis bitnami/redis \
  --version 21.2.3 \
  --namespace helix-infra \
  --create-namespace \
  --set image.registry="localhost:5000" \
  --set image.repository="bitnami/redis" \
  --set image.tag="8.0.2-debian-12-r0" \
  --set architecture="standalone" \
  --set auth.enabled=false \
  --set persistence.enabled=true \
  --set persistence.size=8Gi