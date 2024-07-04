import FirebaseFirestore
import Foundation

class ToDoListViewModelView: ObservableObject {

    @Published var showingNewItemView = false

    private let userId: String

    init(userId: String) {
        self.userId = userId
    }

    func delete(id: String) {
        let db = Firestore.firestore()

        db.collection("users").document(userId).collection("todos").document(id).delete()

    }

}
