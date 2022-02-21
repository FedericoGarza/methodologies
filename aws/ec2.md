# Steps to connect to an EC2 instance and work with `nbdev` on it

1. Request the instance's `ip`, the `username` and the `.pem` file.
2. Open your terminal and connect to the EC2 instance using:
```
ssh -i /path/to/pem/file.pem username@ip
```
If a permission error arises use `chmod 400 /path/to/pem/file.pem`.

3. Install conda using:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda && \
rm -rf Miniconda3-latest-Linux-x86_64.sh && \
source $HOME/miniconda/bin/activate && \
conda init
```

4. Restart your login using `logout` and then step 2.

5. Download the repository (maybe you need to install git).

6. Create the conda environment.

7. Open a notebook. By default it will run in the 8888 port of the EC2 instance. Copy the url printed by the notebook.

8. Now you need to create a tunnel between your local computer and the EC2 instance. Use:

```
ssh -NfL localhost:8888:localhost:8888 username@ip -i /path/to/pem/file.pem
```

9. Finally paste in your local browser the url copied in 7. Now you have access to a notebook running on the EC2 instance.
