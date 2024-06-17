import SwiftUI

public struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool

    public init(searchText: Binding<String>, isSearching: Binding<Bool>) {
        _searchText = searchText
        _isSearching = isSearching
    }

    public var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondaryLight, lineWidth: 1)
                        .background(Color.primaryLight)
                )
                .foregroundColor(.primaryDark)
                .cornerRadius(8)
                .onTapGesture {
                    isSearching = true
                }
                .padding(.horizontal)
                .padding(.bottom, 8)

            if isSearching {
                Button(action: {
                    searchText = ""
                    isSearching = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
    }
}

#Preview {
    VStack {
        SearchBar(searchText: .constant(""), isSearching: .constant(false))

        SearchBar(searchText: .constant("Search Text - IS SEARCHING"), isSearching: .constant(true))

        SearchBar(searchText: .constant("Search Text - IS NOT SEARCHING"), isSearching: .constant(false))
    }
}
