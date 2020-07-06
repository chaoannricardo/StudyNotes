import cv2
import random


def circle_the_dog(limit):
    im = cv2.imread("./12272111680143.jpg")

    list_xl = []
    list_xr = []
    list_yu = []
    list_yd = []

    # Start Drawing
    while True:

        compare_list = []

        # randomize a new center point
        center_x = random.randint(1, 300)
        center_y = random.randint(1, 400)

        # randomize a radius number
        radius = random.randint(10, 70)

        # calculate borders
        x1 = center_x - radius
        x2 = center_x + radius
        y1 = center_y - radius
        y2 = center_y + radius

        # check if out of border
        if x1 >= 0 and x2 <= 300 and y1 >= 0 and y2 <= 400:

            # checking process starts
            # first iteration
            if len(list_xl) == 0:
                print("First Interation")
                list_xl.append(x1)
                list_xr.append(x2)
                list_yd.append(y2)
                list_yu.append(y1)
                print(x1, x2, y1, y2)
                cv2.circle(im, (center_x, center_y), radius, (0, 0, 255), 2)

            elif len(list_xl) >= 1:
                overlap = False
                for i, j in enumerate(list_xl):
                    # print(list_xl[i], x1, center_x, x2, list_xr[i])
                    # print(list_yu[i], y1, center_y, y2, list_yd[i])
                    # print("===")
                    if list_xl[i] <= x1 <= list_xr[i] and list_yu[i] <= y1 <= list_yd[i] or \
                            list_xl[i] <= x1 <= list_xr[i] and list_yu[i] <= y2 <= list_yd[i] or \
                            list_xl[i] <= x2 <= list_xr[i] and list_yu[i] <= y1 <= list_yd[i] or \
                            list_xl[i] <= x2 <= list_xr[i] and list_yu[i] <= y2 <= list_yd[i] or \
                            list_xl[i] <= center_x <= list_xr[i] and list_yu[i] <= y2 <= list_yd[i] or \
                            list_xl[i] <= center_x <= list_xr[i] and list_yu[i] <= y1 <= list_yd[i] or \
                            list_xl[i] <= x1 <= list_xr[i] and list_yu[i] <= center_y <= list_yd[i] or \
                            list_xl[i] <= x2 <= list_xr[i] and list_yu[i] <= center_y <= list_yd[i] or \
                            list_xl[i] <= center_x <= list_xr[i] and list_yu[i] <= center_y <= list_yd[i]:
                        print("overlap!")
                        overlap = True

                if not overlap:
                    list_xl.append(x1)
                    list_xr.append(x2)
                    list_yd.append(y2)
                    list_yu.append(y1)
                    print(x1, x2, y1, y2)
                    cv2.circle(im, (center_x, center_y), radius, (0, 0, 255), 2)

        # Break when list length reach given limit
        if len(list_xl) == int(limit):
            break

    cv2.imshow("dog_img", im)
    cv2.waitKey(0)
    cv2.destroyAllWindows()


if __name__ == '__main__':
    circle_the_dog(limit=5)

