---
layout: post
title:  "Intro. to Machine Learning"
categories: course eecs445 cheatsheet
---

```
Basic probability and statistics
	Marginal and conditional probability
	Independence
	Bayes rule
	Expectation, variance, etc.
Basic Linear Algebra, Multivariable Calculus, Convex Functions
	Linear independence
	Eigenvalues
	Vector derivatives
	Definition of Convexity
	Gradient descent + Stochastic Gradient Descent
	Newton's method
```

## Overview

* Supervised Learning
	* Continuous-valued labels: Regression
	* Discrete-valued labels: Classification

* Linear classfiers
	* Generative models
		* e.g. Naive Bayes
		* Learns class-conditional probability $$P(X \vert Y)$$ and lable densities $$P(Y)$$ from traning data
		* Require discrete data
		* $$y = \mathrm{argmax}_{k}P(X = x^{new} \vert Y = k)P(Y =  k)$$

	* Discriminative models
		* e.g. Logisitic regression, Perceptron
		* Learns posterior $$P(Y \vert X)$$ directly from training data
		* $$y = \mathrm{argmax}_{k}P(X = x^{new} \vert Y = k)$$
		
* Non-linear classfiers: Decision tree

### Underfitting vs. Overfitting
* Underfitting: fits training data and testing data badly
* Overfitting: fits training data well but testing data badly; coefficients would be huge
* As data size increases, overfitting diminishes





## Linear Regression

### Notations
* $$x_n \in \mathbb{R}^D$$: nth data
* $$\phi(x_n) = (\phi_1(x_n), ..., \phi_M(x_n)) \in \mathbb{R}^M$$: features for data $$x_n$$
* $$t = (t_1, ..., t_N) \in \mathbb{R}^N$$: target
* $$w = (w_1, ..., w_M)$$: parameters
* $$\Phi = (\phi(x_1)^T, ..., \phi(x_N)^T)$$: design matrix

* Prediction: $$y(x_n, w) = w^T \phi(x_n) = \phi(x_n)^T = \Phi w$$

### Gradient Descent
* $$E(w) = E_D(w) + E_W(w)= \frac{1}{2}\sum_{n = 1}^N (w^T\phi(x_n) - t_n)^2 + \frac{\lambda}{2} ||w||^2$$
* $$\nabla_w E(w) = \lambda w + \sum_{n=1}^N (w^T\phi(x_n) - t_n)\phi(x_n)$$

### Closed Form Optimization
* Paticular to linear regression; not applicable in general
* $$E(w) = \frac{1}{2}||\Phi w - t||^2 + \frac{\lambda}{2}w^T w = \frac{1}{2} w^T \Phi^T \Phi w - t^T \Phi w + \frac{1}{2} t^T t + \frac{\lambda}{2}w^T w$$
* $$\nabla_w E(w) = (\Phi^T \Phi + \lambda I) w - \Phi^T t$$
* $$\hat{w} = (\Phi^T \Phi + \lambda I)^{-1}\Phi^T t = \Phi^+ t$$
* If $$\lambda = 0$$, and $$\Phi^T \Phi$$ is not invertible, $$\hat{w} = (\Phi^T \Phi)^+\Phi^T t = \Phi^+ t$$
* If $$\lambda > 0$$, $$\Phi^T \Phi + \lambda I$$ is always invertible

### Probablistic Interpretation
* Regular least squares regression is just MLE
* Regularized least squares regression is just MAP

* MLE: $$\theta_{MLE} = \mathrm{argmax}\prod_{n = 1}^N p(t_n \perp \theta)$$

* MAP: $$\theta_{MAP} = \mathrm{argmax}\prod_{n = 1}^N p(\theta \perp t_n) = \mathrm{argmax}\prod_{n = 1}^N p(t_n \perp \theta)p(\theta)$$
	
Assume that $$\epsilon \sim N(0, \beta^{-1}I)$$ and $$w \sim N(0, \alpha^{-1}I)$$, we have $$\lambda = \frac{\alpha}{\beta}$$





If $$x \sim N(0, \sigma^2), \quad p(x) = \frac{1}{\sqrt{2\pi\sigma^2}} \exp\left(\frac{x^2}{2\sigma^2}\right)$$

If $$w \sim N(0, \sigma^2 I),\quad p(w) = \frac{1}{\left(\sqrt{2\pi\sigma^2}\right)^N} \exp\left(-\frac{1}{2\sigma^2 } \sum_{n=1}^N w_n^2\right)
$$





## Logistic Regression

### Binary classification

