/* 
 * read.c --- 
 * 
 * Author: Joshua M. Meise
 * Created: 06-20-2024
 * Version: 1.0
 * 
 * Description: 
 * 
 */

#include <stdio.h>
#include <stdlib.h>

typedef struct message {
	unsigned char header[32];
	unsigned char *body;
} message_t;

int toInt(unsigned char *len, int numBytes) {
	return (int)len[0]*32 + (int)len[1];
}

void printMessage(message_t mess, int len) {
	int i;

	printf("Message: ");
	for (i = 0; i < len; i++) {
		if (i < 32) printf("%02x ", mess.header[i]);
		else printf("%02x ", mess.body[i - 32]);
	}

	printf("\n");
}

int main(int argc, char **argv) {
	FILE *ifile;
	unsigned char buf;
	int bytesRead, i, len;
	message_t mess;
	
	if (argc != 2) {                                                                                                                                                                                         
    printf("usage: read fileToRead\n");
    exit(EXIT_FAILURE);
	}

	if ((ifile = fopen(argv[1], "rb")) == NULL) {
    printf("File does not exist\n");
    exit(EXIT_FAILURE);
	}

	i = 0;

	printf("Header: ");
	while(i < 40) {
		bytesRead = fread(&buf, 1, sizeof(buf), ifile);
		printf("%02x ", buf);
		i++;
	}
	printf("\n");
	
	i = 0;
	len = 0;
	while ((bytesRead = fread(&buf, 1, sizeof(buf), ifile)) > 0) {
		if (i < 32) mess.header[i] = buf;
		else if (i == 32) {
			len = toInt(&mess.header[28], 2) - 8;
			printf("%d\n", len);
			mess.body = (unsigned char *)malloc(sizeof(unsigned char)*len);
			mess.body[i - 32] = buf;
		} else if (i < len + 32) mess.body[i - 32] = buf;
	
		i++;

		if (i == (48 + len) && len != 0) {
			printMessage(mess, len + 32);
			i = 0;
			len = 0;
			free(mess.body);
		}

	}
	
	exit(EXIT_SUCCESS);
}
