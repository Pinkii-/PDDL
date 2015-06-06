#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <string>

using namespace std;

int main(int argc, char const *argv[])
{
	int maxTask = 50;
	if (argc > 1) srand (stoi(argv[1]));
	else srand(time(NULL));

	cout << "(define (problem test0) (:domain mintask)" << endl << " (:objects" << endl;
	int numTasks = 1+rand()%maxTask;
	int numProg = numTasks + rand()%numTasks;
	for (int i = 0; i < numProg; ++i) cout << " p" << i;
	cout << " - Programador" << endl;
	for (int i = 0; i < numTasks; ++i) cout << " t" << i;
	cout << " - Tarea)" << endl << "(:init (= (ttime) 0) (= (nprog) 0)";
	for (int i = 0; i < numTasks; ++i) cout << "(tSimple t" << i << ")";
	cout << endl;
	for (int i = 0; i < numProg; ++i) {
		cout << "(= (nivel-programador p" << i << ") " << (rand()%3)+1 << ") (= (calidad p" << i << ") " << (rand()%2)+1 << ") (= (tareas-programador p" << i << ") 2) ; Programador " << i << endl;
	}
	for (int i = 0; i < numTasks; ++i) {
		cout << "(= (nivel-tarea t" << i << ") " << (rand()%3)+1 << ") (= (tiempo-tarea t" << i << ") 5)" << endl;
	}
	cout << ") (:goal (forall (?t - Tarea) (finalizada ?t)) ) (:metric minimize (ttime)) )" << endl;
	return 0;
}