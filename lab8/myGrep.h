#ifndef MYGREP_H
#define MYGREP_H

typedef struct line Line;
struct line
{
	Line *next;
	int lineNum;
	int wordNum;
	char line[100];
};

void linkedList(FILE *file, char * strArg);
void openFile(FILE *file);

#endif
