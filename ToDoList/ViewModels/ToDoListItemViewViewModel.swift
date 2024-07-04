import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init() {}

    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item // need to make copy as item is immuteable from above
        itemCopy.setDone(!item.isDone)

        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("Users").document(uid).collection("todos").document(itemCopy.id).setData(itemCopy.asDictionary())
    }
}
