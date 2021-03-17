\\On va chercher à factoriser n en cherchant de manière exhaustive un carré
\\correspondant à celui du chiffré mais de symbole différent
\\ et se ramener ainsi à un crible quadratique.
\\Dans les faits, l'algorithme de Rabin est vulnérable aux attaques CCA
\\et on dispose ici d'un oracle. Néanmoins, le padding ajouté rend
\\compliqué cette attaque. On va donc chercher par bruteforce un carré
\\non trivial égal au chiffré mais dont les racines sont différentes du message
\\Au vu des données présentes dans le chiffré, on sait déjà que le symbole de 
\\Kronecker de ce que l'on cherche sera différent de celui du chiffré

nb = 512;
nbm = 12;
mod = 1<<nbm;
mask = 2*(4^(nbm/2)-1)/(4-1);
n = read("input.txt");
chiffre(m) = [m^2%n,kronecker(m,n),m%2];
dechiffre(c) = read("dec")(c);
m = random(1<<500)<<nb+mask;
if(dechiffre(chiffre(m)) != m,error("problème d'énoncé à signaler"));

c = chiffre(m);
c[2] *= -1;
a = dechiffre(c);
while(( a == 0 || a ==m),m = random(1<<500)<<nb+mask;c = chiffre(m);c[2]*=-1;a = dechiffre(c););

p = gcd(a+m,n);
q = gcd(a-m,n);

if(p<q, print(p),print(q));
