
def apply_sorted_numerical_threshold(value_list, threshhold):
    """
    Separates the animation times for the given object and its descendants into chunks based on a threshold.
    Threshold determines how many empty frames there should be before separating a piece of animation

    Parameters
    ----------
    object : str
        The scene object name to get the partitions for

    Returns
    -------
    list[ list[ int, int ] ]
        A list holding lists of frame partition ranges

    """

    numerical_partition = []

    _current_partition_start_point = value_list[0]
    for i, value in enumerate(value_list):
        _previous_value = value_list[i - 1] if i > 0 else value
        _current_value = value

        _threshold_cutoff = _previous_value + threshhold

        if _current_value >= _threshold_cutoff or _current_value == value_list[-1]:
            _partition = [_current_partition_start_point, _previous_value]
            _current_partition_start_point = _current_value

            if _current_partition_start_point != _previous_value:
                numerical_partition.append(_partition)

    return numerical_partition


def kill_duplicate_list_elements(_list):
    _new_list = []

    for element in _list:
        if element not in _new_list:
            _new_list.append(element)

    return _new_list


def reduce_float_list(float_list, threshold):
    """
    Reduces the size of a sorted float list. The given threshold will be a float value that identifies the
    closest two flaot values can be to each other in value before on of the is reduced
    Parameters
    ----------
    float_list
    threshold

    Returns
    -------

    """
    _return_list = []
    _last_acceptable_value = None
    for _float in float_list:
        if _last_acceptable_value is None:
            _last_acceptable_value = _float + threshold
            _return_list.append(_float)
            continue

        if _float >= _last_acceptable_value:
            _return_list.append(_float)
            _last_acceptable_value = _float + threshold
            continue

    return _return_list


_l = [129.697756292517, 156.70894421768708, 159.5522273809524, 180.8768506802721, 180.87685085034013, 199.35819098639456, 199.3581911564626, 199.3581918367347]

print(reduce_float_list(_l, .5))