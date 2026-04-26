import Pkg
Pkg.add(["AMD", "Typstry"])

using Printf
using LinearAlgebra
 
import AMD
import SparseArrays
import Statistics

function print(arg)
    # import Typstry
    # show(stdout, "text/typst", Typst(arg))

    show(IOContext(stdout, :compact => true), "text/plain", arg)
    @printf "\n"
end

function cnz(M::AbstractMatrix)
    count(!iszero, M)
end

### -------------------------- Part 1 & 2 --------------------------------------- ###

# Matrix for part 1
B = Symmetric([
    10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1;
    .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 .1 0 0 0 0 0 0 0 0 0;
    0 .1 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 10 0 0 0 0 0 0 0 0 0 .1 0 0 0 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 10 .1 0 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 .1 0 .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 .1 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1;
    0 0 0 0 0 0 0 0 0 10 .1 0 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 .1 0 .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 .1 0 0 0 0 0 0 0 0 .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 10 .1 0 .1 0 .1 0 0 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 10 .1 0 0 0 0 0 0 0 0 .1 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 .1 .1 0 0 0 0 0 0 0 0 0 0 0 0 .1 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 10 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 10 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 10 .1 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 10 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0 0 0 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 .1 0 0 0 0 0 0 0 0 0 0 .1 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 10 .1 .1 .1 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0 0 0 0 .1 10 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 10 .1 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 .1 10 0 0 0 0 0 0 0 0 .1 0;
    0 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 10 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 .1 0 0 0 0 0 0 0 0 0 0 10 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0 0 0 0 0 0 0 0 10 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0 0 0 0 0 0 0 10 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .1 0 0 0 0 0 0 0 0 10 0;
    .1 0 0 0 0 0 0 0 .1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10;
])

L, U = lu(B)
fillin = cnz(L + U) - cnz(B)
@printf "1A fillin of matrix"
print(fillin)

# Part 1B - Find spy plot
@printf "1B spy plot of LU factorization"
print(Int.((L + U) .!= 0))

### ----------------- Part 2

# Permutation vector found in 2A
p_perm = [30, 31, 32, 33, 34, 20, 19, 35, 36, 37, 38, 28, 29, 5, 7, 10, 12, 21, 22, 23, 24, 1, 3, 4, 6, 8, 9, 11, 13, 15, 16, 25, 26, 27, 39, 2, 14, 17, 18]

B_perm = B[p_perm, p_perm]
L_perm, U_perm = lu(B_perm)
fillin_perm = cnz(L_perm + U_perm) - cnz(B_perm)
# Part 2A answer
print(fillin_perm)


p_symd = AMD.symamd(SparseArrays.sparse(B))

B_symd = B[p_symd, p_symd]
L_symd, U_symd = lu(B_symd)
fillin_symd = cnz(L_symd + U_symd) - cnz(B_symd)
# part 2C Answer
print(fillin_symd)

### --------------------- Part 3 & 4 ------------------------------------- ###

A = Symmetric([
    1 0 0 1 0 1 0 1 0 0 0 0 0 0 0;
    0 1 0 0 0 0 1 0 0 0 0 0 0 0 0;
    0 0 1 0 0 0 0 0 1 0 0 0 0 0 0;
    1 0 0 1 1 0 0 1 0 0 0 1 0 0 0;
    0 0 0 1 1 0 0 1 0 0 0 1 0 0 0;
    1 0 0 0 0 1 0 0 0 1 0 0 0 0 0;
    0 1 0 0 0 0 1 0 0 0 1 0 0 0 1;
    1 0 0 1 1 0 0 1 0 0 1 0 1 1 1;
    0 0 1 0 0 0 0 0 1 0 1 0 0 1 0;
    0 0 0 0 0 1 0 0 0 1 0 0 1 0 0;
    0 0 0 0 0 0 1 1 1 0 1 0 0 0 1;
    0 0 0 1 1 0 0 0 0 0 0 1 0 0 0;
    0 0 0 0 0 0 0 1 0 1 0 0 1 0 0;
    0 0 0 0 0 0 0 1 1 0 0 0 0 1 0;
    0 0 0 0 0 0 1 1 0 0 1 0 0 0 1;
])

function spectral(M)
    # Degree matrix (diagonal)
    degrees = sum(M, dims=2)
    D = SparseArrays.spdiagm(vec(degrees))

    # Graph Laplacian
    Q = D - M

    F = eigen(Q, sortby=nothing)

    vals = F.values  #[:, end:-1:1]
    vecs = F.vectors #[:, end:-1:1]

    idx = argmin(vals)

    print(vecs[:, idx])

    seperator = Statistics.median(vals[:,idx]) 

    lhs = []
    rhs = []
    for (j, v) in enumerate(vecs[:, idx])
        if (j == idx)
            continue
        end
        # if (v < seperator)
        #     push!(lhs, j)
        # else
        push!(rhs, j)
        # end
    end
    p_spec = lhs
    for v in rhs
        push!(p_spec, v)
    end
    push!(p_spec, idx)

    return [Q, seperator, p_spec, rhs]
end

Q_1, sep_1, p_spec_1, rhs = spectral(A)
@printf "3A Laplacian: "
print(Q_1)

@printf "3B Seperator: "
print(sep_1)

@printf "3B Permutation: "
print(p_spec_1)

A_spec = A[p_spec_1, p_spec_1]
@printf "3B Permuted Matrix: "
print(A_spec)
 
A_rem = A[rhs, rhs]
## Part 3C
Q_2, sep_2, p_spec_2 = spectral(A_rem)
@printf "3C Laplacian: "
print(Q_2)

@printf "3C Seperator: "
print(sep_2)

@printf "3C Permutation: "
print(p_spec_2)

@printf "3C Permuted Matrix: "
print(A_rem[p_spec_2, p_spec_2])


### ----------- Part 4

# Permutation Vector made by diagrahp 
p_diga = [2,7,11,15,1,3,4,5,13,14,6,12,10,8,9]

A_diga = A[p_diga, p_diga]
@printf "4B Permuted Matrix: "
print(A_diga)


# Permutation Vector made by diagrahp 
p_diga2 = [2, 7, 11, 15 , 13, 10, 6, 4, 5, 12, 1, 3, 14 , 8, 9]

A_diga2 = A[p_diga2, p_diga2]
@printf "4C Permuted Matrix: "
print(A_diga2)
