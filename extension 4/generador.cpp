#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <string>

using namespace std;

int main(int argc, char const *argv[])
{
	int maxTask = 50;
	
	srand(time(NULL));
	cout << "(define (problem test0) (:domain mintask)" << endl << " (:objects" << endl;
	int numTasks = 1+rand()%maxTask;
	if (argc > 1) numTasks = stoi(argv[1]);
	int numProg = numTasks + rand()%numTasks;
	for (int i = 0; i < numProg; ++i) cout << " p" << i;
	cout << " - Programador" << endl;
	for (int i = 0; i < numTasks; ++i) cout << " t" << i;
	cout << " - Tarea)" << endl << "(:init (= (ttime) 0) (= (nprog) 0)";
	for (int i = 0; i < numTasks; ++i) cout << "(tBasica t" << i << ")";
	cout << endl;
	for (int i = 0; i < numProg; ++i) {
		cout << "(= (nivel-programador p" << i << ") " << (rand()%3)+1 << ") (= (calidad p" << i << ") " << (rand()%2)+1 << ") (= (tareas-programador p" << i << ") 2) ; Programador " << i << endl;
	}
	for (int i = 0; i < numTasks; ++i) {
		cout << "(= (nivel-tarea t" << i << ") " << (rand()%3)+1 << ") (= (tiempo-tarea t" << i << ") 5)" << endl;
	}
	cout << ") (:goal (and (forall (?t - Tarea) (finalizada ?t)) (forall (?p - Programador) (not (por-contar ?p))) ) ) (:metric minimize (+ (* (ttime) 5) (* (nprog) 15))) )" << endl;
	return 0;
}