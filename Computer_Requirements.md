# Computer Requirements

By using LINUX, and other tools that will be mentioned in this class, on your own computer, you can more quickly incorporate what you learn into your own research. Before coming to the first class, please ensure you have done Steps 1, 2, and 3 below. We will work on Step 4 in class …

1. Select a computer to use in the class
2. Learn how to open the terminal on your computer
3. Download a text editor
4. Request an Alpine user account

---

## 1. Select a computer to use in the class

You will need to have either a MAC laptop, a laptop running Windows 11 (ideally with a Linux subsystem installed), or a Linux laptop. CSU will no longer be supporting laptops running Windows versions less than 11 or MAC laptops running on OS less than Ventura on their internet for security purposes. If you don't have a MAC, Windows, or Linux laptop, please obtain one! There are laptops available for rental through the [Morgan Library](https://lib.colostate.edu/services/borrow-renew/borrowing-laptops/). Check that same link for laptop rentals available through each college. Your graduate program, department, or lab may have laptops to borrow also.

If your laptop is very slow or near dying, please consider borrowing a laptop for the class.

The computer should be a laptop. **A tablet or iPad is not going to cut it!**

## 2. Download and install all required software

You will need ...

1. a text editor (see below)
2. R and R Studio (see below)
3. [IGV](https://igv.org/doc/webapp/) (optional, see below) or create an account on [Galaxy](https://usegalaxy.org/) (optional)

### 1. text editor 

Everyone will need to install a [text editor](https://en.wikipedia.org/wiki/Text_editor) for writing and modifying plain text files. 

- Mac:
  - Recommend [BBEdit](https://www.barebones.com/products/) or [Xcode](https://xcodereleases.com/). Click Download under the BBEdit software. You dont need to buy it. The free version does everthing you need.
- Windows 11:
  - Recommend [Notepad++](https://notepad-plus-plus.org/), BBEdit, or [Visual Studio Code](https://code.visualstudio.com/download) do not recommend TextEdit, Wordpad, Notebook, EMACS, or Microsoft Word.
  - If you already have a text editor you like that is not listed, you are free to use it provided it saves files in true flat .txt and not rich text format.
- We do not recommend TextEdit, Wordpad, Notebook, or Microsoft Word. You are free to use vim or emacs if you are already familar with those interfaces, but they are beyond the scope of this course. 

### 2. R and RStudio

For the second half of the class, we will use Rstudio.

#### MAC USERS

**MAC: To install R**

Open an internet browser and go to www.r-project.org.
Click the “download R” link in the middle of the page under “Getting Started.”
Select a USA CRAN location (a mirror site) and click the corresponding link.
Click on the “Download R for (Mac) OS X” link at the top of the page.
Click on the file containing the latest version of R under “Files.”
Save the .pkg file, double-click it to open, and follow the installation instructions.
Now that R is installed, you need to download and install RStudio.










Learn how to open the terminal on your computer

What is a terminal or command line interface? 

It should look something like this:

<p align="center">
<img width="410" alt="terminal" src="https://github.com/jesshill/CSU-2025FA-DSCI-510-001_LINUX_as_a_computational_platform/blob/main/Images/terminal.png">
</p>

Here are the options for accessing a terminal on different systems. Again, please verify you can access your terminal before class:

### Mac OS users 

Lucky you! Your Mac runs on a Linux-like operating system. All you need to get running is to familiarize yourself with the **Terminal** application.

1. Go to **Finder**
2. Go to **Applications**
3. Go to **Utilities**
4. Click on **Terminal** to open the application
5. For faster access, you can drag and drop **Terminal** into your Dock.

To bump your Mac into power user mode, you'll need **Xcode**. To obtain Xcode …

- Go to App Store
- Search for Xcode
- Download and install Xcode. This will take a while to download and install. It may be a good idea to do this overnight.

### Windows OS users

Your PC needs to be running Windows 11 (becuase of CSU internet security policy). You can install Linux on top of the Windows operating system. 

**1.)** Please read [Install the Linux Subsystem on Windows 11](https://learn.microsoft.com/en-us/windows/wsl/install) to install the system. Opt for UBUNTU distribution (not LTS) if/when you have a choice.

When complete, you'll be asked for a username and password specific to your Ubuntu installation. These don't need to be the same as your Windows 11 credentials. With this step complete, you'll find yourself at the Ubuntu bash command line.

- Tips for installation
  - Don't forget your username and password for ubuntu! Write it down. You'll need it for the class!!!
Having trouble getting the `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux` line to execute? Make sure you are in a PowerShell with Administrator privileges (aka, an elevated powershell). To open one, search PowerShell in the windowsStart search bar, then RIGHT click on powershell, then select “Run as Administrator”

**2.)** Alternatively, you can go into your "Start Menu", search Ubuntu, you will see it pop up under the "Store" section, you can then click on the "right side arrow" and you will see "Get" pop up. You can click "Get" to download and install the software. 

### Linux Distro users

If you have a laptop that is running a Linux distro natively, you are all set to go. To access the terminal, search the DASH for Terminal. Click on the Terminal icon to open the application.

### None of this is working for me

If you can't access a terminal, please contact me prior to class! I will be available to help you troubleshoot.

## 3. Download a text editor

Everyone will need to install a [text editor](https://en.wikipedia.org/wiki/Text_editor) for writing and modifying plain text files. 

- Mac:
  - Recommend [BBEdit](https://www.barebones.com/products/) or [Xcode](https://xcodereleases.com/). Click Download under the BBEdit software. You dont need to buy it. The free version does everthing you need.
- Windows 11:
  - Recommend [Notepad++](https://notepad-plus-plus.org/), BBEdit, or [Visual Studio Code](https://code.visualstudio.com/download) do not recommend TextEdit, Wordpad, Notebook, EMACS, or Microsoft Word.
  - If you already have a text editor you like that is not listed, you are free to use it provided it saves files in true flat .txt and not rich text format.

## 4. Request an Alpine user account

We will be using the **RMACC ALPINE Supercomputer** for the last week of the course.

Let's register for an Alpine Account. You must have a valid CSU NetID and Duo two-factor authentication enabled to apply for an account on Alpine through CSU.

To get started, let's request an Alpine account at the [CU-Boulder account request page](https://rcamp.rc.colorado.edu/accounts/account-request/create/verify/csu). Follow instructions below:

- Enter your CSU eID. This is the nickname before your @colostate.edu email.
- Enter in your CSU eID password, a comma, and then a DUO authentication code. That is, in the password field, type your CSU NetID password, then a comma, then the word “push” or the DUO key generated by your device. For example, if your password was ilovealpine and your DUO key is 123456, you would type:
```
ilovealpine,push
```
OR
```
ilovealpine,123456
```
- Check the box next to “I would like to run high-performance compute jobs on the RMACC Alpine Cluster” (see example below). Otherwise, you will not be added to csu-general.

<p align="center">
<img width="410" alt="req-research-computing-acct" src="https://github.com/jesshill/CSU-2025FA-DSCI-510-001_LINUX_as_a_computational_platform/blob/main/Images/req-research-computing-acct.png">
</p>

- When prompted for a description of your research, write a brief description of your own research or simply state that you are in the DSCI 510 LINUX course.
- Check the box stating that you are enrolled in a course that requires access to Research Computing resources.
- After submitting the form, you will receive an account confirmation email from CU-Boulder.
- You're all set!

**If you are having trouble with this, we can do it together once the class begins!**

Back to [The Terminal](Modules/Week1/1-2_The_Terminal.md)
