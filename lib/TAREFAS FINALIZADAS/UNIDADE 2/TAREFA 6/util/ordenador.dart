class Ordenador {
  List<dynamic> ordenar(List safadas, String campo, bool crescente) {
    print(campo);

    List safadasOrdenadas = List.of(safadas);

    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;

      for (int i = 0; i < safadasOrdenadas.length - 1; i++) {
        dynamic atual = safadasOrdenadas[i][campo];
        dynamic proximo = safadasOrdenadas[i + 1][campo];

        bool precisaTrocar = false;

        if (atual is String && proximo is String) {
          if ((crescente && atual.compareTo(proximo) > 0) ||
              (!crescente && atual.compareTo(proximo) < 0)) {
            precisaTrocar = true;
          }
        }

        if (precisaTrocar) {
          dynamic aux = safadasOrdenadas[i];
          safadasOrdenadas[i] = safadasOrdenadas[i + 1];
          safadasOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);

    return safadasOrdenadas;
  }
}
