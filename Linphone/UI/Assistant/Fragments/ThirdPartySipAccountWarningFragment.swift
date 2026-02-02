/*
 * Copyright (c) 2010-2023 Belledonne Communications SARL.
 *
 * This file is part of linphone-iphone
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import SwiftUI

struct ThirdPartySipAccountWarningFragment: View {
	
	@ObservedObject private var coreContext = CoreContext.shared
	@ObservedObject var accountLoginViewModel: AccountLoginViewModel
	
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		NavigationView {
			GeometryReader { geometry in
				if #available(iOS 16.4, *) {
					ScrollView(.vertical) {
						innerScrollView(geometry: geometry)
					}
					.scrollBounceBehavior(.basedOnSize)
				} else {
					ScrollView(.vertical) {
						innerScrollView(geometry: geometry)
					}
				}
			}
			.navigationTitle("")
		 	.navigationBarHidden(true)
			.edgesIgnoringSafeArea(.bottom)
			.edgesIgnoringSafeArea(.horizontal)
		}
		.navigationViewStyle(StackNavigationViewStyle())
		.navigationTitle("")
		.navigationBarHidden(true)
	}
	
	func innerScrollView(geometry: GeometryProxy) -> some View {
		VStack {
			ZStack {
				HStack {
					Image("caret-left")
						.renderingMode(.template)
						.resizable()
						.foregroundStyle(Color.grayMain2c500)
						.frame(width: 25, height: 25)
						.padding(.all, 10)
						.onTapGesture {
							withAnimation {
								dismiss()
							}
						}
					Spacer()
				}
				
				Text("assistant_login_third_party_sip_account")
					.default_text_style_800(styleSize: 20)
			}
			.frame(width: geometry.size.width)
			.padding(.top, 10)
			.padding(.bottom, 20)
			
			Spacer()
			
			VStack(alignment: .leading) {
				HStack {
					Spacer()
					
					Spacer()
				}
				.padding(.bottom, 40)
				
				HStack {
					Spacer()
					
					
					Spacer()
				}
				.padding(.vertical)
			}
			.frame(maxWidth: SharedMainViewModel.shared.maxWidth)
			.padding(.horizontal, 20)
			
			Spacer()
			
			NavigationLink(destination: {
				ThirdPartySipAccountLoginFragment(accountLoginViewModel: accountLoginViewModel)
			}, label: {
				Text("assistant_third_party_sip_account_warning_ok")
					.default_text_style_white_600(styleSize: 20)
					.frame(height: 35)
					.frame(maxWidth: .infinity)
				
			})
			.padding(.horizontal, 20)
			.padding(.vertical, 10)
			.background(Color.orangeMain500)
			.cornerRadius(60)
			.frame(maxWidth: SharedMainViewModel.shared.maxWidth)
			.padding(.horizontal)
			.padding(.bottom)
			
			Image("mountain2")
				.resizable()
				.scaledToFill()
				.frame(width: geometry.size.width, height: 60)
				.clipped()
		}
		.frame(minHeight: geometry.size.height)
	}
}

#Preview {
	ThirdPartySipAccountWarningFragment(accountLoginViewModel: AccountLoginViewModel())
}
