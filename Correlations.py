import pandas as pd
import seaborn as sn
import matplotlib.pyplot as plt

def stata_test(fname):
    df = pd.read_stata(fname)
    print(df)
    corrMatrix = df.corr()
    print(corrMatrix)
    sn.heatmap(corrMatrix, annot=True)
    plt.show()

# test harness
if __name__ == '__main__':
    fname = 'C:/Users/jackr/Desktop/School/Fall2020/Stata/CyclingtoSchool/bh_enroll_data_reg.dta'
    stata_test(fname)