* **Sigmoid function**
	* $$\sigma(a) = \frac{1}{1 + e^{-a}} = \frac{e^a}{1 + e^a}$$
* We want to pick the larger one of $$P(y = 1\ |\ x)$$ and $$P(y = 0\ |\ x)$$
* $$a = \ln\frac{P(y = 1\ |\ x)}{P(y = 0\ |\ x)} \Rightarrow P(y = 1\ |\ x) = \sigma(a), \quad P(y = 0\ |\ x) = 1 - \sigma(a)$$

* Likelihood
	* $$P(y_n\ |\ x, w) = \sigma(w^T \phi(x))^{y_n} \cdot (1 - \sigma(w^T \phi(x)))^{y_n}$$
	* $$P(y = t|x, w) = \prod_{n = 1} ^N P(y_n\ |\ x, w)$$

*  Negative log-likelihood loss
	* $$\begin{aligned}
	E(w) &= -\ln P(y = t\ |\ X, w)\\ &= \sum_{n = 1}^N \left(
	t_n \ln (1 + \exp(-w^T \phi(x_n))) + (1 - t_n) \ln (1 + \exp(w^T \phi(x_n)))
	\right)
	\end{aligned}$$
	* $$\nabla_w E(w) = \Phi^T(\sigma(\Phi w) - t)$$
	* $$\nabla_w^2 E(w) = \sum_{n = 1}^N \phi(x_n)r_n(w)\phi(x_n)^T$$, where $$r_n(w) = \sigma(w^T \phi(x_n))\cdot (1 - \sigma(w^T \phi(x_n)))$$
	* $$\nabla_w^2 E(w) = \Phi^T R(w)\Phi$$, where $$R(w) = \mathrm{diag}\{r_1(w), ..., r_N(w)\}$$


### Newton's Method
* Repeat until convergence
	* $$x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}$$ (to find the root)
	* $$x_{n+1} = x_n - \frac{f'(x_n)}{f''(x_n)}$$ (to find the stationary point)
	* $$x_{n+1} = x_n - (\nabla^2 f(x_n))^{-1}\ \nabla_xf(x_n)$$ (for multidimensional case)


* No closed-form solution exists

### Multi-class classification
* **Softmax / Normalized exponential**
	* $$p_k = \frac{e^{q_k}}{\sum_j e^j}$$

* Let $$W = w_{k = 1} ^K$$ (learned by MLE)
* $$P(y = j| x, W) = \frac{\exp(w_j^T\phi(w))}{\sum_{k = 1}^T w_k^T \phi(w)}$$
* Classification: $$y = \mathrm{argmax}_jP(y = j \perp x, W)$$



## Naive Bayes
* Assumption: conditionally independent

* $$C$$: number of classes
* $$D$$: number of features
* $$M$$: number of values each features can take
* $$\pi = (\pi_1, ..., \pi_C) \in \Delta^C$$: (class) priors 
	* The probability of $$y$$ to be in catagory $$c$$ is $$\pi_c$$
* $$\theta_{cd} = (\theta_{cd1}, ..., \theta_{cdM}) \in \Delta^M$$: posteriors / class-conditional probability 
	* Given that $$y$$ is in catagory $$c$$, the probability of $$x_d$$ to be in catagory $$m$$ is $$\theta_{cdm}$$

* $$y = \mathrm{argmax}_c P(y\ |\ x, \theta)= \mathrm{argmax}_c\ \pi_c\prod_{d = 1}^D \prod_{m = 1}^M \theta_{cdm}^{1(m = x_d^{new})}$$

**How to get $$\pi$$ and $$\theta$$?**

### MLE
* $$single\ likelihood = P((x_i, y_i)\ |\ \pi, \theta) = \prod_c \pi_c^{1(y_i = c)}
\cdot \prod_c \prod_d \prod_m \theta_{cdm}^{1(x_{nd} = m)1(y_n = c)}
$$
* $$\begin{split}
log\ likelihood &= \log P(D\ |\ \pi, \theta)\\
&= \prod_n\prod_c 1(y_n = c)\log\pi_c + \prod_n\prod_c\prod_d\prod_m 1(x_{nd} = m)1(y_n = c)\log\theta_{cdm}
\end{split}$$
* $$\hat{\pi}_c = \frac{N_c}{N}$$
* $$\hat{\theta }_{cdm} = \frac{N_{cdm}}{N}$$


### MAP
Problem occurs when

* A word occurs in every training samples
* Black Swan Paradox: a word never appears in training

Dirichlet priors

* $$p(u; \alpha) = Z(\alpha)u_1^{\alpha_1 - 1} \cdots u_M^{\alpha_M - 1}$$
* $$Z(\alpha)$$ is the normalization constant

Assuming a Dirichlet distribution for parameters

* $$\pi \sim \mathrm{Dirichlet}(\alpha_1, ..., \alpha_C), \quad \theta_{cd} \sim \mathrm{Dirichlet}(\beta_{cd1}, ..., \beta_{cdM})$$
* $$\hat{\pi}_c = \frac{N_c + \alpha_c - 1}{N + \sum_{i = 1}^C(\alpha_i - 1)}, \quad \hat{\theta }_{cdm} = \frac{N_{cdm} + \beta_{cdm} - 1}{N_c + \sum_{i = 1}^M (\beta_{cdi - 1})}$$
* $$\alpha, \beta$$ can be seen as pseudocounts. Called Laplace Smoothing when they are all 1

#### Mean Estimates
* $$\pi|D \sim \mathrm{Dirichlet (N_1 + \alpha_1, ..., N_C + \alpha_c)}$$
* $$\theta_{cd}|D \sim \mathrm{Dirichlet} (N_{cd1} + \beta_{cd1}, ..., N_{cdM} + \beta_{cdM})$$
* $$\hat{\pi}_c = \frac{N_c + \alpha_c}{N + \sum_{i = 1}^C \alpha_i}, \quad \hat{\theta }_{cdm} = \frac{N_{cdm} + \beta_{cdm}}{N_c + \sum_{i = 1}^M \beta_{cdi})}$$
 
	
## Support Vector Machine

