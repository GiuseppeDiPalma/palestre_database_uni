
--Procedura calcola eta in PERSONAL TRAINER || CALL CALCOLA_ETA()
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE CALCOLA_ETA IS
BEGIN
	UPDATE PERSONAL_TRAINER
	SET ETA_TRAINER = (SYSDATE - DATA_NASCITA_TRAINER) / 365
	WHERE DATA_NASCITA_TRAINER = DATA_NASCITA_TRAINER;
	DBMS_OUTPUT.PUT_LINE('ETA_CALCOLATA PER TUTTI I TRAINER DEL DB');
	
	UPDATE CLIENTE
	SET ETA_CLIENTE = (SYSDATE - DATA_NASCITA_CLIENTE) / 365
	WHERE DATA_NASCITA_CLIENTE = DATA_NASCITA_CLIENTE;
	DBMS_OUTPUT.PUT_LINE('ETA_CALCOLATA PER TUTTI I CLIENTI DEL DB');
	
END;
/



--Procedura Aumento stipendio in personal_trainer in base a quanti corsi fa || CALL AUMENTO('PARTITA_IVA', NUMERO AUMENTO)

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE AUMENTO (TRAINER_ID_TESSERINO NUMBER, AUMENTO NUMBER) IS
CONTA NUMBER;
RISULTATO NUMBER;
BEGIN
SELECT COUNT(*)INTO CONTA 
FROM CORSO
WHERE M_ID_TESSERINO = TRAINER_ID_TESSERINO
GROUP BY M_ID_TESSERINO;
RISULTATO:= AUMENTO * CONTA;
	UPDATE PERSONAL_TRAINER
	SET STIPENDIO = 1100 + RISULTATO
	WHERE TRAINER_ID_TESSERINO = ID_TESSERINO;
END;
/




--Procedura Cancellazione certificati medici scaduti da un anno
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE CANCELLAZIONE_CERTIFICATI IS
CONTA NUMBER;
RISULTATO NUMBER;
BEGIN
DELETE FROM CERTIFICATO_MEDICO 
WHERE DATA_SCADENZA < SYSDATE -365 AND ID_CERTIFICATO = ID_CERTIFICATO;
END;
/


--Procedura PER CALCOLARE INDICE DI MASSA CORPOREA di un cliente


SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE IMC IS
BEGIN
	UPDATE MISURAZIONE
	SET IMC = (PESO/POWER(ALTEZZA,2))*1000
	WHERE M_CODICE_TESSERA = M_CODICE_TESSERA ;
END;
/




