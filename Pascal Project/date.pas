{Reeves Trott}
{CS 312}
{March 16, 2018}
{This program writes a program in Pascal that works with dates. Including iterating}
{through days, comparing dates, and dealing with leap years.} 


program dt;

uses sysutils;


procedure main();
        
    type 
    
    day_range = 1..32;
    month_range = 1..13;
    date_t = record
        D_rec : integer;
        M_rec : integer;
        Y_rec : integer;
    
    end;

    var
        YY, MM, DD : Word;
        format_str : string;
        d1, d2, d3 : date_t;
        month: month_range;
        day_r : day_range;
        
       
{So we can print out the months as days rather than numbers}                       
function month_str (month : month_range) : string;
    begin
    
        case (month) of
           
            1 : Write('January');		2 : Write('February');
			3 : Write('March');			4 : Write('April');
			5 : Write('May');			6 : Write('June');
            7 : Write('July');			8 : Write('August');
            9 : Write('September');		10 : Write('October');
            11 : Write('November');		12 : Write('December');
        
        end;
     end;
                
            
{formats the date as requested by the specs}
procedure format_date (date : date_t; var ret_str : string);
            
    begin
        
        month_str(MM);
        WriteLn( ' ', DD, ', ', YY);
    
    end;
            

        
{gets you the current date}        
procedure init_date (var dt : date_t; day : day_range; month : month_range; year : integer);
    
    var
        date_copy : TDateTime;
        date_str : string;

    begin
    
    date_copy := EncodeDate (year, month, day);
    DecodeDate(date_copy,YY,MM,DD);

        dt.D_rec := DD;
        dt.M_rec := MM;
        dt.Y_rec := YY;

    format_date(dt, date_str);
    
    end;

{Allows you to set a date to any date you want}
procedure init_date1 (var dt : date_t);
    var
        date_string : string;
    begin
        DecodeDate(Date,YY,MM,DD);

        dt.D_rec := DD;
        dt.M_rec := MM;
        dt.Y_rec := YY;

        format_date(dt , date_string);

    end;


{checks if the first date passed is less than the 2nd date passed}
function date_less_than (date1 : date_t; date2 : date_t) : boolean;
    
    var
    X: boolean;

    begin

        if date1.Y_rec > date2.Y_rec then
        
        begin
            
            X := False;
            WriteLn('FALSE');
        
        end;

        if date1.Y_rec = date2.Y_rec then
        
        begin
            
            if date1.M_rec > date2.M_rec then
            
            begin
                
                X := False;
                WriteLn('FALSE');
            
            end;
        end;

        if date1.Y_rec = date2.Y_rec then
        
        begin
            
            if date1.M_rec = date2.M_rec then
            
            begin
                
                if date1.D_rec > date2.D_rec then
                
                begin
                    
                    X := False;
                    WriteLn('FALSE');
                
                end;
            end;
        end;

        
        if date1.Y_rec < date2.Y_rec then
        
        begin
            
            X := True;
            WriteLn('TRUE');
        
        end;

        if date1.Y_rec = date2.Y_rec then
        
        begin
            
            if date1.M_rec < date2.M_rec then
            
            begin
                
                X := True;
                WriteLn('TRUE');
            
            end;
        end;

        if date1.Y_rec = date2.Y_rec then
        
        begin
            
            if date1.M_rec = date2.M_rec then
            
            begin
                
                if date1.D_rec < date2.D_rec then
                
                begin
                   
                   X := True;
                   WriteLn('TRUE');
                
                end;
            end;
        end;
    end;

{type boolean, returns true or false if two dates are the same}        
function date_equal (date1 : date_t; date2 : date_t) : boolean;
    var
    Y: boolean;
    begin
        if date1.Y_rec = date2.Y_rec then
        begin
           if date1.M_rec = date2.M_rec then
           begin
              if date1.D_rec = date2.D_rec then
              begin
                
                Y := True;
                WriteLn('TRUE');
               
               end

               else
               begin
               
               Y := False;
               WriteLn('FALSE');
               
               end;
            end

            else
            begin
            
             Y := False;
             WriteLn('FALSE');
            
            end;
         end

         else
         begin
            
            Y := False;
            WriteLn('FALSE');
         
         end;

       end;

{uses the function in sysutils}           
function leap_year (year : integer) : boolean;

    begin
        IsLeapYear(year)
    end;


{Increments the date by one day, includes certain checks for leap year}
procedure next_day (var date : date_t);

    var
        Feb : Integer;
        check_for_leap : Boolean;
        month2 : month_range;
        dt_str : String;

    begin
        
        Inc (date.D_rec);
        month2 := date.M_rec;
        
        if leap_year(date.Y_rec) then
        
        begin
            
            Feb := 29;
            check_for_leap := True;
        
        end
        
        
        else
        begin
          
          Feb := 28;
          check_for_leap := False;
        
        end;

        if date.D_rec = 32 then
        
        begin
            
            date.D_rec := 1; Inc (date.M_rec);
        
        end;
            
            if date.M_rec = 13 then
            
            begin
            
                date.M_rec := 1; Inc (date.Y_rec)
            
            end;
        
        format_date(date, dt_str);
    
    end;
               
{sets how many days are in each month, special case for February}
function month_length (month: month_range; leap: boolean): day_range;

    var
        days_in_mon : day_range;

        begin
            case (month) of
                1 : days_in_mon := 31;
				2 : if leap then
                    begin
                        days_in_mon := 29;
                    end
                    else
                    begin
                        days_in_mon := 28;
                    end; 
                3 : days_in_mon := 31;		4 : days_in_mon := 30;
    			5 : days_in_mon := 31;		6 : days_in_mon := 30;
				7 : days_in_mon := 31;		8 : days_in_mon := 31;
				9 : days_in_mon := 30;		10 : days_in_mon := 31;
                11 : days_in_mon := 30;		12 : days_in_mon := 31;
            end;
        end;

        
begin
    
    Write('d1: '); init_date1(d1);
    Write('d2: '); init_date(d2, 31, 12, 1999);
    Write('d3: ');init_date(d3, 1, 1, 2000);WriteLn(' ');

    Write('d1 < d2? '); 
    date_less_than(d1, d2);
    Write('d2 < d3? '); 
    date_less_than(d2, d3);WriteLn(' ');

    Write('next day d2: '); 
    next_day(d2);
    Write('d2 = d3? '); 
    date_equal(d2, d3);WriteLn(' ');

    Write('next day d2: ');
    init_date(d2, 2, 1, 2000);
    Write('d2 < d3? '); 
    date_less_than(d2, d3);
    Write('d2 = d3? '); 
    date_equal(d2, d1);
    Write('d2 > d3? '); 
    date_less_than(d3, d2); WriteLn(' ');

    Write('initialized d1 to '); 
    init_date(d1, 28, 2, 1529);
    Write('next day d1: '); 
    init_date(d1, 1, 3, 1529); WriteLn(' '); 

    Write('initialized d1 to '); 
    init_date(d1, 28, 2, 1460);
    Write('next day d1: '); 
    init_date(d1, 29, 2, 1460); WriteLn(' ');    

    Write('initialized d1 to '); 
    init_date(d1, 28, 2, 1700);
    Write('next day d1: '); 
    init_date(d1, 1, 3, 1700); WriteLn(' '); 

    Write('initialized d1 to '); 
    init_date(d1, 28, 2, 1600);
    Write('next day d1: '); 
    init_date(d1, 29, 2, 1600); WriteLn(' '); 

end;



begin
    
    main();

end.