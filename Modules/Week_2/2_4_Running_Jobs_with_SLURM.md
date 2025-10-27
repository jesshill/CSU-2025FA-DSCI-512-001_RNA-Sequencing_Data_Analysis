# Overview of Running Jobs with SLURM 

## Resources

- Research Computing at Boulder - [Guide to running batch jobs](https://curc.readthedocs.io/en/latest/running-jobs/batch-jobs.html)
- Researcg Computing at Boulder - [Guide to SLRUM directives](https://curc.readthedocs.io/en/latest/running-jobs/job-resources.html)
- SCHEDMD - [Guide to SLURM](https://slurm.schedmd.com/reservations.html#:~:text=Reservation%20Use&text=This%20name%20is%20automatically%20generated,completely%20within%20the%20named%20reservation.)

## A review of vocabulary words

- **High-Performance Computing (HPC):** this is the field of computing that uses **supercomputers**, **compute clusters**, or **servers** to solve computational tasks. It is most often used in STEM research fields but has also expanded to business and industry fields.
- **Supercomputers** and **compute clusters:** are both architectures of computers in which multiple, small computers are stitched together so they function as a single, big computer. Differ in their scale with the supercomputer term being used for larger systems.
- **Servers:** this is another catch-all term that can also refer to a compute cluster (of varying sizes, some are small) but implies that the system is hosting some function for users.

## The ALPINE System: 

<p align="center">
<img width="700" alt="alpine map" src="https://github.com/jesshill/CSU-2025FA-DSCI-512-001_RNA-Sequencing_Data_Analysis/blob/main/Images/alpine_map.jpg">
</p>

### Where do we run jobs when we are working on ALPINE?

- For small jobs (single node) - these can run directly from the command line
- Try to avoid running jobs on the **login node**
  - acompile node is not a login node
- For larger jobs, we submit the job to a **compute node**

### How do we submit a job to the compute node?

- We use the **job scheduler** called **SLURM**
- A [job scheduler](https://en.wikipedia.org/wiki/Job_scheduler) is a specialized piece of software used in **High Performance Computing** to send jobs to specialized nodes. 

### Wait, what is a node again?

- **Nodes** are the individual, small computing units of which a supercomputer is comprised. Individual nodes are like mini-computers, each with its own CPUs, memory, and a bit of storage space.
- **Types of Compute Nodes** - Compute nodes are the nodes on the ALPINE system where we run jobs. They come in a few different types - **GPU** (graphical processing units), **HighMEM** (high memory nodes), and **Haswell** (typical, garden-variety, CPU)
- **Node design** - Each compute node can support multiple tasks. These tasks are referred to as either **processes** or **threads** or **cores**. This is similar to having a quad-CPU in your laptop that can support 4x processes at a time. The Haswell Nodes on ALPINE can support up to 24 processes. On ALPINE, each compute node will support 64 processes.

## Quick SLURM Intro 

The job sharing utility that is installed on ALPINE is called **SLURM** and we use it by writing and executing **batch scripts**. Batch scripts are just specialized bash scripts that are executed using the command `sbatch`. Batch scripts do everything that bash scripts do, but in addition, they request a certain amount of the supercomputer for use and request a certain amount of time on that hardware. When we execute batch scripts, they don't run right away. Instead, they get in the queue and are assigned to a node based on the requested hardware, requested time, and availability.

**!!! Exercise:** Follow along. Let's do some SLURM practice.

- First, let's navigate to the space `/scratch/alpine/$USER`
- Let's make a new directory called `test_slurm`
- `cd` into the `test_slurm` sub-directory
- Next, let's make a practice shell script.
- Start a file called using `$ touch testscript.sh`
- Open `testscript.sh` by navigating to DASHBOARD, FILES, and editing the file. OR you can use nano.

### Write the following code into `testscript.sh`

```
#!/usr/bin/env bash
 
echo "hello"
sleep 30
echo "world"
sleep 30
```

This script is run with the command:

```
$ bash testscript.sh
```

OK, this feels familiar. The script prints Hello, waits 30 seconds, then prints world, then waits 30 seconds.

To run jobs using SLURM, we take a typical `.sh` script and convert it to an `.sbatch` script. To turn a bash script into an sbatch script we just need to do a few things...

1. change the file extension
2. add directives
3. execute with the command `$ sbatch <yourscript.sbatch>`

Sbatch scripts look like so...

```
#!/bin/usr/env bash
 
## Directives go here...
#SBATCH <SLURM commands>
#SBATCH <SLURM commands>
#SBATCH <SLURM commands>
#SBATCH <SLURM commands>
#SBATCH <SLURM commands>
#SBATCH <SLURM commands>
 
## Software is loaded here...
module purge
module load <desired software>
 
## Your regular old shell script goes here...
echo "hello"
sleep 30
echo "world"
sleep 30
```

**!!! Exercise:** Copy the `.sh` script into an `.sbatch` script called `testscript.sbatch`

```
$ cp testscrip.sh testscript.sbatch
```

**!!! Exercise:** open `testscript.sbatch` in a text editor and convert it to an `.sbatch` script by adding the following directives:

```
#!/usr/bin/env bash
 
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=0:1:30
#SBATCH --partition=atesting
#SBATCH --output=sample-%j.out
 
## Software is loaded here...
module purge
 
## Code
echo "hello"
sleep 30
echo "world"
sleep 30
```

Submit this script to the SLURM job scheduler using this command:

```
$ sbatch testscript.sbatch
```

Use the following commands to interact with the progress of your script:

```
$ squeue -u $USER    # to see all the scripts you, the user, are running
$ sacct -u $USER              # See some stats about running or previously run jobs
$ sacct -X --format JobID, JobName,AllocCPUS,State,ExitCode,Elapsed,TimeLimit,Submit,Start,End  # A nicely formatted status output
$ scancel <jobID#>   # to cancel a script
```

Do you see a log file that was created? Peek into it to explore it.

**???** What just happened? 

**???** What do all the #SBATCH lines mean? 

Everything after an `#SBATCH` is a **SLURM directive**. Think of these like **options**. You're telling SLURM details about how you want your script to be run.

```
#SBATCH --nodes=1   <-- Requests 1 node
#SBATCH --ntasks=1  <-- Requests 1 core (can be up to 64 per single node)
#SBATCH --time=0:1:30   <-- Requests 1 minute & 30 seconds of time. Job will stop then
#SBATCH --partition=atesting  <-- Requests a "testing partition"
#SBATCH --output=sample-%j.out <-- saves the output in a file named sample-%j.out where %j is a variable where the job number will output
```

More info: 
- Research Computing at Boulder - [Guide to running batch jobs](https://curc.readthedocs.io/en/latest/running-jobs/batch-jobs.html)
- Research Computing at Boulder - [Guide to SLURM directives](https://curc.readthedocs.io/en/latest/running-jobs/job-resources.html) 

## Making SLURM easier to use

Because the `squeue -u $USER` command is cumbersome to type, let's make some aliases of shortcut commands.

**!!! Exercise:** Let's navigate to our home directory and add some aliases to our `.bashrc` file

```
# cd with no argument returns you to your home directory
$ cd 
$ pwd
```

Go to the DASHBOARD. Select FILES. Edit the file `.bashrc`

Copy and paste the following lines of code to the end of the `.bashrc` file:

```
#Alises
alias scheck="squeue -u $USER"
alias sa='sacct -X --format JobID,JobName,AllocCPUS,State,ExitCode,Elapsed,TimeLimit,Submit,Start,End'
alias suser="sacct -u $USER"
```

- Save the file
- Close it
- Return to the prompt and the home directory
- To activate your new `.bashrc`, source it...

```
$ source .bashrc
```

Now test your new aliases: 

```
$ scheck
$ sa
$ suserc
```

**!!! Exercise:** Try running 














