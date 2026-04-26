/*
 * Buffer overflows work by allowing the user to write arbitraty length 
 * data to a static sized buffer. By writing over the end on the stack
 * due to the fact it counts down means you write back into sensitive data
 *
 * this is bad as they can overwrite things such as variables such as below
 *
 * compilers try to stop this
**/

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct buffer {
  char password[16];
  int flag;
};

void granted() {
  printf(" Access Granted.\n");
}

int auth() {
  volatile buffer buf = buffer{
      .password = "",
      .flag = 0,
  };
  gets((char *)buf.password);

  if (strcmp((char *)buf.password, "brilling") == 0)
    buf.flag = 1;


  /* this is another check yoy need to override */

  assert (buf.flag == 0 || buf.flag == 1);
  return buf.flag;
}

int main() {
  if (auth()) {
    /* alternativly you can overwrite the return point to take you to this function. */
    granted();
  } else {
    printf("\nAccess Denied.\n");
  }
}
