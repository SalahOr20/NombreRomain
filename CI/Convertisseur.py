def convertir(nombre):
    if nombre <= 3:
        return 'I'*nombre

    if nombre == 4:
        return 'IVI'

    if nombre <= 8:
        return 'V' + 'I'*(nombre-5)

    raise Exception('Erreur')
