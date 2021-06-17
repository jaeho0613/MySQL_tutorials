select abs(-15); -- 					15 : 절대값
select ceil(15.7); -- 					16 : '정수'로 올림
select cos(3.14159); -- 				-1 : 코사인값
select floor(15.7); -- 					15 : '정수'로 버림
select log(10, 100); -- 				2 : '자연로그'값 계산
select mod(11, 4); -- 					3 : 11 % 4 = 3 '나머지 계산'
select power(3, 2); -- 					9 : 3의2승 '지수 계산'
select round(15.1); -- 					15 : '정수'로 반올림
select sign(-15); -- 					-1 : 부호 반환 양수면 1, 음수면 -1
 
-- select tranc(15.7); tranc 함수는 없음 오타인듯 싶음
select char(67 using utf8); -- 			C : 내부에서 encoding
select concat('HAPPY','Birthday'); -- 	HAPPYBirthday : 두 값을 이어줌
select lower('BirthdaY'); -- 			birthday : 문자열을 소문자로 바꿔줌
select lpad('Page 1', 15, '*.'); -- 	*.*.*.*.*Page 1 : 특정 길이 만큼 문자를 오른쪽에 붙여서 출력함
select replace('JACK', 'J', 'BL'); --   BLACK : 문자를 서로 교체함
select rpad('Page 1', 15, '*.'); --     Page 1*.*.*.*.* : 특정 길이 만큼 문자를 왼쪽에 붙여서 출력함 

select substr('ABCDEFG', 3, 4); -- 		CDEF : 3번째 부터 4글자를 추출한다.
select trim(leading 0 from '00AA00');-- AA00 : leading trail both 옵션으로 공백, 문자 제거함 
select upper('Birthday'); -- 			BIRTHDAY : 문자를 대문자로 변경 
select ascii('A'); -- 					65 : 아스키 코드값 변환 
select length('Birthday'); -- 			8 : 문자 길이 반환
select adddate('2019-02-14', interval 10 day); -- 2019-02-24 : 날짜 덧셈 
select last_day(sysdate()); -- 			2021-06-30 : 이번달의 마지막 날
select now(); -- 						2021-06-17 10:21:46 : 현재 시간 표시 						
select date_format(sysdate(), '%Y'); -- 2021 : 날짜 포멧팅
select concat(123); -- 					123 : 위와 동일
select str_to_date('12 05 2014', '%d %m %Y'); -- string -> Date형으로 변환 
select cast('12.3123' as decimal(10,1)); -- 12.3 : 형변환 
select if(1=1, 'aa', 'bb'); -- 			aa : if구문 조건식이 맞으면 앞쪽 값, 틀리면 뒷쪽 값 			
select ifnull(123, 345); -- 			123 : null체크 앞쪽 값이 null이면 뒷쪽 값으로 반환
select ifnull(null, 123);  -- 			123 : 위와 동일