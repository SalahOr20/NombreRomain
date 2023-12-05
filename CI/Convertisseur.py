def convertir(nombre):
    if nombre <= 3:
        return 'II'*nombre

    if nombre == 4:
        return 'IV'

    if nombre <= 8:
        print('f')
        return 'V' + 'I'*(nombre-5)

    raise Exception('Erreur')
