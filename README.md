# acme-tbs-trial

Refer to https://github.com/matthewmcnew/kpdemo for installing visualizing the changes done by the build service process

## Stack Update

1. Navigate to the kpack web UI and mark the current stack (run image) as 'vulnerable'.

Copy the truncated stack digest from from one of the existing images in the visualization.
Click on Setup in the top right corner.
Paste the stack (run image) Digest into the Modal.
Click Save.
You should see the images with that run image highlighted in red.

2. Push an updated stack (Run Image) with kpdemo update-stack. OR
  if you have Tanzu Build Service installed -
    fetch the latest dependencies from Tanzu network and 
   ```
   kp clusterstack update <stack> 
   ```
3. Navigate to the Web UI in your browser to watch kpack rebase all the images that used the previous stack (run image).

## Buildpack update

1. Navigate to the kpack web UI and mark a buildpack id & version as 'vulnerable'.

Copy the current backpack ID & Version for from one of the existing images in the visualization.
Click on Setup in the top right corner.
Paste the Buildpack ID & Version into the Modal.
Click Save.
You should see the images that were built with that buildpack highlighted in red.

2. Push an Updated Backpack

The kpdemo update-buildpacks --buildpack <buildpack> will create a new buildpack and add it to the kpack buildpack store. Kpack will rebuild "out-of-date" images with the new buildpack.

```
kpdemo update-buildpacks --buildpack tanzu-buildpacks/nodejs@1.6.0
```
OR
if you have Tanzu Build Service installed -
    fetch the latest dependencies from Tanzu network and 
   ```
   kp import -f <latestdependency-descriptor>.yaml  (updates all the latest build and run images)

   ```
   
   ```
   kp clusterstore add <store-name> -b <buildpackage-1> -b <buildpackage-2>  ( specific buildpacks)

   ```
3. Navigate to the Web UI in your browser to watch kpack rebuild all the images that used the previous buildpack.


    
