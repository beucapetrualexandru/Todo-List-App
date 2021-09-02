//
//  ListView.swift
//  TodoList
//
//  Created by Beuca Alexandru on 19.08.2021.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        
        
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
        //                ListRowView(title: item)
                    }
                    .onDelete(perform: { indexSet in
                        listViewModel.deleteItem(indexSet: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        listViewModel.moveItem(from: indices, to: newOffset)
                    })
                }
                .listStyle(PlainListStyle())
            }
            
        }
        
        .navigationTitle("Todo List 📃")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
        .foregroundColor(.accentColor)
    }
    
    
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        ListView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
    }
}

