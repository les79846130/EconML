import numpy as np

class Node:
    """Building block of `CausalTree` class.

    Parameters
    ----------
    sample_inds : array-like, shape (n, )
        Indices defining the sample that the split criterion will be computed on.

    estimate_inds : array-like, shape (n, )
        Indices defining the sample used for calculating balance criteria.

    """

    def __init__(self, sample_inds, estimate_inds):
        self.feature = -1
        self.threshold = np.inf
        self.split_sample_inds = sample_inds
        self.est_sample_inds = estimate_inds
        self.estimate = None
        self.left = None
        self.right = None

    def find_tree_node(self, value):
        if self.feature == -1:
            return self
        elif value[self.feature] < self.threshold:
            return self.left.find_tree_node(value)
        else:
            return self.right.find_tree_node(value)
