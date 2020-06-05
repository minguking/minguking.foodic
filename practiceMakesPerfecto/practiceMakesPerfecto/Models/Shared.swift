//
//  Shared.swift
//  practiceMakesPerfecto
//
//  Created by Kang Mingu on 12/05/2020.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

/*
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
*/


import UIKit

class Sharing {
    
    static let shared = Sharing()
    
    let backGroundColor = UIColor(red: 150/255, green: 140/255, blue: 120/255, alpha: 1.0)
    
    var firstDetailTitleKor: String?
    var firstDetailTitleEng: String?
    
    var recipeDetailEng: String {
        switch firstDetailTitleEng {
        case "Foodic":
            return "this is foodiC motherfucker!!"
        default:
            return "this is \(firstDetailTitleEng!), this is \(firstDetailTitleEng!), this is \(firstDetailTitleEng!), this is \(firstDetailTitleEng!), this is \(firstDetailTitleEng!), this is \(firstDetailTitleEng!), this is \(firstDetailTitleEng!), this is \(firstDetailTitleEng!)."
        }
    }
    
    var recipeDetailKor: String {
        switch firstDetailTitleKor {
        case "Foodic":
            return "우리는 foodiC이다!! motherfucker!!"
        default:
            return "이것은 \(firstDetailTitleKor!)입니다."
        }
    }
    
    
    
    var secondDetailTitleKor: String?
    var secondDetailTitleEng: String?
    
    var ingredientDetailEng: String {
        switch secondDetailTitleEng {
        case "Foodic":
            return "this is foodiC motherfucker!!"
        default:
            return "This is \(secondDetailTitleEng!), This is \(secondDetailTitleEng!),This is \(secondDetailTitleEng!),This is \(secondDetailTitleEng!),This is \(secondDetailTitleEng!),This is \(secondDetailTitleEng!),This is \(secondDetailTitleEng!),This is \(secondDetailTitleEng!),This is \(secondDetailTitleEng!),"
        }
    }
    
    var ingredientDetailKor: String {
        switch secondDetailTitleKor {
        case "Foodic":
            return "우리는 foodiC이다!! motherfucker!!"
        default:
            return "이거것은 \(secondDetailTitleKor!)입니다."
        }
    }
    
    
    
}
