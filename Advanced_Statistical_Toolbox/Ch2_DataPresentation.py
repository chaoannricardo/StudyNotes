# Chapter 2 of the textbook
import matplotlib.pyplot as plt


# Graphing the frequency polygons of nonsmokers
def polygon_graph(data_list, data_list_name, scale_list, scale_list_name):
    print('# Remember to config the plt settings before calling the function')
    polygon_data_list = [0] + data_list + [0]
    polygon_scale_list = ['s'] + scale_list + ['e']
    plt.figure(figsize=(10, 5))
    plt.fill(
        scale_list_name,
        data_list_name,
        data={scale_list_name: polygon_scale_list,
              data_list_name: polygon_data_list},
        color='red')
    plt.show()


if __name__ == '__main__':
    temp_scale_list = ['7', '32', '75', '125', '175', '225', '275', '300+']
    temp_scale_list_name = 'Scale'
    temp_data_list = [7, 32, 75, 125, 175, 225, 275, 300]
    temp_data_list_name = 'Data'
    plt.title('Frequency Polygons of Nonsmokers')
    plt.xlabel('Continine Level (ng/ml)')
    plt.ylabel('Relative Frequency of Nonsmokers')
    polygon_graph(temp_data_list, temp_data_list_name, temp_scale_list, temp_scale_list_name)


