final createTable = '''
  CREATE TABLE contact(
    id INTEGER PRIMARY KEY
    ,nome VARCHAR(200)
    ,telefone CHAR(16)
    ,email VARCHAR(150) 
  )
''';

final insert1 = '''
INSERT INTO contact (nome, telefone, email)
VALUES ('Pietro', '(11) 9 9874-5656', 'pietro@email.com') 
''';

final insert2 = '''
INSERT INTO contact (nome, telefone, email)
VALUES ('Maitê', '(81) 9 9632-8578', 'maite@email.com')
''';

final insert3 = '''
INSERT INTO contact (nome, telefone, email)
VALUES ('Hortência', '(82) 9 9562-3356','hortencia@email.com')
''';
