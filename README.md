# ecomathematics-project
Project for the Ecomathematics course made with Matlab

Forest management optimization

You are an owner of a forest. The total area of your forest is 100 ha. The forest is assumed to be homogeneous, i.e. similar over the whole forest area. The use of the forest has not been controlled so far, and different users have been cutting the forest for their own purposes. At the current situation, the whole forest is just clear cut. As the forest owner, you are now deciding the strategy of how to manage your forest in future.

Forest growth
The forest grows every year, depending on the year type (hot/cool, rainy/dry growing season etc.). Logistic growth model is used. The actual growth rate of the total volume follows normal distribution r ~ N(0.15, 0.05^2)/year (Normal distribution given as N(mean, variance)). The maximum volume of the forest is 900 m^3/ha, after which it no longer grows in volume. Part of the forest is also dying, the dying rate per year is 1% of the current volume.

Harvesting
Timber can be sold for the price 30 MU/m^3 (MU = monetary units). However, there are also costs to cut the forest: each cutting operation costs 800 MU/ha, independent of the workload performed. The forest can be thinned such that e.g. 40% of the trees/timber volume is cut and sold (harvesting rate 0.4), and 60% is left to the forest to grow. A general management routine is that the forest is thinned every Tper years (i.e. Tper is a constant), which is repeated two times (i.e. the thinning happens at time points t0 +Tper and t0 +2Tper, and after the next Tper years (at time point t0 + 3Tper) the forest is clear cut, i.e. 100% of the timber volume is cut and sold. After clear-cutting, new trees are planted, and the total volume of the forest is 10 m3/ha. Then a new management period with similar set of two thinnings and finally a clear cut. After thinning, the forest is assumed to grow with the same growth function as before (new trees grow in locations where old trees were cut and/or the old trees grow more because there is more space, light and nutrients per tree left).

The task: You want to plan the thinning period length Tper such that the present value of the profit gained from the forest is maximized. The discount rate which is assumed to be constant over time, is delta = 0.03. Find the optimal thinning period length, Tper, using a total planning period of T = 91 years.