* Hyperplane: $$H = \{x: w^T x + b = 0\}$$
* Distance between a point $$z$$ and the hyperplane $$H$$:
	* $$\text{Writing } z \text{ as } z = z_0 + r \cdot \frac{w}{||w||}, \text{ where } z_0 \in H,\ r\cdot\frac{w}{||w||} \perp H$$
	* $$|r| = \frac{|w^T z + b|}{||w||}$$
* Classification: $$y = \mathrm{sign}(w^T x + b)$$
* Functional **margin**: $$\rho = \min\limits_{i}\frac{w^T x_i + b}{\|w\|}$$


### Hard-Margin SVM
$$
\begin{split}
\underset{w, b}{\text{minimize}} \quad & \frac{1}{2}{\| w \|}^2\\\
\text{subject to} \quad & -(t_i(w^T x_i + b) - 1) \leq 0 \quad \forall i \\
\quad
\end{split}
$$

### Optimal Soft-Margin Hyperplane
$$
\begin{split}
\underset{w, b, \xi}{\text{minimize}} \quad & \frac{1}{2}{\| w \|}^2 + \frac{C}{n} \sum_{i = 1}^n \xi_i\\
\text{subject to} \quad & - \left( t_i(w^Tx_i + b) -1 + \xi_i \right) \leq 0 \quad \forall i\\
 \quad & -\xi_i \leq 0 \quad \forall i\\
\end{split}
$$
    
* **Lagrangian**

$$
\begin{split}
L(w, b, \xi, \alpha, \beta)
= \frac{1}{2} {\|w\|}^2  - w^T \sum \nolimits_{i = 1}^n \alpha_i t_i x_i - \sum \nolimits_{i = 1}^n \alpha_i t_i b + \sum \nolimits_{i = 1}^n \left( C/n - \alpha_i - \beta_i \right) \xi_i + \sum \nolimits_{i = 1}^n \alpha_i
\end{split}
$$

* Dual
$$
\begin{split}
& L_D(\alpha, \beta) = -\frac{1}{2} \sum \nolimits_{i,j = 1}^n \alpha_i \alpha_j t_i t_j x_i^T x_j + \sum \nolimits_{i = 1}^n \alpha_i \\
\end{split}
$$

$$
\boxed{
\begin{split}
\underset{\alpha, \beta}{\text{maximize}} \quad &  -\frac{1}{2} \sum \nolimits_{i,j = 1}^n \alpha_i \alpha_j t_i t_j x_i^T x_j + \sum \nolimits_{i = 1}^n \alpha_i\\
\text{subject to} \quad & 0 \leq \alpha_i \leq C/n \quad \forall i\ \\
\quad & \sum \nolimits_{i=1}^n \alpha_i t_i = 0    
\end{split}}
$$

* $$w^* = \sum_{i = 1} ^ n \alpha_i^* t_i x_i, \quad b^* = t_i - w^{*T}x_i$$



