if __name__ == '__main__':
    file_name = input('Please enter the name of the conda package list file \n remember that this program should be '
                      'executed in the same directory with the package file: ')
    file = open(file_name, 'r')
    lines = file.readlines()
    new_file_name = str(file_name.split('.')[0]) + '_cleanup.txt'
    new_file = open(new_file_name, 'w')
    for line in lines:
        new_line = line.split('=')[0] + "==" + line.split('=')[1] + "\n"
        new_file.writelines(new_line)
    new_file.close()
