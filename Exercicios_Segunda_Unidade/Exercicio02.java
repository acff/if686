//Exercicio 03 - Slide 11 
//Numeros primos
import java.util.ArrayList;

public class Exercicio02 implements Runnable{

	int a, b;
	static ArrayList<Integer> numPrimos = new ArrayList<Integer>();

	public Exercicio02(int a, int b){
		this.a = a;
		this.b = b;
	}

	public void run(){
		for(int i = a; i <= b; i++){
			
			boolean primo = true;

			for(int j = 2; j < i; j++){
				if(i%j == 0){
					primo = false;
				}
			}

			if(primo){
				Exercicio02.numPrimos.add(i);
			}
		}
	}

	public static void main(String args[]){

		Long timeStart = System.currentTimeMillis();
		int init = 0;
		int contador = 100;

		Thread[] threads = new Thread [5];

		for (int i = 0; i < threads.length; i++){
			threads[i] = new Thread(new Exercicio02(init, (init+contador)));
			threads[i].start();
			init = init + contador;;
		}

		for (int i = 0; i < threads.length; i++){
			try{
				threads[i].join();
			}catch(InterruptedException e){

			}
		}

		System.out.println("Tempo execucao (ms):.:.:. "+ (System.currentTimeMillis()-timeStart));

		for(int i = 0; i < numPrimos.size(); i++){
			System.out.println(numPrimos.get(i));
		}
	}
		
	
}