## Loss functions and bias-variance tradeoff
* Regression loss function
	* Quadratic loss: $$L(y, \hat{f}) = (y - \hat{f})^2$$
	* Absolute loss: $$L(y, \hat{f}) = \perp y - \hat{f} \perp$$
* Classification loss function
	* Sigmoid loss: $$L(y, \hat{f}) = \mathrm{sigmoid}(- y\hat{f})$$
	* Zero-one loss: $$L(y, \hat{f}) = I(y \not = \hat{f})^2$$
	* Hinge loss:$$ L(y, \hat{f}) = \max(0, 1 - y\hat{f})$$
	* Logistic loss:$$ L(y, \hat{f}) = \log(1 + \exp(-y\hat{f}))$$
	* Exponential loss: $$L(y, \hat{f}) = \exp(-y\hat{f})$$

* Risk is the expected loss or error


* Variance
	* Captures how much a learning method moves around the mean.
	* How different can one expect the hypotheses of a given model to be?
	* How sensitive is an estimator to different training sets?
	* High variance model
		* Model represents the training set well
		* Overfit to noise or unrepresentative training data
		* Poor generalization performance

* Bais
	* Captures the errors caused by the simplifying assumptions of a model
	* Captures the average errors of a model across different training sets
	* High bais model
		* Simplistic models
		* Fail to capture regularities in the data
		* May give better generalization performance

* Simple models have high bias and low variance (underfitting)
* Complex models have low bias and high variance (overfitting)


* $$E[y] = f, \quad \mathrm{Var}[y] = E[\epsilon^2] = \sigma^2$$
* $$E[(y - \hat{f})] = \sigma^2 + \mathrm{Var}[\hat{f}] + E[f - E_S[\hat{f}]]^2 = \text{error + variance + bias^2}$$



## Information Theory

* **Information content** of an event of probability $$p$$: $$I(p) = \log\frac{1}{p}$$
	* Measures how surprised we are by an outcome
	* Measures the optimal code length, for messages drawn from $$p$$
 
* **Entropy** of a discrete random variable $$X$$ with distribution $$p$$: $$H[X] = E[I[p(X)]] = -\sum_{x \in X} p(x)\log p(x)$$
	* or $$H(p) = -\sum_{i} p_i \log_2 p_i$$
	* If $$X$$ is binary, $$H[X] = -p\log p + (1 - p)\log(1 - p)$$
	* Measures how surprised we are on average
	* Highest when $$X$$ is close to uniform

* **Cross entropy**: $$H(p, q) = -\sum_{x \in X} p(x)\log q(x) = - E_p[\log q(x)] \geqslant H(p)$$
	* Measures average number of bits needed to encode message from $$p$$ when we use a code optimal for $$q$$

* **Relative entropy / Kullback-Leiber divergence**: $$D_{KL}(p \| q) = H(p, q) - H(p) = \sum_{x \in X}p(x)\log\frac{p(x)}{q(x)}$$
	* Measures the number of extra bits needed to encode messages from $$p$$ when we use a code optimal for $$q$$

* **Mutual Information**: $$I(X; Y) = \sum_{x \in X} \sum_{y\in Y} p(x,y) \log\frac{p(x,y)}{p(x)p(y)} = D_{KL}(p(x, y) \| p(x)p(y))$$
	* Measures how dependent $$X$$ and $$Y$$ are
	* $$X$$ and $$Y$$ are independent iff $$I(X; Y) = 0$$

* **Pointwise mutual information**: $$\mathrm{pmi} (x; y) = \frac{p(x,y)}{p(x)p(y)}$$
	* Measures to the extent $$x$$ and $$y$$ co-occur more frequently than expected
	* Used to find collocations

## Decision Tree

* **Conditional entropy**: $$H(Y|X) = \sum_{x \in X}H(Y \perp X = x) = \sum_{x \in X}\sum_{y \in Y} p(x,y) \log\frac{p(x)}{p(x,y)}$$

* **Information gain**: $$IG(P, a) = H(P) - H(P \perp a)$$
	* Information gain  = entropy(parent) - weighed sum of entropy(child)
	* Measures teh reduction in entropy gained iby observing an attribute
	* Euivalent to mutual information $$IG(X, Y) = D_L(p(x, y) \| p(x)p(y))$$

* **Metrics / Misclassification error**: $$I(N) = 1 - \max\limits_i P(i \vert N)$$ for every query node $$N$$
	* When the node provides no information, $$I(N) = \max I(N) = 1 - 1/K$$ ($$K$$ is the number of target classes)


