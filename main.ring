# تحميل المكتبات
load "stdlib.ring"
load "consolecolors.ring"

# المتغيرات العامة
title = [
           [
            "██████╗ ██╗███╗   ██╗ ██████╗",
            "██╔══██╗██║████╗  ██║██╔════╝",
            "██████╔╝██║██╔██╗ ██║██║  ███╗",
            "██╔══██╗██║██║╚██╗██║██║   ██║",
            "██║  ██║██║██║ ╚████║╚██████╔╝",
            "╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝"
            ],
            [
            "███████╗██╗   ██╗██████╗ ██████╗ ██████╗  ██████╗  ██████╗███████╗███████╗███████╗███████╗",
            "██╔════╝██║   ██║██╔══██╗██╔══██╗██╔══██╗██╔═══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝",
            "███████╗██║   ██║██████╔╝██████╔╝██████╔╝██║   ██║██║     █████╗  ███████╗███████╗███████╗",
            "╚════██║██║   ██║██╔══██╗██╔═══╝ ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║╚════██║╚════██║",
            "███████║╚██████╔╝██████╔╝██║     ██║  ██║╚██████╔╝╚██████╗███████╗███████║███████║███████║",
            "╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚══════╝╚══════╝╚══════╝╚══════╝"
            ],
            [
            "███████╗██╗  ██╗████████╗███████╗███╗   ██╗███████╗██╗ ██████╗ ███╗   ██╗",
            "██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝████╗  ██║██╔════╝██║██╔═══██╗████╗  ██║",
            "█████╗   ╚███╔╝    ██║   █████╗  ██╔██╗ ██║███████╗██║██║   ██║██╔██╗ ██║",
            "██╔══╝   ██╔██╗    ██║   ██╔══╝  ██║╚██╗██║╚════██║██║██║   ██║██║╚██╗██║",
            "███████╗██╔╝ ██╗   ██║   ███████╗██║ ╚████║███████║██║╚██████╔╝██║ ╚████║",
            "╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝",
            ],
            ["╭────────────────────────────── Version 1.0.0 ──────────────────────────────╮",
             "│                                                                           │",
             "│  Author: Azzeddine Remmal                                                 │",
             "│  GitHub: github.com/azzedinedev/RingSubprocess                            │",
             "│                                                                           │",
             "╰───────────────────────────────────────────────────────────────────────────╯"
            ]
        ]

description = "A modern and powerful subprocess management extension for the Ring programming language, providing an intuitive interface for creating and managing system processes with advanced features and real-time capabilities."

features = [
    ["🎯", "Simple & Modern API Design"],
    ["⚡", "High Performance Process Management"],
    ["🔄", "Real-time Output Streaming"],
    ["📊", "Advanced Process Analytics"],
    ["🛡️", "Robust Error Handling"],
    ["📡", "Asynchronous Operations"],
    ["🔌", "Flexible Input/Output Control"],
    ["📦", "Cross-platform Compatibility"],
    ["🔍", "Detailed Process Monitoring"],
    ["⚙️", "Customizable Process Settings"]
]

# تعريف الدوال
func main
    # عرض البانر
    displayBanner()

func printColored text, fgColor, bgColor
    cc_print(fgColor | bgColor, text)

func typeEffect text, delay
    for c in text
        see c
        sleep(delay)
    next
    see nl

func padString str, width
    if len(str) >= width 
        return left(str, width) 
    ok
    return str + copy(" ", width - len(str))

func calculateFeatureSpacing text
    totalWidth = 76  # تعديل العرض الكلي ليكون متناسقاً
    symbolsSpace = 4  # "│ " في البداية و " │" في النهاية
    remainingSpace = totalWidth - (len(text) + symbolsSpace)
    return remainingSpace

func displayBanner
    # عرض العنوان   
    for i = 1 to len(title)
        for j in title[i]
            if i = 1
            see Tab + Tab + cc_print(CC_FG_GREEN | CC_BG_NONE , j ) + nl 
            elseif i = 2
            see Tab + Tab + cc_print(CC_FG_RED  | CC_BG_NONE, j ) + nl
            elseif i = 3
            see Tab + Tab + cc_print(CC_FG_WHITE | CC_BG_NONE, j ) + nl
            else
            see Tab + Tab + cc_print(CC_FG_YELLOW | CC_BG_NONE , j ) + nl
            ok
            sleep(0.3)
        next
        see nl
        sleep(0.5)
    next
    
    # عرض الوصف
    see nl + printColored("╭────────────────────────────── Description ──────────────────────────────╮", CC_FG_BLUE, CC_BG_NONE) + nl

    words = split(description, " ")
    line = ""
    for word in words
        line += word + " "
        if len(line) > 45
            see printColored("│ ", CC_FG_BLUE, CC_BG_NONE) + 
                printColored(padString(line, 76), CC_FG_WHITE, CC_BG_NONE) + 
                printColored(" │", CC_FG_BLUE, CC_BG_NONE) + nl
            line = ""
            sleep(0.1)
        ok
    next
    if len(line) > 0
        see printColored("│ ", CC_FG_BLUE, CC_BG_NONE) + 
            printColored(padString(line, 76), CC_FG_WHITE, CC_BG_NONE) + 
            printColored(" │", CC_FG_BLUE, CC_BG_NONE) + nl
    ok
    see printColored("╰────────────────────────────────────────────────────────────────────────╯", CC_FG_BLUE, CC_BG_NONE) + nl + nl
    
    # عرض الميزات
    see printColored("╭────────────────────────────── Features ────────────────────────────────╮", CC_FG_RED, CC_BG_NONE) + nl
    
    for feature in features
        text = "  " + feature[1] + "  " + feature[2]
        spacing = calculateFeatureSpacing(text)
        see printColored("│ ", CC_FG_RED, CC_BG_NONE) + 
            printColored(text + copy(" ", spacing), CC_FG_WHITE, CC_BG_NONE) + 
            printColored(" │", CC_FG_RED, CC_BG_NONE) + nl
        sleep(0.1)
    next
    
    see printColored("╰────────────────────────────────────────────────────────────────────────╯", CC_FG_RED, CC_BG_NONE) + nl + nl +
        printColored("                    Type 'help' to see available commands                    ", CC_FG_GREEN, CC_BG_NONE) + nl


