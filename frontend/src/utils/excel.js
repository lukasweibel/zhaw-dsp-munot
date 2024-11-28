import ExcelJS from "exceljs";

export async function createExcelOnResults(testResults) {
    const workbook = new ExcelJS.Workbook();

    const worksheet1 = workbook.addWorksheet("Evaluation");
    const worksheet2 = workbook.addWorksheet("Results");

    // Modify evaluationData to include 'Expected'
    const evaluationData = Object.entries(testResults).map(([id, result]) => [
        id,
        result.question || "N/A",
        result.actual.replace(/\\n/g, "\n").replace(/\\u00f([0-9a-f]{2})/g, (_, hex) =>
            String.fromCharCode(parseInt(hex, 16))
        ),
        result.expected.replace(/\\n/g, "\n").replace(/\\u00f([0-9a-f]{2})/g, (_, hex) =>
            String.fromCharCode(parseInt(hex, 16))
        ),
        "",
    ]);

    // Update headers to include 'Expected'
    worksheet1.addRow(["ID", "Question", "Actual", "Expected", "Evaluation"]);

    evaluationData.forEach((row) => worksheet1.addRow(row));

    const rowCount = worksheet1.rowCount;
    for (let i = 2; i <= rowCount; i++) {
        // Adjust column index for 'Evaluation'
        worksheet1.getCell(`E${i}`).dataValidation = {
            type: "list",
            allowBlank: true,
            formulae: ['"Yes,No"'],
            showErrorMessage: true,
            error: "Please select Yes or No.",
            errorTitle: "Invalid Choice",
        };
    }

    worksheet2.addRow(["ID", "Success", "Evaluation"]);

    evaluationData.forEach((rowData, index) => {
        const id = rowData[0];
        const success = testResults[id].success ? "Yes" : "No";

        const newRow = worksheet2.addRow([id, success, ""]);

        const evaluationCell = newRow.getCell(3);
        const evaluationRowNumber = index + 2;

        // Update formula reference for 'Evaluation' column
        evaluationCell.value = { formula: `=Evaluation!E${evaluationRowNumber}` };
    });

    const dataRowStart = 2;
    const dataRowEnd = worksheet2.rowCount;
    const range = `B${dataRowStart}:C${dataRowEnd}`;

    worksheet2.addConditionalFormatting({
        ref: range,
        rules: [
            {
                type: "expression",
                formulae: ["$B2=$C2"],
                style: {
                    fill: {
                        type: "pattern",
                        pattern: "solid",
                        bgColor: { argb: "FF00FF00" },
                    },
                },
            },
            {
                type: "expression",
                formulae: ["$B2<>$C2"],
                style: {
                    fill: {
                        type: "pattern",
                        pattern: "solid",
                        bgColor: { argb: "FFFF0000" },
                    },
                },
            },
        ],
    });

    const buffer = await workbook.xlsx.writeBuffer();
    const blob = new Blob([buffer], {
        type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    });
    const link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "Test_Evaluation.xlsx";
    link.click();
}
