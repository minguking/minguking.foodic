//
//  AllFood.swift
//  practiceMakesPerfecto
//
//  Created by Kang Mingu on 13/05/2020.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

/*
 
 {
 "nameKor":"텃만쿵",
 "nameEng":"Tod man kung",
 "namdThai":"ทอดมันกุ้ง",
 "recipe":"fried",
 "recepieKor":"튀김",
 "ingredient":"shrimp",
 "ingredientKor":"새우",
 "description":"Simple and tasty. Deep fried shrimp. It's very easy to find especially around the beach or resort area. Ideal with beer.",
 "descriptionKor":"간단한 요리입니다. 다진 새우 튀김. 레시피가 간단하고 튀김이라는 사기적인 조리법 특성 상 어디서 먹든 기본적인 맛은 보장됩니다. 선선한 밤, 맥주를 곁들인 텃만꿍은 정말 환상적이죠. 특히 해수욕장이나 수영장이 가까운 리조트, 해변도시일 경우에 더더욱 그렇습니다.",
 "price":"$",
 "tag":""
 },
 */

import UIKit

struct AllFood: Decodable {
    let nameKor: String
    let nameEng: String
    let namdThai: String
    let recipe: String
    let recepieKor: String
    let ingredient: String
    let ingredientKor: String
    let description: String
    let descriptionKor: String
    let price: String
    let tag: String
    
    
    var recipeDetail: String {
        switch recipe {
        case "fried":
            return "this is fried"
        case "roasted":
            return "This is roasted"
        default:
            return "this is nothing"
        }
    }
}
