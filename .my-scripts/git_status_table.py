#!/usr/bin/env python
"""Example usage of terminaltables with colorclass.

Just prints sample text and exits.
"""

from __future__ import print_function

from colorclass import Color, Windows

from terminaltables import SingleTable

import sys

def get_colored_text(text):
    if 'ok' in text.lower():
        return '{autogreen}' + text + '{/autogreen}'
    elif 'error' in text.lower():
        return '{autored}' + text + '{/autored}'
    else:
        return text

def get_line(data, x, corte):
    line = []
    for i in range(0, corte):
        line.append(Color(get_colored_text(data[x+i])))

    return line

def table_server_status():
    """Return table string to be printed."""

    title = sys.argv[1]
    corte = int(sys.argv[2])
    data = sys.argv[2:]

    table_data = [get_line(data, x, corte) for x in range(1, len(data), corte)]

    table_instance = SingleTable(table_data, title)
    table_instance.inner_heading_row_border = False
    table_instance.inner_row_border = True
    table_instance.justify_columns = {0: 'left', 1: 'center'}
    return table_instance.table

def main():
    """Main function."""
    Windows.enable(auto_colors=True, reset_atexit=True)  # Does nothing if not on Windows.

    # Server status.
    print(table_server_status())
    print()

if __name__ == '__main__':
    main()