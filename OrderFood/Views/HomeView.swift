//
//  HomeScreen.swift
//  OrderFood
//
//  Created by Priyanshi Bhikadiya on 07/10/24.
//

import SwiftUI

enum DishCategory: String {
    case hottest = "Hottest"
    case popular = "Popular"
    case newCombo = "New Combo"
    case top = "Top"
}

struct HomeView: View {
    
    @State private var searchText: String = ""
    @State private var selectedCategory: DishCategory = .popular
    @AppStorage("firstName") private var name: String = ""
    
    @ObservedObject var viewModel = DishViewModel()
    
    var categories: [DishCategory] = [.hottest, .popular, .newCombo, .top]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(.icMenu)
                        Spacer()
                        
                        NavigationLink(destination: OrderCheckOutScreen()) {
                            VStack {
                                Image(.icShoppingBasket)
                                Text("My basket")
                                    .foregroundStyle(._27214_D)
                                    .font(.system(size: 10))
                            }
                        }
                        
                    }
                    
                    HStack {
                        Text("Hello \(name), ")
                            .foregroundStyle(._27214_D)
                            .font(.system(size: 20)) +
                        Text("What fruit salad combo do you want today?")
                            .foregroundStyle(._27214_D)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding(.top, 20)
                    
                    HStack {
                        CustomTextField(text: $searchText, placeHolder: "Search for fruit salad combos")
                        Image(.icFilter)
                        
                    }
                    .padding(.top, 25)
                    
                    ScrollView(showsIndicators: false) {
                        Text("Recommended Combo")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: columns) {
                                ForEach(viewModel.dishes, id: \.id) { dish in
                                    DishView(dish: dish)
                                        .frame(width: 170, height: 190)
                                        .padding(5)
                                }
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.flexible())]) {
                                ForEach(categories, id: \.rawValue) { category in
                                    DishCategoryView(category: category, isSelected: category == selectedCategory)
                                        .onTapGesture {
                                            selectedCategory = category
                                        }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 20)
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.flexible())]) {
                                ForEach(viewModel.hottestDishes, id: \.id) { dish in
                                    DishView(dish: dish)
                                        .padding(5)
                                }
                            }
                            .padding(.top, 20)
                            
                        }
                        
                    }
                    .padding(.top, 25)
                    
                }
                .padding()
                
            }
        }
        Spacer()
        
    }
}

#Preview {
    HomeView()
}

struct DishView: View {
    var dish: Dish
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            
            ZStack {
                Image(dish.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                Button {
                    
                } label: {
                    Image(.icUnfavourite)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x: -0, y: -35)
                
            }
            .padding(.top, 10)
            
            Text(dish.name)
                .font(.system(size: 16, weight: .medium))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            HStack {
                Text("$ \(String(dish.price))")
                    .font(.body)
                    .foregroundStyle(.FFA_451)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button {
                    let orderDish = DishOrder(orderId: dish.id, name: dish.name, image: dish.image, price: dish.price, quantity: 1, isFavourite: dish.isFavourite)
                    self.modelContext.insert(orderDish)
                                        
                } label: {
                    Image(.icPlus)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                
            }
            .padding(.top, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 2)
    }
}

struct DishCategoryView : View {
    
    var category: DishCategory
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 2) {
            Text(category.rawValue)
                .font(.system(size: isSelected ? 24 : 16, weight: .medium))
                .foregroundStyle(isSelected ? .black : ._938_DB_5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if isSelected {
                Rectangle()
                    .foregroundStyle(.FFA_451)
                    .frame(width: 22, height: 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(8)
    }
}

#Preview {
    DishCategoryView(category: .hottest, isSelected: false)
}

