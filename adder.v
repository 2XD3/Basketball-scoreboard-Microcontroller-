module adder (
    input wire clk,
    input wire reset,
    input wire plus1,
    input wire plus2,
    input wire plus3,
    input wire minus1,
    input wire minus2,
    input wire minus3,
    output reg [10:0] score
);

    wire reset_n = ~reset;

    // Debounce parameters
    localparam DEBOUNCE_TIME = 400000;  // Adjust as necessary for debounce period

    // Debounce logic for plus1 button
    reg [19:0] debounce_counter_plus1;
    reg debounce_plus1;
    reg plus1_stable;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            debounce_counter_plus1 <= 0;
            debounce_plus1 <= 0;
            plus1_stable <= 0;
        end else begin
            if (plus1 == 1'b0) begin
                if (debounce_counter_plus1 < DEBOUNCE_TIME) begin
                    debounce_counter_plus1 <= debounce_counter_plus1 + 1;
                end else begin
                    debounce_plus1 <= 1;
                    plus1_stable <= 1;
                end
            end else begin
                debounce_counter_plus1 <= 0;
                debounce_plus1 <= 0;
                plus1_stable <= 0;
            end
        end
    end

    // Debounce logic for plus2 button
    reg [19:0] debounce_counter_plus2;
    reg debounce_plus2;
    reg plus2_stable;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            debounce_counter_plus2 <= 0;
            debounce_plus2 <= 0;
            plus2_stable <= 0;
        end else begin
            if (plus2 == 1'b0) begin
                if (debounce_counter_plus2 < DEBOUNCE_TIME) begin
                    debounce_counter_plus2 <= debounce_counter_plus2 + 1;
                end else begin
                    debounce_plus2 <= 1;
                    plus2_stable <= 1;
                end
            end else begin
                debounce_counter_plus2 <= 0;
                debounce_plus2 <= 0;
                plus2_stable <= 0;
            end
        end
    end

    // Debounce logic for plus3 button
    reg [19:0] debounce_counter_plus3;
    reg debounce_plus3;
    reg plus3_stable;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            debounce_counter_plus3 <= 0;
            debounce_plus3 <= 0;
            plus3_stable <= 0;
        end else begin
            if (plus3 == 1'b0) begin
                if (debounce_counter_plus3 < DEBOUNCE_TIME) begin
                    debounce_counter_plus3 <= debounce_counter_plus3 + 1;
                end else begin
                    debounce_plus3 <= 1;
                    plus3_stable <= 1;
                end
            end else begin
                debounce_counter_plus3 <= 0;
                debounce_plus3 <= 0;
                plus3_stable <= 0;
            end
        end
    end

    // Debounce logic for minus1 button
    reg [19:0] debounce_counter_minus1;
    reg debounce_minus1;
    reg minus1_stable;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            debounce_counter_minus1 <= 0;
            debounce_minus1 <= 0;
            minus1_stable <= 0;
        end else begin
            if (minus1 == 1'b0) begin
                if (debounce_counter_minus1 < DEBOUNCE_TIME) begin
                    debounce_counter_minus1 <= debounce_counter_minus1 + 1;
                end else begin
                    debounce_minus1 <= 1;
                    minus1_stable <= 1;
                end
            end else begin
                debounce_counter_minus1 <= 0;
                debounce_minus1 <= 0;
                minus1_stable <= 0;
            end
        end
    end

    // Debounce logic for minus2 button
    reg [19:0] debounce_counter_minus2;
    reg debounce_minus2;
    reg minus2_stable;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            debounce_counter_minus2 <= 0;
            debounce_minus2 <= 0;
            minus2_stable <= 0;
        end else begin
            if (minus2 == 1'b0) begin
                if (debounce_counter_minus2 < DEBOUNCE_TIME) begin
                    debounce_counter_minus2 <= debounce_counter_minus2 + 1;
                end else begin
                    debounce_minus2 <= 1;
                    minus2_stable <= 1;
                end
            end else begin
                debounce_counter_minus2 <= 0;
                debounce_minus2 <= 0;
                minus2_stable <= 0;
            end
        end
    end

    // Debounce logic for minus3 button
    reg [19:0] debounce_counter_minus3;
    reg debounce_minus3;
    reg minus3_stable;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            debounce_counter_minus3 <= 0;
            debounce_minus3 <= 0;
            minus3_stable <= 0;
        end else begin
            if (minus3 == 1'b0) begin
                if (debounce_counter_minus3 < DEBOUNCE_TIME) begin
                    debounce_counter_minus3 <= debounce_counter_minus3 + 1;
                end else begin
                    debounce_minus3 <= 1;
                    minus3_stable <= 1;
                end
            end else begin
                debounce_counter_minus3 <= 0;
                debounce_minus3 <= 0;
                minus3_stable <= 0;
            end
        end
    end

    // Button debounce logic (optional, but recommended)
    reg plus1_reg, plus2_reg, plus3_reg, minus1_reg, minus2_reg, minus3_reg;
    reg plus1_last, plus2_last, plus3_last, minus1_last, minus2_last, minus3_last;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            plus1_reg <= 0;
            plus2_reg <= 0;
            plus3_reg <= 0;
            minus1_reg <= 0;
            minus2_reg <= 0;
            minus3_reg <= 0;
            plus1_last <= 0;
            plus2_last <= 0;
            plus3_last <= 0;
            minus1_last <= 0;
            minus2_last <= 0;
            minus3_last <= 0;
        end else begin
            plus1_last <= plus1_stable;
            plus2_last <= plus2_stable;
            plus3_last <= plus3_stable;
            minus1_last <= minus1_stable;
            minus2_last <= minus2_stable;
            minus3_last <= minus3_stable;

            plus1_reg <= (plus1_stable & ~plus1_last);  // Detect rising edge
            plus2_reg <= (plus2_stable & ~plus2_last);  // Detect rising edge
            plus3_reg <= (plus3_stable & ~plus3_last);  // Detect rising edge
            minus1_reg <= (minus1_stable & ~minus1_last);  // Detect rising edge
            minus2_reg <= (minus2_stable & ~minus2_last);  // Detect rising edge
            minus3_reg <= (minus3_stable & ~minus3_last);  // Detect rising edge
        end
    end

    // Score update logic
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            score <= 0;  // Reset score to 0
        end else begin
            if (plus1_reg) begin
                score <= score + 1;
            end
            if (plus2_reg) begin
                score <= score + 2;
            end
            if (plus3_reg) begin
                score <= score + 3;
            end
            if (minus1_reg) begin
                score <= score - 1;
            end
            if (minus2_reg) begin
                score <= score - 2;
            end
            if (minus3_reg) begin
                score <= score - 3;
            end
        end
    end

endmodule


