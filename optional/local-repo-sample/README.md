This files can be used to test initial bootup of a container when configured
with two custom repositories. This particulalar setup assumes that a local
repository containing the feature and components associated with 
[this](https://github.com/d-smith/offline-repo-sample) 
project have been built and the repository mapped to a shared file
via vagrant settings, e.g.

    config.vm.synced_folder "/Users/username/code/offline-repo-sample/custom-repo/target/features-repo", "/repos/features-repo"

The second repository provides the common xtrac dependencies and feature binaries.

To try it out, copy the config files and jetty.xml into the Fuse etc directory prior to starting Fuse. A default activemq.xml file that uses kahadb on the local file system is also provided for convenience. The jetty configuration removes the host name from the jetty config to avoid binding to the guest OS 'internal' network to simplify port forwarding from the host OS to the guest OS.
