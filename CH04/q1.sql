select abs(-15); -- 					15 : ���밪
select ceil(15.7); -- 					16 : '����'�� �ø�
select cos(3.14159); -- 				-1 : �ڻ��ΰ�
select floor(15.7); -- 					15 : '����'�� ����
select log(10, 100); -- 				2 : '�ڿ��α�'�� ���
select mod(11, 4); -- 					3 : 11 % 4 = 3 '������ ���'
select power(3, 2); -- 					9 : 3��2�� '���� ���'
select round(15.1); -- 					15 : '����'�� �ݿø�
select sign(-15); -- 					-1 : ��ȣ ��ȯ ����� 1, ������ -1
 
-- select tranc(15.7); tranc �Լ��� ���� ��Ÿ�ε� ����
select char(67 using utf8); -- 			C : ���ο��� encoding
select concat('HAPPY','Birthday'); -- 	HAPPYBirthday : �� ���� �̾���
select lower('BirthdaY'); -- 			birthday : ���ڿ��� �ҹ��ڷ� �ٲ���
select lpad('Page 1', 15, '*.'); -- 	*.*.*.*.*Page 1 : Ư�� ���� ��ŭ ���ڸ� �����ʿ� �ٿ��� �����
select replace('JACK', 'J', 'BL'); --   BLACK : ���ڸ� ���� ��ü��
select rpad('Page 1', 15, '*.'); --     Page 1*.*.*.*.* : Ư�� ���� ��ŭ ���ڸ� ���ʿ� �ٿ��� ����� 

select substr('ABCDEFG', 3, 4); -- 		CDEF : 3��° ���� 4���ڸ� �����Ѵ�.
select trim(leading 0 from '00AA00');-- AA00 : leading trail both �ɼ����� ����, ���� ������ 
select upper('Birthday'); -- 			BIRTHDAY : ���ڸ� �빮�ڷ� ���� 
select ascii('A'); -- 					65 : �ƽ�Ű �ڵ尪 ��ȯ 
select length('Birthday'); -- 			8 : ���� ���� ��ȯ
select adddate('2019-02-14', interval 10 day); -- 2019-02-24 : ��¥ ���� 
select last_day(sysdate()); -- 			2021-06-30 : �̹����� ������ ��
select now(); -- 						2021-06-17 10:21:46 : ���� �ð� ǥ�� 						
select date_format(sysdate(), '%Y'); -- 2021 : ��¥ ������
select concat(123); -- 					123 : ���� ����
select str_to_date('12 05 2014', '%d %m %Y'); -- string -> Date������ ��ȯ 
select cast('12.3123' as decimal(10,1)); -- 12.3 : ����ȯ 
select if(1=1, 'aa', 'bb'); -- 			aa : if���� ���ǽ��� ������ ���� ��, Ʋ���� ���� �� 			
select ifnull(123, 345); -- 			123 : nullüũ ���� ���� null�̸� ���� ������ ��ȯ
select ifnull(null, 123);  -- 			123 : ���� ����