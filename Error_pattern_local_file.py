Log_file = "log_examples.log"

with open(Log_file, 'r', encoding='utf-8', errors='ignore') as file:
    logs = file.readlines()

    for log in logs:
        if '404' in log:
            print (log):
