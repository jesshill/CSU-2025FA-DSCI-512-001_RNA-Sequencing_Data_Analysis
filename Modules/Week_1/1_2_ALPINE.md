# ALPINE

We will do most of our work in this class on the ALPINE supercomputer system. We are doing this for a few reasons ...

1. Everyone will be on the same platform (no Mac v. PC issues)
2. We can do things really fast by using the power of the supercomputer system
3. You will be trained and ready to go on ALPINE for your large-scale projects!

ALPINE is an example of a **High-Performance Computing system** or HPC. HPC is a means of performing large computational tasks on **supercomputers** or **compute clusters** in a way that takes advantage of their ability to perform multiple tasks simultaneously.

**Supercomputers** in the crudest terms are basically what happens if you glued 100's or 1000's of individual computers together. You end up making a giant computer with more functionality.

**ALPINE** is a joint venture between Colorado State University and CU Boulder and is sponsored by those institutes and by a grant from the National Science Foundation. ALPINE is shared between CU Boulder, Colorado State University, CU Anschutz, and RMACC (Rocky Mountain Advanced Computing Consortium, a network of >20 other academic institutions in Colorado, Arizona, Idaho, Montana, and New Mexico).

However, please keep in mind that a supercomputer isn't required for RNA-seq data analysis. Most of these tasks can be done on a personal MAC or LINUX computer. PCs can also theoretically do the same tasks but it will be much more challenging to install the software.

Today, we will do the following together ...

1. Register for ALPINE if you haven't already
2. Log into ALPINE using OnDemand - see how many students can do this
3. Review some concepts about ALPINE

Thursday, we will ...

1. Review the ALPINE High Performance Compute System
2. Initiate a “conda virtual environment” where we can install RNA-seq software
3. Install software within our conda environment

---

### Connecting to remote computers

Up to this point, we have only used the terminal to interact with your **local** computer. Today we will talk about several ways we can use the terminal to interact with **remote** computers over the internet.

In some instances, we will **log into** a remote computer, also known as **connecting** to it. This will allow us to interact with that computer as if we had opened its terminal. With this access, we could navigate that computer's file structure, write new files, run jobs, or transfer files. It would be just like interacting with our local computer.

This differs slightly from **transferring files** between the remote computer and our local computer. We transferred files from UCSC Genome Browser to our local computer. In that instance, UCSC Genome browser set up a special **public-facing, read-only** directory of files that we could copy over to our computer but we wouldn't be able to write files there or run commands there.

What types of remote computers can we log into?

```
1. remote personal computers
2. servers or repositories (computing or file storage)
3. supercomputers
```

### Accessing remote computers with ssh - Secure SHell

**ssh usage**

```
ssh <addressOfRemoteServer>

ssh [-l <yourloginname>] <addressOfRemoteServer> #that's a lower case “L”
```

**!!! Exercise:** Try logging into Alpine using **ssh** 

The login address for ALPINE is: `login.rc.colorado.edu`

If your username is `loki@colostate.edu`, and your password is `godofmischief`, you would log in like so:

```
$ssh -l loki@colostate.edu login.rc.colorado.edu
Password: godofmischief,push
# Switch to your DUO app on your phone to approve
```

**!!! that's a lower case "L"**

**!!! Replace your eID e-mail with loki@colostate.edu**

**!!! You won't see anything pop up when you type your password**

**!!! If `,push` doesnt work, try `,phone` or the 6-digit code on your DUO app (refreshes every 20 seconds)**

**!!! Exercise:** Make a file.
- Use nano to create a file called `iwashere.txt`
- Write a little note

### Accessing ALPINE using OnDemand

The team at CU Boulder who developed ALPINE have helped to create an alternative way to interact with the ALPINE Supercomputer, one that can happen in you internet browser like Chrome or Firefox. This method of accessing ALPINE is called OnDemand.

**!!! Exercise:** Let's practice accessing ALPINE using **OnDemand** together.

- Navigate to [OnDemand](https://ondemand-rmacc.rc.colorado.edu/pun/sys/dashboard) in a new tab or window
  - For me, I right click on the above link and select **Open Link in New Window**
  - You will be asked to select an identity provider using a pull-down menu. Select on the pull-down menu (it may say **ORCID**). Start typing **Colorado State University**. Click on **Remember** and log in. It should look like this

<p align="center">
<img width="410" alt="login" src="https://github.com/jesshill/CSU-2025FA-DSCI-510-001_LINUX_as_a_computational_platform/blob/main/Images/login_window.png">
</p>

Next steps:
- Log into your CSU NET ID. You will receive a DUO PUSH on your phone. Accept it.
- To access the LINUX command line on ALPINE, go to the **Clusters** menu. Select **>_Alpine Shell**
- In another window, you can also access your files by going to the **Files** menu and selecting any available directories.
