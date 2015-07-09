//Exercicio 01 - Slide 13
import java.util.Random;


public class Exercicio05_1 extends Thread{
	static Node raiz;
	int id;
	Random r;

	public Exercicio05_1(Node raiz, int id){
		this.raiz = raiz;
		this.id = id;
		r = new Random();
	}

	public void run(){
		
		for(int i = 0; i< 2000; i++){
			int val =r.nextInt(100);
			this.raiz.inserir(val, this.raiz);
			System.out.println("Thread "+id+ " >>  inserindo "+ val );
		}
	}

	public static void main(String [] args){
		Node raiz = new Node(1);

		Thread threads[] = new Exercicio05_1[50];
		double timeStart = System.currentTimeMillis();
		for(int i = 0; i< threads.length; i++){
			threads[i] = new Exercicio05_1(raiz, i);
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
		
		//raiz.printArvore(raiz);
	}

}

class Node{
	Node dir;
	Node esq;
	int valor;

	public Node(int valor){
		this.valor = valor;
	}

	public  Node inserir(int val, Node raiz){
		if(raiz == null){
			raiz = new Node(val);
		}else if(val > raiz.valor){
			synchronized(raiz){
				raiz.dir = inserir(val, raiz.dir);
			}
		}else if(val < raiz.valor){
			synchronized(raiz){
				raiz.esq = inserir(val, raiz.esq);
			}
		}else{
			synchronized(raiz){
				raiz.esq = inserir(val, raiz.esq);
			}
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

