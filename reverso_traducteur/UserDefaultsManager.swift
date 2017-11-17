
//============
import Foundation       /* bibliotèque pour créer la class*/
//============
class UserDefaultsManager
{
    //---------
    //methode sont de fonctions
    //parametre est entre () à la fonction qui est information temporaire qui atendre tre exectute de la fonction
    //sont de variables
    //---------
    func doesKeyExist(theKey: String) -> Bool
    {
        if UserDefaults.standard.object(forKey: theKey) == nil
        {
            return false
        }
        return true
    }
    //---------
    func setKey(theValue: AnyObject, theKey: String)
    {
        UserDefaults.standard.set(theValue, forKey: theKey)
    }
    //---------
    func removeKey(theKey: String)
    {
        UserDefaults.standard.removeObject(forKey: theKey)
    }
    //---------
    func getValue(theKey: String) -> AnyObject
    {
        return UserDefaults.standard.object(forKey: theKey) as AnyObject
    }
}

//============
