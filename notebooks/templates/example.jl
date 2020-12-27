### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ cfea9340-3fd6-11eb-26cc-57e76c7353cd
using DSJulia

# ╔═╡ d00b3712-3fd6-11eb-354e-3182c3cb8eb1
md"""## Some examples on how to use DSJulia"""

# ╔═╡ 4e4c000e-3fda-11eb-3b32-8fad55386401
md"At the start of the notebook we need the name and email of the students"

# ╔═╡ eb3259ee-3fdb-11eb-39d1-6d8b2f5a29ed
student = (name="Bram De Jaegher", email="Bram.DeJaegher@gmail.com")

# ╔═╡ 28e74fe2-3fdc-11eb-28b5-1fc8d35e65cf
md"Next step is to initialise the tracker"

# ╔═╡ 1a6a2844-3fdd-11eb-2931-dd7fca88e484
tracker = ProgressTracker(student.name, student.email);

# ╔═╡ 4707f4ae-3fdc-11eb-3ebd-2b483041d459
md"-----"

# ╔═╡ 2c2acce2-4851-11eb-117c-9193cee78d69


# ╔═╡ 2f7a46d4-4851-11eb-3154-25e7522fbc30


# ╔═╡ 24ca0562-4851-11eb-20fd-bd04c7b49b98


# ╔═╡ 1fbb7d80-4851-11eb-2412-8949395ed30f
mutable struct QuestionBlock <: AbstractQuestionBlock
	title::Markdown.MD
	description::Markdown.MD
	hints::Array{Markdown.MD}
	questions::Array{AbstractQuestion}

	QuestionBlock(;title=title_default,
									description=description_default,
									hints = Markdown.MD[],
									questions = [Question()]) = new(title, description, hints, questions) 
end

# ╔═╡ 0b9c7596-4851-11eb-0c77-d147836a8372
#= 	opt_validators= Dict(
			"easy" => @safe[myclamp([2.0, 0.3])==[1.0, 0.3]],
			"intermediate" => [false],
			
			), 

	validate(q, tracker)

=#

# ╔═╡ 2f51df02-3fda-11eb-0f9c-9b5bea842137
md"## 1. Example simple exercise"

# ╔═╡ 854891dc-2dab-11eb-2b4b-e129081aacca
md"""Complete the function `myclamp(x)` that clamps a number `x` between 0 and 1.

Open assignments always return `missing`.
"""

# ╔═╡ e27e6aa0-2dab-11eb-3ccc-43c68f37114b
myclamp(x) = max(0, min(x,1))

# ╔═╡ 9bbee332-4170-11eb-05a6-4998f14d307e
begin
	q₁ = Question(;
		description=md"""Complete the function `myclamp(x)` that clamps a number `x` between 0 and 1.

		Open assignments always return `missing`. For the optional question try to make the clamping also work for arrays.
		""",
		validators= @safe[myclamp(-1)==0, myclamp(0.3)==0.3, myclamp(1.1)==1.0],
	
	)
	

   qb = QuestionBlock(;
	title=md"### Question 1.0: What a crazy exercise",
	description=md"",
	

		
	hints=[	hint(md"Have you tried this?"),
			hint(md"Have you tried switching it on and off again?")]
	);
	
end 

# ╔═╡ 87e6c2a8-2dac-11eb-33d3-77a35fc13d71
myclamp(1.1)

# ╔═╡ e05ee714-3fde-11eb-0209-e30f44655997
md"The answer checking happens in the second argument of `check_answer()` and by passing the tracker-instance in the first argument the state of the question (correct/incorrect) is tracked"

# ╔═╡ 221b27f8-3fdf-11eb-06c1-f97060a68bca
md"**Hints:**"

# ╔═╡ 542d5fa6-2da9-11eb-1037-3b35a5b22bd5
hint(md"Did you think of this?")

# ╔═╡ 2e7109a0-3fdf-11eb-28af-0d99a01c5066
md"**FYI's:**"

# ╔═╡ 3cd3e814-3fdf-11eb-1918-75993ba2e121
fyi(md"Did you know that scientists recently discovered pink UV-fluorescent squirrels?")

# ╔═╡ Cell order:
# ╟─d00b3712-3fd6-11eb-354e-3182c3cb8eb1
# ╠═cfea9340-3fd6-11eb-26cc-57e76c7353cd
# ╟─4e4c000e-3fda-11eb-3b32-8fad55386401
# ╠═eb3259ee-3fdb-11eb-39d1-6d8b2f5a29ed
# ╠═28e74fe2-3fdc-11eb-28b5-1fc8d35e65cf
# ╠═1a6a2844-3fdd-11eb-2931-dd7fca88e484
# ╠═4707f4ae-3fdc-11eb-3ebd-2b483041d459
# ╠═9bbee332-4170-11eb-05a6-4998f14d307e
# ╟─2c2acce2-4851-11eb-117c-9193cee78d69
# ╟─2f7a46d4-4851-11eb-3154-25e7522fbc30
# ╟─24ca0562-4851-11eb-20fd-bd04c7b49b98
# ╠═1fbb7d80-4851-11eb-2412-8949395ed30f
# ╠═0b9c7596-4851-11eb-0c77-d147836a8372
# ╟─2f51df02-3fda-11eb-0f9c-9b5bea842137
# ╠═854891dc-2dab-11eb-2b4b-e129081aacca
# ╠═e27e6aa0-2dab-11eb-3ccc-43c68f37114b
# ╠═87e6c2a8-2dac-11eb-33d3-77a35fc13d71
# ╟─e05ee714-3fde-11eb-0209-e30f44655997
# ╟─221b27f8-3fdf-11eb-06c1-f97060a68bca
# ╠═542d5fa6-2da9-11eb-1037-3b35a5b22bd5
# ╟─2e7109a0-3fdf-11eb-28af-0d99a01c5066
# ╠═3cd3e814-3fdf-11eb-1918-75993ba2e121
