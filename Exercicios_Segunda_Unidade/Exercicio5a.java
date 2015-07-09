import java.util.Vector;
import java.util.Scanner;

public class Exercicio5a {

	public Vector<Long> fila;
	public long contador;

	public Exercicio5a(){
		this.fila = new Vector<Long>();
		this.contador = 0;
	}

	public synchronized void insere(int numero, long elemento){
		fila.add(elemento);
		System.out.print("Thread " + numero + " inseriu elemento " + elemento + ". Fila:");
		for (int i = 0; i < this.fila.size(); i++){
			System.out.print(" " + fila.get(i));
		}
		System.out.println(".");
	}

	public synchronized void remove(int numero){
		fila.remove(0);
		if(fila.size() == 0){
			System.out.print("Thread " + numero + " removeu o primeiro elemento. Fila vazia");
		} else {
			System.out.print("Thread " + numero + " removeu o primeiro elemento. Fila:");
			for (int i = 0; i < this.fila.size(); i++){
				System.out.print(" " + fila.get(i));
			}
		}
		System.out.println(".");
	}

	public synchronized long incrementaContador(){
		this.contador++;
		return this.contador;
	}

	public static void main (String args[]){

		Scanner in = new Scanner(System.in);

		System.out.println("Digite um numero de threads: ");

		int n = in.nextInt();

		Exercicio5a programa = new Exercicio5a();

		Thread threads[] = new Thread[n];

		for(int i = 0; i < n; i++){
			threads[i] = new Thread(new MyThread(programa, i));
			threads[i].start();
		}

		for(int i = 0; i < n; i++){
			try{
				threads[i].join();
			} catch (InterruptedException e) {
			}
		}

	}


}

class MyThread implements Runnable {

	public Exercicio5a programa;
	public int numero;

	public MyThread(Exercicio5a programa, int numero){
		this.programa = programa;
		this.numero = numero;
	}

	public void run(){
		for(int i = 0; i < 10; i++){
			long elemento = this.programa.incrementaContador();
			this.programa.insere(this.numero, elemento);
			try {
				Thread.sleep(100);
			} catch (InterruptedException e){

			}
			this.programa.remove(this.numero);
		}
	}

}