//Exercicio01 - Slide 14
import java.util.concurrent.locks.*;
import java.util.Random;

class Item{
	int valor;
	public Item(int valor){
		this.valor = valor;
	}
}
public class Exercicio06_1{

	static Item[] vector;
	Lock[] travas;//uma trava para cada posicao

	public Exercicio06_1(){
		vector = new Item[20];
		travas = new ReentrantLock[20];
		for(int i = 0; i < vector.length; i++){
			vector[i] = new Item(0);
		}

		for(int i = 0; i < travas.length; i++){
			travas[i] = new ReentrantLock();
		}
	}

	public   void ler(int indice){
		travas[indice].lock();
		try{
			System.out.println("LER --- vector["+indice+"] = "+ vector[indice].valor);
		}finally{
			travas[indice].unlock();
		}
	}

	public  void escrever(int indice, int valor){
		travas[indice].lock();
		try{
			vector[indice].valor = valor;
			System.out.println("ESCREVEU --- vector["+indice+"] = "+ vector[indice].valor);
		}finally{
			travas[indice].unlock();
		}
	}

	public  void trocar(int indiceA, int indiceB){
		boolean a = travas[indiceA].tryLock();
		boolean b = travas[indiceB].tryLock();
			try{
				while(!(a && b)){
					if(a){
						travas[indiceA].unlock();
					}
					if(b){
						travas[indiceB].unlock();
					}
						a = travas[indiceA].tryLock();
						b = travas[indiceB].tryLock();
				}
				int aux = vector[indiceA].valor;
				vector[indiceA].valor = vector[indiceB].valor;
				vector[indiceB].valor = aux;
				System.out.println("TROCOU ---  vector["+indiceA+"] = "+ vector[indiceA].valor);
				System.out.println("       ---  vector["+indiceB+"] = "+ vector[indiceB].valor);

			}finally{
				travas[indiceA].unlock();
				travas[indiceB].unlock();
			}
	}

	public static void main(String [] args){

		Exercicio06_1 ex = new Exercicio06_1();
		Thread[] threads = new Thread[10];
		ThreadEx threadMaster = new ThreadEx(ex);

		for(int i = 0; i < threads.length; i++){
			threads[i] = new Thread(threadMaster);
			threads[i].start();
		}

		for(int i = 0; i < threads.length; i++){
			try{
				threads[i].join();
			}catch(InterruptedException e){
				System.out.println("NOT");
			}

		}
	}
}

class ThreadEx extends Thread{

	Exercicio06_1 ex;

	public ThreadEx(Exercicio06_1 ex){
		this.ex = ex;
	}

	public void run(){
		Random r = new Random();

		for (int i = 0; i < 10; i++){
			int opc = r.nextInt(3);
			
			int indice1 = r.nextInt(20);
			if(opc == 0){
				int indice = r.nextInt(20);
				ex.ler(indice);
			}else if(opc ==  1){
				int indice = r.nextInt(20);
				int valor = r.nextInt(10000);
				ex.escrever(indice, valor);
			}else{
				int indiceA = r.nextInt(20);
				int indiceB = r.nextInt(20);
				while(indiceA == indiceB){
					indiceA = r.nextInt(20);
					indiceB = r.nextInt(20);
				}
				ex.trocar(indiceA, indiceB);
			}

		}
	}
}