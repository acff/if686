//Exercicio01 - Slide 14
//Usando travas explicitas// Lock x = new ReentratLock();

import java.util.Random;
import java.util.concurrent.locks.*;

public class Exercicio06 extends Thread{
	static Node raiz;
	int id;
	Random r;

	public Exercicio06(Node raiz, int id){
		this.raiz = raiz;
		this.id = id;
		r = new Random();
	}

	public void run(){
		
		for(int i = 0; i< 20; i++){
			int val =r.nextInt(100);
			this.raiz.inserir(val, this.raiz);
			System.out.println("Thread "+id+ " >>  inserindo "+ val );
		}
	}

	public static void main(String [] args){
		Node raiz = new Node(1);

		Thread threads[] = new Exercicio06[50];
		double timeStart = System.currentTimeMillis();
		for(int i = 0; i< threads.length; i++){
			threads[i] = new Exercicio06(raiz, i);
			threads[i].start();
		}

		for(int i = 0; i< threads.length; i++){
			try{
				threads[i].join();
			}catch(InterruptedException e){
				System.out.println("NOT");
			}
		}
		System.out.println("------------- Tempo: "+( System.currentTimeMillis()-timeStart));
		/*
		sequencial:
		Random r = new Random();
			int valor = r.nextInt(100);
		for(int i = 0; i < 100000; i++){	
			raiz.inserir(valor, raiz);
		} 
		
		*/
		//raiz.printArvore(raiz);
	}

}

class Node{
	Node dir;
	Node esq;
	int valor;
	Lock trava;

	public Node(int valor){
		this.valor = valor;
		trava = new ReentrantLock();
	}

	public Node inserir(int val, Node raiz){
		trava.lock();
		try{
				if(raiz == null){
				raiz = new Node(val);
			}else if(val > raiz.valor){
				raiz.dir = inserir(val, raiz.dir);
			}else if(val < raiz.valor){
				raiz.esq = inserir(val, raiz.esq);
			}else{
				raiz.esq = inserir(val, raiz.esq);
			}
		}finally{
			trava.unlock();
		}
		
		return raiz;
	}

	public void printArvore(Node raiz){
		if(raiz != null){
			printArvore(raiz.esq);
			System.out.println("valor --..-- "+raiz.valor);
			printArvore(raiz.dir);
		}
	}
}

