#!/usr/bin/env python
# coding: utf-8

# In[1]:


get_ipython().system('pip3 install mysql-connector-python')


# In[32]:


import seaborn as sns
import matplotlib.pyplot as plt


# In[2]:


import mysql.connector


# In[4]:


connection = mysql.connector.connect(host='127.0.0.1',
                                     database='project',
                                     user='root',
                                     password='Sre200499$',
                                     auth_plugin = 'mysql_native_password')


# In[5]:


if connection.is_connected():
    db_Info = connection.get_server_info()
    print("Connected to MySQL Server version ", db_Info)
    cursor = connection.cursor()
    cursor.execute("select database();")
    record = cursor.fetchone()
    print("Your connected to database: ", record)


# In[6]:


query = "SELECT * from players;"
cursor.execute(query)
data=cursor.fetchall()
print(data)


# In[7]:


get_ipython().system('pip install pandas')


# In[8]:


get_ipython().system('pip install matplotlib')


# In[9]:


get_ipython().system('pip install seaborn')


# In[12]:


import pandas as pd
df = pd.DataFrame(data,columns=['Player_ID','Name','Age','Years_of_Experience','Buy_Price'])
df.head()


# In[13]:


df.columns


# In[141]:


query = "select years_of_experience, buy_price from players;"
cursor.execute(query)
data=cursor.fetchall()
df = pd.DataFrame(data,columns=['years_of_experience','buy_price'])
df.head()


# In[124]:


sns.boxplot(data=df, x="years_of_experience", y="buy_price")


# In[14]:


query = "select (count(price)) as ticket_count,(count(price))*price as total_stadium_revenue from tickets t join tickets_ref as tr on t.ticket_num=tr.ticket_num;" 
cursor.execute(query)
data=cursor.fetchall()
print(data)


# In[16]:


df1 = pd.DataFrame(data, columns=['Ticket_Count','Total_Stadium_Revenue'])
df1.head(15)


# In[17]:


df1['Total_Stadium_Revenue']= df1['Total_Stadium_Revenue'].astype('int')


# In[19]:


get_ipython().system('pip install plotly')


# In[43]:


query="select avg(watch_time) as average_watch_time, region_code from online_viewers group by region_code having (avg(watch_time)> 15) order by avg(watch_time) desc;"
cursor.execute(query)
data=cursor.fetchall()
df1 = pd.DataFrame(data,columns=['Avg_watch_Time','Region_Code'])
df1.head()


# In[99]:


fig,ax = plt.subplots(figsize=(7,5))
sns.barplot(data=df1,x='Region_Code',y='Avg_watch_Time',ax=ax)
plt.ylim(46,60)


# In[53]:


query="select  price, (count(price)) as ticket_count from tickets group by price;"
cursor.execute(query)
data=cursor.fetchall()
df2 = pd.DataFrame(data,columns=['Price','Count(Price)'])
df2.head()


# In[68]:


fig = px.pie(df2, values='Count(Price)', names='Price', title='Ticket Procurement',hole=0.4, 
             color_discrete_sequence=px.colors.sequential.RdBu)
fig.show()


# In[70]:


query ="select Budget, year from tournament;"
cursor.execute(query)
data=cursor.fetchall()
df3 = pd.DataFrame(data,columns=['Budget','Year'])
df3.head()


# In[111]:


sns.lineplot(data=df3, x='Year', y='Budget')
plt.ylabel("Budget (in Crores)")
plt.ylim(40000000,160000000)s


# In[133]:


query="select  too.team_id, tt.t_year, t.winner_amount, too.purse_amount_crores from tt join tournament as t on t.year=tt.t_year join team_owner as too on too.team_id=tt.t_Team_ID where too.purse_amount_crores > 10 and tt.Standings=1;"
cursor.execute(query)
data=cursor.fetchall()
df5 = pd.DataFrame(data,columns=['Team_ID','Year','Winner_Amount','Purse_amount_in crores'])
df5.head()


# In[138]:


sns.lineplot(data=df5, x='Year', y='Purse_amount_in crores')


# In[83]:


query ="select year, winner from tournament;"
cursor.execute(query)
data=cursor.fetchall()
df4 = pd.DataFrame(data,columns=['Winner','Year'])
df4.head()


# In[113]:


sns.histplot(data=df4, y='Winner', x='Year')


# In[158]:


query = "select count(years_of_experience), years_of_experience from players group by years_of_experience order by years_of_experience"

cursor.execute(query)
data=cursor.fetchall()
df8 = pd.DataFrame(data,columns=['Count', 'Years_of_Experience'])
df8.head()


# In[163]:


sns.barplot(data=df8, x='Years_of_Experience', y='Count')


# In[164]:





# In[167]:


query = "select team.name, team_owner.purse_amount_crores from team join team_owner on team_owner.team_id=team.team_id"

cursor.execute(query)
data=cursor.fetchall()
df9 = pd.DataFrame(data,columns=['Name', 'Purse Amount'])
df9.head()


# In[168]:


sns.set_style('whitegrid')
sns.kdeplot(data=df9)


# In[178]:


query = "select team.name, team_owner.purse_amount_crores from team join team_owner on team_owner.team_id=team.team_id"

cursor.execute(query)
data=cursor.fetchall()
dfa1 = pd.DataFrame(data,columns=['Name', 'Purse Amount'])
dfa1.head

plt.rcParams["figure.figsize"] = [7.50, 3.50] 
plt.rcParams["figure.autolayout"] = True
fig, ax = plt.subplots()

dfa1.plot(kind='bar', color='red')
dfa1.plot(kind='line', marker='*', color='black', ms=10)

plt.show()


# In[ ]:




