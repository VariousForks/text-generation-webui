#!/bin/bash

function dwn_hf_model() {
    python download-model.py "$1"
}

for model in facebook/opt-1.3b ; do
    echo "Downloading $model..."
    dwn_hf_model "$model"
done
