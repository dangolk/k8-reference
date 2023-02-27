# Log in to worker node 1.
Create a directory and a file with some data on worker node 1.
```
sudo mkdir /etc/hostPath
echo "This is worker 1!" | sudo tee /etc/hostPath/data.txt
```

# Log in to worker node 2.
Create a directory and a file with some data on worker node 2.
```
mkdir /etc/hostPath
echo "This is worker 2!" | sudo tee /etc/hostPath/data.txt
```
