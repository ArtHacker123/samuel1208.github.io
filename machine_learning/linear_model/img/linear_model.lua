require 'torch'
require 'nn'
require 'optim'
require 'gnuplot'
torch.setdefaulttensortype('torch.FloatTensor')

if not arg then arg = {} end

cmd = torch.CmdLine()
cmd:text()
cmd:text('Linear Model tutorial')
cmd:text('Example:')
cmd:text('$> th linear_model.lua  --method logistic-regression ')
cmd:text('$> th linear_model.lua  --method margin')
cmd:text('Options:')
cmd:option('-method', 'logistic-regression', 'training method')
cmd:option('-margin', 1, 'margin for the use margin method' )
cmd:text()

cmd_params = cmd:parse(arg)

local sample=function(target_mode)
	-------------------------------------------------------------------
	---- Generate Sample
	X = torch.Tensor(100,2)
	Y = torch.Tensor(100,1):fill(0)

	for i=1, 50 do
		X[i][1] = torch.ceil(torch.uniform(10,20))
		X[i][2] = torch.ceil(torch.uniform(-5,5))
		if 'margin' == target_mode then 
			Y[i][1] = 1
		elseif 'logistic-regression' == target_mode then
			Y[i][1] = 1
		end
	end

	for i=51, 100 do
		X[i][1] = torch.ceil(torch.uniform(0,10))
		X[i][2] = torch.ceil(torch.uniform(15,20))
		if 'margin' == target_mode then 
			Y[i][1] = -1
		elseif 'logistic-regression' == target_mode then
			Y[i][1] = 2
		end
	end
	X:float()
	Y:float()
	local data={}
	data.x = X
	data.y = Y
	return data
end

local lg=function(input)
	-------------------------------------------------------------------
	---- Create the model
	local mlp = nn.Sequential()
	mlp:add(nn.Reshape(input, false))
	mlp:add(nn.Linear(input,2))
	mlp:add(nn.LogSoftMax())
	local criterion = nn.ClassNLLCriterion()
	return mlp, criterion
end

local margin=function(input)
	-------------------------------------------------------------------
	---- Create the model
	local mlp = nn.Sequential()
	mlp:add(nn.Reshape(input, false))
	mlp:add(nn.Linear(input,1))
	local criterion = nn.MarginCriterion(cmd_params['margin'])
	return mlp, criterion
