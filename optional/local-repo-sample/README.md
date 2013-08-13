This files can be used to test initial bootup of a container when configured
with a local repository. This particulalar setup assumes that a local
repository containing the feature and components associated with 
[this](https://github.com/d-smith/offline-repo-sample) 
project have been built and the repository mapped to a shared file
via vagrant settings, e.g.

    config.vm.synced_folder "/Users/a045103.dmn1/code/offline-repo-sample/custom-repo/target/features-repo", "/repos/features-repo"

To try it out, copy the two config files into the Fuse etc directory prior to starting Fuse.
