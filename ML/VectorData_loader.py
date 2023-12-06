from torchvision import datasets
import numpy as np
import torch
from torch.utils.data.dataset import Dataset
from torch.utils.data import DataLoader


class VectorDataset(Dataset):
    def __init__(self, data):
        super(VectorDataset, self).__init__()
        
        self.data = data
        self.data_len = data.size(0)
        
        
    def __getitem__(self, index):
        return self.data[index]

    def __len__(self):
        return self.data_len
    
    
class VectorInOutDataset(Dataset):
    def __init__(self, data_in, data_out):
        super(VectorInOutDataset, self).__init__()
        
        self.data_in = data_in
        self.data_out = data_out
        self.data_len = data_in.size(0)
        
    def __getitem__(self, index):
        return (self.data_in[index], self.data_out[index])

    def __len__(self):
        return self.data_len


def get_vectordata_and_loader(data, batch_size, sampling_weights=[]):
    dataset = VectorDataset(data)
    if sampling_weights != []:
        sampler = torch.utils.data.sampler.WeightedRandomSampler(sampling_weights, len(sampling_weights))
        loader = DataLoader(dataset, batch_size=batch_size, sampler = sampler)
    else:
        loader = DataLoader(dataset, batch_size=batch_size)
#     loader = DataLoader(dataset, batch_size=batch_size, sampler = sampler, pin_memory=True)
    
    return dataset, loader
        
