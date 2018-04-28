using IntervalSpecialFunctions
using IntervalArithmetic
using Base.Test

setprecision(Interval, 128)
setprecision(Interval, Float64)

@testset "IntervalSpecialFunctions tests" begin
    @testset "erf" begin
        @test erf(emptyinterval()) == emptyinterval()
        @test erf(1..2) == Interval(0.8427007929497148, 0.9953222650189528)
        @test erf(@interval(0.5)) == Interval(5.2049987781304652e-01,5.2049987781304663e-01)
        @test erf(0..0) == Interval(0.0, 0.0)
        @test erf(@biginterval(-1, 1)) ⊆ Interval(-8.4270079294971489e-01, 8.4270079294971489e-01)
    end

    @testset "erfc" begin
        @test erfc(emptyinterval()) == emptyinterval()
        @test erfc(1..2) == Interval(0.004677734981047265, 0.15729920705028513)
        @test erfc(@interval(0.5)) == Interval(4.7950012218695343e-01, 4.7950012218695348e-01)
        @test erfc(0..0) == Interval(1.0, 1.0)
        @test erfc(@biginterval(-1, 1)) ⊆ Interval(1.5729920705028511e-01, 1.842700792949715)
    end

    @testset "erfinv" begin
        @test erfinv(emptyinterval()) == emptyinterval()
        @test erfinv(0..0.99) == Interval(0, 1.8213863677184554)
        @test erfinv(0..1//2) == Interval(0, 0.4769362762044699)
        @test erfinv(@biginterval(0, 0)) == @biginterval(0, 0)
    end
end
