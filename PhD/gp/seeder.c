#include <stdio.h>
#include <time.h>


main()
{
  FILE *fp;
  while(1) {
    if((fp = fopen("c:/tmp/seed.dat", "w")) == NULL) {
      perror("Opening seed file");
      exit(1);
    }
    fprintf(fp, "%d\n", time(NULL));
    fclose(fp);
    sleep(1);
  }
}

    
