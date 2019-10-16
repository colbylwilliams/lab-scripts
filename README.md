# Azure Lab Services Scripts

Configuration scripts to simplify common tasks on Lab Services VMs.

# Ubuntu

These scripts work for both 16.04 LTS and 18.04 LTS.  They will likely work for other versions, but are untested.

## X2Go

[X2Go](https://wiki.x2go.org/doku.php/doc:newtox2go) is a Remote Desktop solution, which some vendors vaguely call Remote Control. This is not to be confused with Microsoft Remote Desktop Connection, which is a competing Remote Desktop solution and protocol.

**_X2Go is the recommended Remote Desktop solution for Linux VMs in Azure Lab Services. It provides the smoothest and most performant experience._**

Using X2Go requires three steps: _(If you're a student with a Lab VM that already has X2Go installed, skip the first step)_

1. [Install the X2Go server](#install-x2go-server) on the Lab (template) VM using one of the three scripts below.
2. [Install the X2Go client](#install-x2go-client) software on your local machine to connect to the remote VM.
3. [Create an X2Go session](#create-x2go-session) in the X2Go client to connect to your Lab (remote) VM.

### Install X2Go Server

The machine that runs the X2Go server would be called the remote machine. Applications / session are started on this remote machine and the applications transfer their windows / desktops to the client.

The scripts below will automatically install the X2Go server and the Linux desktop software.  Just SSH into the Lab VM and paste in one of the following scripts depending on which desktop software you prefer:

##### Install MATE Desktop & X2Go Server

```bash
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/colbylwilliams/lab-scripts/master/ubuntu/x2go-mate.sh)"
```

##### Install XFCE4 Desktop & X2Go Server

```bash
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/colbylwilliams/lab-scripts/master/ubuntu/x2go-xfce4.sh)"
```

##### Install Xubuntu Desktop & X2Go Server

```bash
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/colbylwilliams/lab-scripts/master/ubuntu/x2go-xubuntu.sh)"
```

### Install X2Go Client

Once you have the X2Go server running on your Ubuntu VM (using the scripts above), you'll use the X2Go client to remotely connect to the VM. The X2Go Client is the application that allows one to connect to a remote server and display a graphical desktop / application on the client machine.

Instructions for installing the X2Go client can be found [here](https://wiki.x2go.org/doku.php/doc:installation:x2goclient).

Once you've installed the X2Go client, you'll need to **create a new session** to connect to your Lab VM.

### Create X2Go Session

First, you'll need to get the connection details for your Lab VM:

- **Instructors** (template) VM: Go to the [Lab Services portal](https://labs.azure.com/), select your Lab, select **_Customize template_** on the _Template_ tab, then select **_SSH_**
- **Students**: Go to the [Lab Services portal](https://labs.azure.com/virtualmachines), select the **_Connect_** icon on your Lab VM, then select **_SSH_** (note: you may need to start your VM if it isn't already running)

The connection details will look something like this:

```bash
ssh -p 12345 student@ml-lab-00000000-0000-0000-0000-000000000000.eastus2.cloudapp.azure.com
```

Once you have these connection details, open the X2Go client app and **create a new Session**.

Fill in the following values in the Session Preferences pane _(replacing the values from the example above with the values from your own connection details)_:

- **Session name**: This can be whatever you want, but I recommend using the name of your Lab VM
- **Host**: `ml-lab-00000000-0000-0000-0000-000000000000.eastus2.cloudapp.azure.com`
- **Login**: `student`
- **SSH port**: `12345`
- **Session type**: Select `MATE` or `XFCE` depending on which Desktop/script you installed. _(If you chose Xubuntu, select `XFCE`)_
- **Select _OK_.**

**_Note: When creating a new X2Go session, make sure to use the SSH port NOT the RDP port._**
