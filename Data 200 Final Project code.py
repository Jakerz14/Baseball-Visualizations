import pandas as pd
import matplotlib.pyplot as plt
import math
df = pd.read_csv('data200_final_wallmap.csv',usecols=[0,1,2,3])
print(df)
df.plot(kind='line',y='Ultrasonic_p4_01',x='Time')
plt.show()
circ = 43.2 * math.pi
revs = 66010/360
dist = circ * revs
revs1 = (18817-16325)/360
revs2 = (27564-25315)/360
revs3 = (45177-42930)/360
revs4 = (63540-61169)/360
d1 = circ * revs1
d2 = circ * revs2
d3 = circ * revs3
d4 = circ * revs4
avg = (d1+d2+d3+d4)/4
print(dist)
print(d1)
print(d2)
print(d3)
print(d4)
print(avg)
