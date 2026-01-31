# Creating new DBT Project

### Step 1 

  Navigate to the desired directory, for example,
    
    cd  C:\File\directory

### Step 2

Create a Virtual Environment within the desired directory.
    "dbt_env" this is the name of the virtual entirment

    python -m venv dbt_env

### Step 3

Activate Virtual Enviroment 

    dbt_env\Scripts\Activate.ps1    

  if the above does not work....

    open Powershell or terminal in admin, 

    run "Get-ExecutionPolicy" to get the status of policy 

    then run "Set-ExecutionPolicy RemoteSigned" to change it 

### Step 4

install DBT with the correct connector, 

    pip install dbt-core dbt-postgres


### Step 5

Update to the latest version 

    python.exe -m pip install --upgrade pip

### Step 6

Create DBT Project 

Ensure you are in the directory that you want the project to live in 
        
    dbt init first_project

Follow the steps that show up on the terminal. 

### Step 7

locate and move the **profiles.yaml** into the project location and edit it to connect to database

Change your directory in the console to also be inside the dbt project

### Step 8

Use dbt debug to check the connection 

    first_project:
      outputs:
        dev:
          dbname: dbname
          host: "hostname"
          pass: "password"
          port: 5432
          schema: schemaname
          threads: 1
          type: postgres
          user: Admin
      target: dev




