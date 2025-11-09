#!/bin/bash
set -e

# Step 1: Download and extract CIFAR-10 binary
echo "Downloading CIFAR-10..."
wget https://www.cs.toronto.edu/~kriz/cifar-10-binary.tar.gz
echo "Extracting CIFAR-10..."
tar -xzvf cifar-10-binary.tar.gz

# Step 2: Create repository structure
REPO_NAME="cifar10-dataset"
mkdir -p $REPO_NAME/data
echo "Copying files to data directory..."
cp cifar-10-batches-bin/* $REPO_NAME/data/

# Step 3: Add README.md
cat << EOF > $REPO_NAME/README.md
# CIFAR-10 Binary Dataset

This repository stores the official CIFAR-10 binary dataset.

- **Source:** https://www.cs.toronto.edu/~kriz/cifar.html
- **Format:** Binary batch files (.bin)
- **Usage:** Compatible with PyTorch and other ML frameworks.

## Files
- data_batch_1.bin
- data_batch_2.bin
- data_batch_3.bin
- data_batch_4.bin
- data_batch_5.bin
- test_batch.bin
- batches.meta.txt

## How to use (PyTorch example)
\`\`\`python
from torchvision.datasets import CIFAR10

dataset = CIFAR10(root='data', train=True, download=False)
\`\`\`

For details, refer to [the official documentation](https://www.cs.toronto.edu/~kriz/cifar.html).
EOF

# Step 4: Git init, commit
cd $REPO_NAME
git init
git add data README.md
git commit -m "Add official CIFAR-10 binary dataset"

echo "======================================================="
echo "Local git repository initialized in $(pwd)"
echo "If you haven't created a GitHub repo yet, do it at:"
echo "    https://github.com/new"
echo "Then, run the following commands to push (replace YOUR_USERNAME and YOUR_REPONAME):"
echo "-------------------------------------------------------"
echo "git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPONAME.git"
echo "git branch -M main"
echo "git push -u origin main"
echo "======================================================="