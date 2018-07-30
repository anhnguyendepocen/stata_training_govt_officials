		
	* Initiate the latex doc
	texdoc init "$script\stata_workshop_for_govt_officials", replace ///
		gropts(optargs(width=0.8\textwidth))
	
	/***
	% Set document type and scheme
	\documentclass[10pt]{beamer}
	\usetheme[progressbar=frametitle]{metropolis}

	% Load packages
	\usepackage{appendixnumberbeamer}
	\usepackage{booktabs}
	\usepackage[scale=2]{ccicons}
	\usepackage{pgfplots}
	\usepackage{xspace}
		\newcommand{\themename}{\textbf{\textsc{metropolis}}\xspace}
	\usepackage{stata}
	\usepackage{graphicx}

	\title{Stata Workshop} %% that will be typeset on the
	\subtitle{At MINAGRI} %% title page.
	\author{Roshni Khincha and Sakina Shibuya \\ DIME, World Bank}
	\date{August, 2018}

	\titlegraphic{%
		\includegraphics[width=.2\textwidth]{DIME}\hfill % I think I should probably ask for a better image for this thing....
		\includegraphics[width=.15\textwidth]{logo_minagri}\hfill
		\includegraphics[width=.2\textwidth]{logo_eu}
		}

	\makeatletter
	\setbeamertemplate{title page}{
		\begin{minipage}[b][\paperheight]{\textwidth}
			\vfill%
			\ifx\inserttitle\@empty\else\usebeamertemplate*{title}\fi
			\ifx\insertsubtitle\@empty\else\usebeamertemplate*{subtitle}\fi
			\usebeamertemplate*{title separator}
			\ifx\beamer@shortauthor\@empty\else\usebeamertemplate*{author}\fi
			\ifx\insertdate\@empty\else\usebeamertemplate*{date}\fi
			\vfill
			\ifx\inserttitlegraphic\@empty\else\inserttitlegraphic\fi
			\vspace*{1cm}
		\end{minipage}
		}
	\makeatother

	\begin{document}
		
	\maketitle

	\section{Section 1}

		% 1.1 Why learn stata?
		\begin{frame}
		
			\frametitle{\textsc{Why learn stata?}}
			\begin{center}
				\textbf{Excel vs Stata} \\ \text{Can I use Excel?}
			\end{center}
		
		\end{frame}

		
		\begin{frame}
			\frametitle{\textsc{Why learn stata?}}
			\begin{center}
				\Large\textbf{The main reasons to use Stata}
			\end{center}
			\begin{itemize}
				\item In Excel you make changes directly to the data and save new versions of the data set
			
				\item In Stata you make changes to the instructions on how to get from the raw data to the final analysis and save new versions of the instructions
			
				\item Since Stata is a more statistics oriented software, processing the data to create analytical products can be a lot easier. 
			
			\end{itemize}
		\end{frame}



		\begin{frame}
			\frametitle{\textsc{Why learn stata?}}
			\begin{center}
				\Large\textbf{The main reasons to use Stata}
			\end{center}
			\begin{itemize}
				\item Powerful tool with may capabilities:
				
				\begin{itemize}
					\item Descriptive statistics
					
					\item Inference statistics
					
					\item Complex data analysis
					
				\end{itemize}
				
				\item But it’s also good for beginner programmers:
				
				\begin{itemize}
					\item User friendly interface
					
					\item Relatively easy programming language that can be learned while you’re using the software
					
				\end{itemize}
			\end{itemize}
		\end{frame}	

		\begin{frame}
			\frametitle{\textsc{Why learn stata?}}
			\begin{center}
				\Large\textbf{What's the fuss about do-files?}
			\end{center}
			\begin{itemize}
				\item It’s through the do-file you communicate your work to other members in your team, both current and future
				\item Think of the do-files as instructions on how to get from raw data to final report
				\item For a simple task you can enter commands manually. But for more complex tasks you need to write a recipe, or a list of instructions
				
				\end{itemize}
			\end{frame}
		
	\begin{frame}
		\frametitle{\textsc{The basics of Stata}}
		\begin{center}
			\textbf{Stata interface}
		\end{center}
	\end{frame}
		
		
	\begin{frame}
		\frametitle{\textsc{The Stata interface}}
		
		\begin{figure}[H] 
		\centering
		\includegraphics[width=0.9\linewidth]{stata_interface}
		\end{figure}
	\end{frame}

	\begin{frame}

		\frametitle{\textsc{The Stata interface}}
			\begin{center}
				\textbf{The review window} 
			\end{center}
		\begin{itemize}
			\item  Provides a history of your actions
			\item  A convenient way to bring back your previous commands and modify it to do something new
			\item Double click on a command you want to use again and it will appear in your command window
			\begin{itemize}
				\item You can also click in command window and select the commands in the result window by using \textit{PageUp/PageDown} buttons (or \textit{fn+ArrowUp/ fn+ArrowDown} on Mac)
			\end{itemize}
			\item If a command is \textcolor{red}{red} in the review window, it means it did not finish because an error
		\end{itemize}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{The Stata interface}}
		\begin{center}
			\textbf{Filtering in variable and review windows} 
		\end{center}
	\begin{minipage}{0.45\linewidth}
		\begin{itemize}
			\item  Both the variable and the review window will soon be very crowded. You can then search both of them for commands/variables
			
			\item  If you do not see the search bar, click the little funnel symbol
			
			
		\end{itemize}
	\end{minipage}
 	\hfill
	\begin{minipage}{0.45\linewidth}
		\begin{figure}[H] 
			\centering
			\includegraphics[width=0.75\linewidth]{review_window}
		\end{figure}
		\begin{figure}[H] 
			\centering
			\includegraphics[width=0.75\linewidth]{variable_window}
		\end{figure}
	\end{minipage}
	\end{frame}


 
		\begin{frame}

			\frametitle{\textsc{The basics of Stata}}
			\begin{center}
				\textbf{How to open a data set in Stata} 
			\end{center}

		\end{frame}


		\begin{frame}
			\frametitle{\textsc{Opening datasets}}
			\begin{center}
				\Large\textbf{Three ways to tell Stata what to do}
			\end{center}
			\begin{itemize}
				\item Drop-down menus
				
				\begin{itemize}
					\item An easy place to start but quickly becomes inefficient
					
				\end{itemize}
				
				\item Command window
				
			\begin{itemize}
				\item Faster than menus but require that you are familiar with the command
				
			\end{itemize}
				\item Do-file
				
			\begin{itemize}
				\item The only feasible way to run long instructions
				
				\item Use menus and command window to figure out what you need to write, then copy to a do file
				
			\end{itemize}
			\end{itemize}
		\end{frame}



		\begin{frame}
			\frametitle{\textsc{Opening datasets}}
			\begin{center}
				\Large\textbf{Open a dataset - menus}
			\end{center}
			 \begin{figure}[H] 
				\centering
				\includegraphics[width=0.9\linewidth]{open_dataset_menu}
			\end{figure}
		\end{frame}

	\begin{frame}
		\frametitle{\textsc{Opening datasets}}
		\begin{center}
			\Large\textbf{Open a dataset - command window}
		\end{center}
		\begin{figure}[H] 
			\centering
			\includegraphics[width=0.9\linewidth]{open_dataset_command}
		\end{figure}
		\begin{itemize}
			\item When you use the menus, Stata produces the code for that action (except for Data Browse)
			\begin{itemize}
				\item Highlight, right-click and copy the code
				\item Paste the code in the command window
				\item Hit enter
			\end{itemize}
		\end{itemize}
	\end{frame}


	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}
			\Large\textbf{Task 1}
		\end{center}
		\begin{enumerate}
			\item Open Stata and then open the EICV household data set \textbf{cs\_s0\_s5\_household.dta} using the menu: File $\rightarrow$ Open. Navigate to where you saved the material for this lab. Select the data set and click \textit{Open}
			\item Browse to check that you have data: Data  $\rightarrow$ Data Editor  $\rightarrow$ Data Editor Browse 
			\item Describe to get additional information on the data: Data  $\rightarrow$ Describe data $\rightarrow$ Describe data in memory or in a file.
			\begin{itemize}
				\item A new window will open
				\item Select In memory and press OK
			\end{itemize}
		\end{enumerate}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}
			\Large\textbf{Task 1}
		\end{center}
		\begin{itemize}
			\item You can see that one the second command printed information on your screen.
			\begin{itemize}
				\item The first part is the command used
				\item The second part are the results
			\end{itemize}
		\end{itemize}

		 \begin{figure}[H] 
				\centering
				\includegraphics[width=0.9\linewidth]{task1}
		\end{figure}
	\end{frame}



	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}
			\Large\textbf{Task 1}
		\end{center}
		\begin{itemize}
			\item You can perform both tasks by typing the in your command prompt. This will yield the same results
			
			\item Type \textit{browse} in the command window and press enter
			
			\item Type \textit{describe} and press enter
			
		\end{itemize}
	\end{frame}





	\begin{frame}
		\frametitle{\textsc{The basics of stata}}
		\begin{center}
			\Large\textbf{Exploring a data set opened for the first time}
		\end{center}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Exploring a new dataset}}
		\begin{center}
			\Large\textbf{Introduction}
		\end{center}
		\begin{itemize}
			\item To successfully clean a data set you must first understand the data set
			\item Some terminology:
			\begin{itemize}
				\item Columns are called variables
				\item Rows are called observations
			\end{itemize}
		\end{itemize}
	\end{frame}
		
		
	\begin{frame}
		\frametitle{\textsc{Exploring a new dataset}}
		\begin{center}
			\Large\textbf{The EICV data}
		\end{center}
		\begin{itemize}
			\item For our exercises we will explore part of EICV 4 data
			\item The data is a household survey collected between 2013 and 2014 by NISR
			\item It is a cross-section of more than 14 thousand Rwandese households both in rural and urban areas
			\item Close to 2 thousand of these households form a panel have been also interviewed in EICV 3		
		\end{itemize}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Exploring a new dataset}}
		\begin{center}
			\Large\textbf{Types of variables}
		\end{center}
		\begin{itemize}
			\item 	In Stata, each variable (column) has to be either:
			\begin{itemize}
				\item string (text) – values are red when browsing
				\item numeric (number) – values are black or blue when browsing
			\end{itemize}
			\item Numbers \textbf{can} be stored as text, but text \textbf{cannot} be stored as number
			\begin{itemize}
				\item Not possible to do computations on numbers stored as text 		
			\end{itemize}
			\item Categorical variables should be stored as numeric variables and have labels
		\end{itemize}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Exploring a new dataset}}
		\begin{center}
			\Large\textbf{How the data looks}
		\end{center}	
		\begin{figure}[H] 
			\centering
			\includegraphics[width=0.9\linewidth]{dataset1}
		\end{figure}
	\end{frame}
	\begin{frame}
		\frametitle{\textsc{Exploring a new dataset}}
		\begin{center}
			\Large\textbf{How the data actually is}
		\end{center}	
		\begin{figure}[H] 
			\centering
			\includegraphics[width=0.9\linewidth]{dataset2}
	\end{figure}	
	\end{frame}


	\begin{frame}
		\frametitle{\textsc{Exploring a new dataset}}
		\begin{center}
			\Large\textbf{Useful commands}
		\end{center}
		\begin{itemize}
			\item 	\textit{\underline{br}owse}: see all data in spreadsheet format
			\item \textit{\underline{d}escribe}: list of all variables in memory
			\begin{itemize}
				\item Total number of variables \& observations (size of matrix)
				\item Variable name, type, format, value label name, variable label
			\end{itemize}
			\item \textit{\underline{su}mmarize}: Basic statistics for numeric variables
			\begin{itemize}
				\item Obs (Number of observations), Mean, Std. Dev. (Standard deviation), Min (Minimum), Max (Maximum)
			\end{itemize}
			\item \textit{\underline{tab}ulate}: frequencies
			
		\end{itemize}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Exploring a new dataset}}
		\begin{center}
			\Large\textbf{More commands}
		\end{center}
		\begin{itemize}
			\item 	\textit{codebook}: displays the following for each variable
		
			\begin{itemize}
				\item Type (more detail than describe)
				\item Number of unique values and number of missing values
				\item Range and units
				\item Examples of values (strings); tabulations (categorical); or mean, sd and percentiles (continuous)
				\item Warnings if embedded blanks (may or may not be ok)
			\end{itemize}
			\item \textit{labelbook}: displays the following for each stored value label
			\begin{itemize}
				\item Label definitions
				\item Which variables labels are applied to
			\end{itemize}
			\item \textit{\underline{l}ist}: lists all variables and observations
			\begin{itemize}
				\item Can qualify: \textit{“list if price \textless 5000”, “list in 1/10”}
			\end{itemize}
			\item \textit{\underline{su}mmarize, \underline{d}etail} : percentiles, variance, skewness, kurtosis
			
		\end{itemize}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}
			\Large\textbf{Task 2}
		\end{center}
		\begin{enumerate}
			\item Open the \textbf{cs\_s0\_s5\_household.dta} again. Use the command prompt this time.
			\item Explore the dataset
			\begin{itemize}
				\item browse - see the different colors in the columns
				\item describe - check the storage type column
				\item summarize - are there any statistics that might not make sense to interpret?
			\end{itemize}
			\item Learn more about the variable \textit{‘s5bq3a’}, the household estimated rent amount. What values does it take on? What is minimum, maximum, mean of this variable? How many unique values does it have?
		\end{enumerate}
		
	***/
		texdoc stlog, nooutput
			use "$data\cs_s0_s5_household.dta", clear
			tabulate s5bq3a
			summarize s5bq3a 
			codebook s5bq3a
		texdoc stlog close
	/***
		\end{frame}

	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}
			\Large\textbf{Task 2}
		\end{center}
		\begin{itemize}
			\item Learn more about the variable \textit{ur2012}, to learn about the proportion of urban and rural households in Rwanda
		\begin{itemize}
				\item
			
	***/
		texdoc stlog, nooutput	
			tabulate ur2012 
		texdoc stlog close
	/***	
				\item Create now a pie chart: Graphics $\rightarrow$ Pie chart, select \textit{ur2012} as Category variable and press OK
			\end{itemize}
		\item Now, create a pie-chart graph for the variable \textit{s5cq7}, the type drinking water source used. This time, use the command prompt!
			\begin{itemize}
				\item Use the code printed by the previous graph and replace the name of the variable
			\end{itemize}

		\end{itemize}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Tips and resources}}
		\begin{itemize}
			\item Using help - Type \textit{help summarize} to get documentation on the summarize function
			\item Using search - Type \textit{search regression} to get general documentation on running regressions in Stata
			\item Google - Search what you want to do. There are many resources online (e.g. Statalist)
			
		\end{itemize}
	\end{frame}
		
\section{Section 2}

	\begin{frame}
		\frametitle{\textsc{The basics of Stata}}
		\begin{center}
			\textbf{Editing data in Stata}
		\end{center}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Editing data in Stata}}
		\begin{center}
		\Large\textbf{Delete variables}
		\end{center}
		\begin{itemize}
			\item You can delete variables using the commands \textit{drop} or \textit{keep}
			\item Deleting variables is useful to
			\begin{itemize}
				\item Simplify a very complex data-set for you to work with	
				\item Reduce computational time when dealing with large data-sets
				\item Create temporary subsets of data for analytical purposes, like creating a table or graph
			\end{itemize}
			\item WARNING: be careful not save the new data on top of the original
		\end{itemize}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}
			\Large\textbf{Task 3}
		\end{center}
		\begin{itemize}
			\item Open the \textbf{cs\_s0\_s5\_household.dta} data set
		\end{itemize}
		***/
			texdoc stlog
			use "$data\cs_s0_s5_household.dta", clear
			texdoc stlog close
		/***
		\begin{itemize}
			\item Keep the variables we will use in this excerise by typing
		\end{itemize}
		***/
		texdoc stlog
			keep hhid province district ur2012 s5cq2 s5cq4 s5cq8 s5cq15 s5cq23 s5bq2 s5cq22 s5cq13 s5cq17 
		texdoc stlog close			
		/***
		\begin{itemize}
			\item Now let’s say we kept a few variables that we didn’t actually needed.To drop them, type
		\end{itemize}
		***/
		texdoc stlog
			drop province s5bq2 s5cq17 s5cq15
		texdoc stlog close	
		/***
	\end{frame}
	
	\begin{frame}
		\frametitle{\textsc{Editing data in Stata}}
		\begin{center}
			\Large\textbf{Renaming variables}
		\end{center}
		\begin{itemize}
			\item You can use the command \textit{rename} to change the names of your variables
			\item Renaming is useful as
			\begin{itemize}
				\item Can make your life easier when programming. Especially when the original variable names don’t make much sense
				\item It helps you remember what the variable means when a meaningful name is chosen
				\item Picking a short variable name reduces time when typing it
				
			\end{itemize}
		\end{itemize}
	\end{frame}
			
	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}
			\Large\textbf{Task 4}
		\end{center}
		\begin{itemize} 
			\item Rename all the remaining variables. Type the code bellow, one line at a time
		\end{itemize}
	***/
		texdoc stlog
			rename ur2012 	urban_2012
			rename s5cq2 	m_main_ws
			rename s5cq4 	m_used_ws
			rename s5cq8 	m_drink_ws
			rename s5cq13 	earnings_sell_w
			rename s5cq22 	d_affected_dis
			rename s5cq23	dis_type
		texdoc stlog close
	/***
	\end{frame}
	
	\begin{frame}
		\frametitle{\textsc{Editing data in Stata}}
		\begin{center}
			\Large\textbf{Generating variables}
		\end{center}
		\begin{itemize}
			\item You can use the command \textit{\underline{gen}erate} to create new variables		
			\item Generating variables can be useful to
			\begin{itemize}
				\item Change the values of a variable to a different measurement unit
				\item Create a dummy variable identifying if how many observations have a given characteristic
			\end{itemize}
		\end{itemize}		
	\end{frame}		
	
	
	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}
			\Large\textbf{Task 5}
		\end{center}
		\begin{itemize} 
			\item Let us create a variable that converts the number of meters to the main water source to centimeters. Type:
		\end{itemize}
	***/
		texdoc stlog
			generate  cm_main_ws = m_main_ws*100
		texdoc stlog close
	/***	
		\begin{itemize}
			\item Now get descriptives for the new variable using \textit{summarize}
		\end{itemize}
	\end{frame}
	
	
	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}
			\Large\textbf{Task 5}
		\end{center}
		\begin{itemize} 
			\item Let us create a dummy variable (that assumes values 0 or 1) to see if the main water source is the same as the used water source. 
			\item First create a variable that equals zero
		\end{itemize}
	***/
		texdoc stlog
			gen  d_closest_ws	 = 0
		texdoc stlog close
	/***	
		\begin{itemize}
			\item Now let’s replace that with 1 when it satisfies the condition that the two variables are equal. Type:
		\end{itemize}
	***/
		texdoc stlog
			replace d_closest_ws = 1 if m_main_ws == m_used_ws
		texdoc stlog close
	/***	
		\begin{itemize}
			\item Finally, tabulate the data using the function \textit{tabulate}
		\end{itemize}		
	\end{frame}
	
	\begin{frame}
		\frametitle{\textsc{Editing data in Stata}}
		\begin{center}
			\Large\textbf{Labeling variables and values}
		\end{center}
		\begin{itemize}	
			\item Labeling variables helps understand the variable 
			\item Value labels indicate what each category of a categorical variable stands for
			\item Labeling variables and values is essential for easier understanding in the future by you and others
		\end{itemize}
	\end{frame}
		
	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}	
			\Large\textbf{Task 6}
		\end{center}
		\begin{itemize}
			\item Let us create a label for the two variables we created in Task 5
		\end{itemize}
	***/
		texdoc stlog	
			label variable cm_main_ws "Cm to main water source"
			label variable d_closest_ws "Closest water source is used water source" 
		texdoc stlog close
	/***		
		\begin{itemize}
			\item Check the variable window to see the label!
		\end{itemize}		
	\end{frame}	
	

	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}	
			\Large\textbf{Task 6}
		\end{center}
		\begin{itemize}
			\item We can also create labels for values with the functions \textit{label define} and \textit{label values}. Type:
		\end{itemize}
	***/
		texdoc stlog	
			label define yes_no_lb 1 "Yes" 0 "No"
			label values d_closest_ws yes_no_lb
		texdoc stlog close
	/***		
		\begin{itemize}
			\item You can see the labels if you tabulate the labeled variable or browse the data
			\item This is very useful for binary or categorical variables when visualizing the data
		\end{itemize}		
	\end{frame}		
	
	
	\begin{frame}
		\frametitle{\textsc{The basics of Stata}}
		\begin{center}
			\textbf{How to share your work with your team}
		\end{center}
	\end{frame}

	\begin{frame}
		\frametitle{\textsc{Sharing work with a team}}
		\begin{center}
			\textbf{You are asked to share your work}
		\end{center}
		\begin{itemize}
			\item How would you share the work you have done so far?
			\item Send only the data set? That would be like Excel and only shares the latest version of the data
			\item Nowadays there's a greater demand than to share more than the latest version of the data. We need to show what we did
			\item This is where .do files come into the picture

		\end{itemize}
	\end{frame}
	
	\begin{frame}
		\frametitle{\textsc{Sharing work with a team}}
		\begin{center}
			\textbf{Do-files}
		\end{center}
		\begin{itemize}
			\item Open up a new do-file. Window $\rightarrow$ Do-file Editor $\rightarrow$ New Do-file Editor
			\item Alternatively click the shortcut highlighted below:
		\end{itemize}
		\begin{figure}[H] 
			\centering
			\includegraphics[width=0.9\linewidth]{dofile}
		\end{figure}
		\begin{itemize}
			\item A do-file works similarly to the command window. But instead of running one line of code at the time, a do-file lets you do that run any number of lines of code

			\item Running the code in your do-file using menus: Tools $\rightarrow$ Execute (Do) 
			\item Alternatively, select Ctrl+R (Windows) on your keyboard
			\item Alternatively, click the shortcut highlighted below

		\end{itemize}
		\begin{figure}[H] 
			\centering
			\includegraphics[width=0.9\linewidth]{run}
		\end{figure}		

	\end{frame}
		
	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}	
			\Large\textbf{Task 7}
		\end{center}
		\begin{itemize}
			\item Open a new do-file. Save it! 
			\item Type the following in your do file
			\end{itemize}
	***/
		texdoc stlog	
		clear all
		texdoc stlog close
		
	/***
		\begin{itemize}
			\item Next, use the review window to copy to your do-file all the actions you already did:
			\begin{itemize}
				\item Now run the do-file
				\item Load the dataset 
				\item Keep only the variables that you need
				\item Drop the ones you forgot
				\item Rename all the variables
				\item Create the cm to the main water source variable
				\item Create the dummy if main water source is the same as the used water source
				\item Label the variables and values
			\end{itemize}
		\end{itemize}	
	\end{frame}
	
	
	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}	
			\Large\textbf{Task 7}
		\end{center}	
		\begin{itemize}
			\item Now let’s edit the do-file!
			\item We just realized that the number of centimeters to the main water source doesn’t make much sense. Let’s edit it to the number of kilometers.  Replace the code:
			\end{itemize}
	***/
		texdoc stlog	
			quietly use "$data\cs_s0_s5_household.dta", clear 
			quietly rename s5cq2 m_main_ws
			gen  cm_main_ws = m_main_ws*1000
		texdoc stlog close
	/***
	to
	***/
		texdoc stlog	
			quietly use "$data\cs_s0_s5_household.dta", clear 
			quietly rename s5cq2 m_main_ws
			gen  km_main_ws = m_main_ws/1000
		texdoc stlog close
	/***
	Also, remember to edit the label before you run the do-file!
	\end{frame}
	
	\begin{frame}
		\frametitle{\textsc{Sharing work with a team}}
		\begin{center}	
			\Large\textbf{Comments}
		\end{center}	
		\begin{itemize}	
			\item Comments is the green text you have seen in the code examples
			\item Comments is text that Stata will ignore when running your code
			\item Comments is what makes the difference between instructions that are easy to follow or impossible to understand
			\item You can also use comments to omit certain parts of your do-file that you don’t want to run anymore, but don’t want to erase
			\begin{itemize}
				\item Maybe you might need it in the future! Just be careful, keeping lots of old code in your do-file might make it messy and hard to understand.
			\end{itemize}
		\end{itemize}
	\end{frame}
	
	\begin{frame}
		\frametitle{\textsc{Sharing work with a team}}
		\begin{center}	
			\Large\textbf{Different types of comments}
		\end{center}	
		\begin{enumerate}	
			\item \textit{/* comment */} 
			\begin{itemize}
				\item Used for long comments or to explain many lines of code in the following section
			\end{itemize}
			\item \textit{* comment} 
			\begin{itemize}
				\item Used to explain what happens on the following few rows
			\end{itemize}
			\item \textit{ // comment} 
			\begin{itemize}
				\item Used to explain the same line of code
			\end{itemize}
		\end{enumerate}
	\end{frame}
	
	
	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}	
			\Large\textbf{Task 8}
		\end{center}	
		\begin{itemize}	
			\item Now that you know about comments, add them to your do-file! 
			\item First, add a title and a brief explanation of what your do-file does (e.g. “Stata training do-file – Uses EICV4 data to practice Stata, limiting the variables to water usage”)
			\item Now, add a heading to every main section of your do-file (e.g. load data, keep the variables I’ll use, create new variables, etc.)
			\item Finally, we realized that we actually don’t need the \textit{km\_main\_ws}  variable now, but don’t want to erase the code because we might want to use it in the future. Comment out that variable's creation.
			\item Run everything!
		\end{itemize}

	\end{frame}
	
		
	\begin{frame}
		\frametitle{\textsc{Tasks}}
		\begin{center}	
			\Large\textbf{Task 8}
		\end{center}	
		\begin{itemize}	
			\item Did it work? 

			\item If you comment out the variable creation and not the labeling, you probably got an error like this:
		\end{itemize}
		\begin{figure}[H] 
			\centering
			\includegraphics[width=0.9\linewidth]{error}
		\end{figure}
		\begin{itemize}
			\item To avoid this, comment out the labeling of the \textit{km\_main\_ws} variable as well. 
		\end{itemize}

	\end{frame}
		
	
	
\section{Section 3}

	\end{document}
	***/

