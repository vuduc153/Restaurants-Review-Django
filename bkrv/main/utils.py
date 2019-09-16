def get_price_range(range):
    range = range.replace('.', '')
    range = range.replace('$', '')
    price_range = dict()
    if range[0] == '<':
        price_range['low'] = 0
        price_range['high'] = int(range.split('<')[1])
    elif range[0] == '>':
        price_range['low'] = int(range.split('>')[1])
        price_range['high'] = 10000
    else:
        price_range['low'] = int(range.split('-')[0])
        price_range['high'] = int(range.split('-')[1])

    return price_range


if __name__ == '__main__':
    r = get_price_range('50.000 - 100.000')
    print(r)
