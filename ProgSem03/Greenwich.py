def getTiempo(seconds):

    if seconds > 0 and seconds <= 2**32 - 1:
        minutes, seconds = divmod(seconds, 60)
        hours, minutes = divmod(minutes, 60)
        days, hours = divmod(hours, 24)
        '''
        weeks, days = divmod(days, 7)
        months, weeks = divmod(weeks, 4)
        years, months = divmod(months, 12)

        '''
    
    years = 1970
    cont  = 2

    while years <= 2038:
        if cont <= 3:
            days = days - 365
            if days < 0:
                days = days + 365
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 1
                    break
                days = days - 28
                if days < 0:
                    days = days + 28
                    months = 2
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 3
                    break
                days = days - 30
                if days < 0:
                    days = days + 30
                    months = 4
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 5
                    break
                days = days - 30
                if days < 0:
                    days = days + 30
                    months = 6
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 7
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 8
                    break
                days = days - 30
                if days < 0:
                    days = days + 30
                    months = 9
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 10
                    break
                days = days - 30
                if days < 0:
                    days = days + 30
                    months = 11
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 12
                    break
            else:
                cont = cont + 1
                years = years + 1
        else:
            days = days - 366
            if days < 0:
                days = days + 366
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 1
                    break
                days = days - 29
                if days < 0:
                    days = days + 29
                    months = 2
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 3
                    break
                days = days - 30
                if days < 0:
                    days = days + 30
                    months = 4
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 5
                    break
                days = days - 30
                if days < 0:
                    days = days + 30
                    months = 6
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 7
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 8
                    break
                days = days - 30
                if days < 0:
                    days = days + 30
                    months = 9
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 10
                    break
                days = days - 30
                if days < 0:
                    days = days + 30
                    months = 11
                    break
                days = days - 31
                if days < 0:
                    days = days + 31
                    months = 12
                    break
            
                break
            else:
                cont = 1
                years = years + 1



    print(f"{years} years {months} months {days} days {hours} hours {minutes} minutes {seconds} seconds")
    # {years} years {months} months {weeks} weeks


if __name__ == "__main__":
    seconds = int(input("Ingresa la cantidad de segundos: "))
    seconds = seconds + 43200
    getTiempo(seconds)