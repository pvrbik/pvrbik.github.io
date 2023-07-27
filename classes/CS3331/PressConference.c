#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h> 
#include <unistd.h>
#include <string.h>
#include <signal.h>
//PAUL VRBIK

//strucutre for passing arguments to threads
struct thread_data {
    int  thread_id;
    int  QuestionsAsked;
};

//global declarations
int NUM_THREADS;
pthread_mutex_t AskQuestion;
pthread_mutex_t AnsQuestion;

void *Reporter(void *threadarg) {
    struct thread_data *ThreadArgs;
    ThreadArgs = (struct thread_data *) threadarg;
    
    while (ThreadArgs->QuestionsAsked <= 5) {
        pthread_mutex_lock (&AskQuestion);
        printf("Reporter %ld asks question %d/5\n"
            ,ThreadArgs->thread_id, ThreadArgs->QuestionsAsked);
        (ThreadArgs->QuestionsAsked)++;
        pthread_mutex_unlock (&AnsQuestion);
    }
    pthread_exit(NULL);
}

void *Politician() {
    static int QuestionsAnswered = 1;
    
    while (QuestionsAnswered <= 5*(NUM_THREADS) ) {
        pthread_mutex_lock (&AnsQuestion);
        printf("Politician answers %d/%d: prorogue parliament\n"
            ,QuestionsAnswered, (5*NUM_THREADS) );
        QuestionsAnswered++;
        pthread_mutex_unlock (&AskQuestion);
    }
    
    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
    NUM_THREADS = atoi(argv[1])+1;
    
    pthread_t threads[NUM_THREADS];
    struct thread_data ThreadDataArray[NUM_THREADS];
    int rc;
    long t;
    
    pthread_mutex_init(&AskQuestion, NULL);
    pthread_mutex_init(&AnsQuestion, NULL);
    pthread_mutex_lock(&AnsQuestion);
    
    //create politician thread//
    rc = pthread_create(&threads[NUM_THREADS+1], NULL, Politician, NULL );
    if (rc){
        printf("ERROR; return code from pthread_create() is %d\n", rc);
        exit(-1);
    }
    
    //create reporter threads//
    for(t=0;t<NUM_THREADS;t++){
        ThreadDataArray[t].thread_id = t;
        ThreadDataArray[t].QuestionsAsked = 1;
        rc = pthread_create(&threads[t], NULL, Reporter,
            &ThreadDataArray[t]);
        if (rc){
            printf("ERROR; return code from pthread_create() is %d\n", rc);
            exit(-1);
        }
    }
    
    pthread_exit(NULL);
}
