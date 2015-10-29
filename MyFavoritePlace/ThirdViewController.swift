//
//  ThirdViewController.swift
//  MyFavoritePlace
//
//  Created by Stoyan Yordanov Kostov on 10/28/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var pageViewController: UIPageViewController!
        var dataSource = [Asset]()
        var viewControllers = [MWAPageContentViewController?]()
        
        override func viewDidLoad()
        {
            super.viewDidLoad()
        
            let images = ["aleksander_nevski","nationalTheatre","old_mineral_baths","saintSofia","Sofia_at_night","sofia_sightseeing", "tzum"]
            let descriptions = [
                "The St. Alexander Nevsky Cathedral, is a Bulgarian Orthodox cathedral in Sofia, the capital of Bulgaria.",
                "The Ivan Vazov National Theatre is Bulgaria's national theatre, as well as the oldest and most authoritative theatre in the country and one of the important landmarks of Sofia, the capital of Bulgaria.",
                "The Central Mineral Baths is a landmark in the centre of Sofia, the capital of Bulgaria, a city known for the mineral springs in the area.",
                "The Statue of Sveta Sofia is a monumental sculpture in Sofia, Bulgaria. The statue, erected in 2000, stands in a spot once occupied by a statue of Lenin.",
                "Sofia at night",
                "Sofia sightseeng",
                "TZUM-Sofia is an upmarket department store in the centre of Sofia, the capital of Bulgaria, officially opened in 1957 and situated in a monumental edifice on one of the city's main boulevards."]
            
            
            for var i=0; i < images.count ; i++ {
                let asset = Asset(imageName: images[i], description: descriptions[i], index: i)
                dataSource.append(asset)
            }
            
            updateUi()
        }
        
        
        func updateUi()
        {
            for var i = 0 ; i < dataSource.count ; i++ {
                if let vc = viewControllerFor(dataSource[i]) {
                    viewControllers.append(vc)
                }
            }
            
            if let pageVC = storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController {
                if let firstVC = viewControllers[0] {
                    pageViewController = pageVC
                    pageViewController.dataSource = self
                    pageViewController.delegate = self
                    
                    pageViewController.setViewControllers([firstVC], direction: .Forward, animated: true, completion: nil)
                    pageViewController.view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height-40)
                    addChildViewController(pageViewController)
                    view.addSubview(pageViewController.view)
                    pageViewController.didMoveToParentViewController(self)
                }
            }
        }
        
        func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
        {
            let pageVC = viewController as? MWAPageContentViewController
            var index = pageVC?.pageIndex
            
            if index == 0 || index == NSNotFound {
                return nil
            }
            
            index!--
            
            if let vc = viewControllers[index!] {
                return vc
            }
            
            return nil
        }
        
        func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
        {
            let pageVC = viewController as? MWAPageContentViewController
            var index = pageVC?.pageIndex
            
            if index == viewControllers.count - 1 || index == NSNotFound {
                return nil
            }
            
            index!++
            
            if let vc = viewControllers[index!] {
                return vc
            }
            
            return nil
        }
        
        func viewControllerFor(assetData: Asset) -> MWAPageContentViewController?
        {
            let pageVC = storyboard?.instantiateViewControllerWithIdentifier("MWAPageContentViewController") as? MWAPageContentViewController
            pageVC?.asset = assetData
            
            return pageVC
        }

        func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
        {
            return viewControllers.count
        }
        
        func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
        {
            return 0
        }
    

}