end

		
local main_lg=function()
	
	local data = sample('logistic-regression')
	local net , criterion = lg(2)
	
	net:float()     
	net:training()	
	criterion:float()
	
	confusion = optim.ConfusionMatrix({"1", "2"})
	optim_para={
		learningRate  = 1e-1,
		weightDecay = 5e-2, --0.5e-4, --L2 weight decay  
	}

	para, gradPara = net:getParameters()	
	---- Train
	local total_loss = {}
	local total_mis = {}
	for i=1,100 do
		
		--Cost Function
		local costFunc = function(weight)
			gradPara:zero()
               
			local loss = 0   
			local num = data.x:size(1)
			for n=1, num do	   				
				local output = net:forward(data.x[{{n},{}}])
				local _loss = criterion:forward(output, data.y[n][1])
				loss = loss + _loss
				-- estimate df/dW
				local df_do = criterion:backward(output, data.y[n][1])
				net:backward(data.x[{{n},{}}], df_do)
			end			
			gradPara:div(num)
			loss = loss/num         
			return loss,gradPara
		end
	
		-- Evaluate
		local predict = function()
			net:evaluate()
			local num = data.x:size(1)
			confusion:zero()		
			for i = 1, num do
				local output = net:forward(data.x[i])        
				confusion:add(output, data.y[i][1])
			end                 
			confusion:updateValids()
			net:training()
			return 1-confusion.totalValid			
		end

		local _, _loss=optim.sgd(costFunc, para, optim_para)
	

		-- Plot the Loss and misclassified
		total_loss[#total_loss+1] = _loss[1]
		total_mis[#total_mis+1] =  predict()
		gnuplot.figure(1)
		gnuplot.title(string.format('Loss'))
		gnuplot.plot({'train', torch.Tensor(total_loss), '~'})
	
		gnuplot.figure(2)
		gnuplot.title(string.format('error'))
		gnuplot.plot({'train', torch.Tensor(total_mis), '~'})
	
	
		-- Plot the desicion line
		local weight = net.modules[2].weight[1] - net.modules[2].weight[2]
		local bias = net.modules[2].bias[1] - net.modules[2].bias[2]	
		_x = torch.Tensor({0,20})
		_y = torch.Tensor(2)
		_y[1] = -(weight[1]*_x[1] + bias) / weight[2]
		_y[2] = -(weight[1]*_x[2] + bias) / weight[2]
	
		gnuplot.figure(3)
		gnuplot.plot({X[{{1,50},{1}}]:squeeze(), X[{{1,50},{2}}]:squeeze(), "+"},
					 {X[{{51,100},{1}}]:squeeze(), X[{{51,100},{2}}]:squeeze(), "+"},
					 {_x, _y, '-'})	    
		print(string.format("w1=%f, w2=%f, slope=%f, norm=%f", 
							weight[1], weight[2], -weight[1]/weight[2],weight:norm())) 
	end
	print("finish")
end

local main_margin=function()
	
	local data = sample('margin')
	local net , criterion = margin(2)
	
	net:float()     
	net:training()	
	criterion:float()
	
	confusion = optim.ConfusionMatrix({"1", "2"})
	optim_para={
		learningRate  = 1e-3,
		weightDecay = 5e-2, --0.5e-4, --L2 weight decay  
	}

	para, gradPara = net:getParameters()	
	---- Train
	local total_loss = {}
	local total_mis = {}
	for i=1,1000 do
		
		--Cost Function
		local costFunc = function(weight)
			gradPara:zero()
               
			local loss = 0   
			local num = data.x:size(1)
			for n=1, num do	   				
				local output = net:forward(data.x[{{n},{}}])
				local _loss = criterion:forward(output, data.y[n])
				loss = loss + _loss
				-- estimate df/dW
				local df_do = criterion:backward(output, data.y[n])
				net:backward(data.x[{{n},{}}], df_do)
			end			
			gradPara:div(num)
			loss = loss/num         
			return loss,gradPara
		end
	
		-- Evaluate
		local predict = function()
			net:evaluate()
			local num = data.x:size(1)
			confusion:zero()		
			for i = 1, num do
				local output = net:forward(data.x[i])      
				local pre = 1
				if output[1] > 0 then
					pre = 1
				else
					pre = 2
				end				
				if data.y[i][1] == 1 then
					confusion:add(pre, 1)
				elseif data.y[i][1] == -1 then
					confusion:add(pre, 2)
				end
			end                 
			confusion:updateValids()
			net:training()
			return 1-confusion.totalValid			
		end

		local _, _loss=optim.sgd(costFunc, para, optim_para)
	

		-- Plot the Loss and misclassified
		total_loss[#total_loss+1] = _loss[1]
		total_mis[#total_mis+1] =  predict()
		gnuplot.figure(1)
		gnuplot.title(string.format('Loss'))
		gnuplot.plot({'train', torch.Tensor(total_loss), '~'})
	
		gnuplot.figure(2)
		gnuplot.title(string.format('error'))
		gnuplot.plot({'train', torch.Tensor(total_mis), '~'})
	
	
		-- Plot the desicion line
		local weight = net.modules[2].weight[1]
		local bias = net.modules[2].bias[1]	
		_x = torch.Tensor({0,20})
		_y = torch.Tensor(2)
		_y[1] = -(weight[1]*_x[1] + bias) / weight[2]
		_y[2] = -(weight[1]*_x[2] + bias) / weight[2]
	
		gnuplot.figure(3)
		gnuplot.plot({X[{{1,50},{1}}]:squeeze(), X[{{1,50},{2}}]:squeeze(), "+"},
					 {X[{{51,100},{1}}]:squeeze(), X[{{51,100},{2}}]:squeeze(), "+"},
					 {_x, _y, '-'})	    
		print(string.format("w1=%f, w2=%f, slope=%f, norm=%f", 
							weight[1], weight[2], -weight[1]/weight[2],weight:norm())) 
	end
	print("finish")
end


if 'logistic-regression' == cmd_params['method']  then
	main_lg()
elseif 'margin' == cmd_params['method']  then
	main_margin()
end




		



