# Análise e Projeto de Algoritmos - Projeto Final

Esse repositório contém o nosso projeto final da disciplina Análise e Projeto de Algoritmos(APA).

## Etapas

- [x] Implementação de pelo menos uma heurística de construção;
- [x] Implementação dos movimentos de vizinhança (Mínimo 3);
- [X] Implementação do algoritmo de busca local chamado VND (Variable Neighborhood Descent);
- [X] Implementação de uma metaheurística (OPCIONAL);
- [ ] Resultados computacionais: criar uma tabela que contenha os resultados obtidos pela(s) heurística(s)
      construtiva(s) e pelo VND, e que compare tais resultados com a solução ótima de cada instância.
      
     Essa tabela deverá conter os seguintes dados para cada heurística construtiva e para o VND:
     
     * Média do valor da solução (em no mínimo 10 execuções para cada instância)
     * Melhor solução encontrada
     * Média do tempo gasto pelo respectivo algoritmo
     * GAP para a solução ótima

## Benchmarks

### Instância cup1

Time = 225434

Route = [[1, 26, 323, 283, 284, 285, 286, 287, 300, 331, 344, 356, 375, 386, 393, 400, 1], [1, 32, 31, 305, 297, 278, 273, 289, 306, 318, 330, 337, 349, 370, 391, 429, 1], [1, 271, 258, 261, 262, 237, 232, 205, 199, 195, 193, 177, 165, 158, 168, 206, 1], [1, 304, 279, 280, 282, 263, 264, 265, 254, 253, 252, 251, 250, 249, 259, 299, 1], [1, 301, 236, 231, 223, 217, 213, 248, 260, 281, 291, 309, 314, 321, 343, 350, 1], [1, 219, 204, 200, 239, 307, 320, 315, 311, 303, 312, 329, 346, 357, 390, 398, 1], [1, 432, 412, 414, 415, 387, 380, 367, 363, 355, 340, 322, 310, 317, 326, 423, 1], [1, 447, 448, 449, 438, 439, 426, 430, 421, 401, 384, 394, 410, 420, 416, 443, 1], [1, 396, 383, 378, 324, 302, 288, 275, 270, 274, 296, 295, 313, 360, 377, 397, 1], [1, 30, 399, 392, 298, 255, 230, 215, 197, 198, 186, 180, 174, 176, 175, 190, 1], [1, 422, 342, 325, 290, 292, 293, 294, 308, 319, 354, 361, 366, 379, 376, 425, 1], [1, 446, 435, 436, 437, 418, 403, 404, 405, 406, 407, 368, 364, 371, 369, 382, 1], [1, 276, 267, 256, 257, 246, 247, 221, 220, 207, 203, 202, 184, 182, 222, 240, 1], [1, 433, 417, 419, 402, 388, 373, 362, 335, 214, 226, 316, 332, 328, 336, 359, 1], [1, 33, 22, 235, 225, 216, 209, 194, 189, 185, 179, 166, 167, 201, 210, 224, 1], [1, 450, 440, 441, 442, 427, 428, 395, 372, 348, 347, 339, 351, 374, 381, 411, 1], [1, 163, 161, 134, 130, 138, 142, 140, 144, 150, 148, 147, 159, 171, 170, 21, 1], [1, 29, 385, 345, 341, 333, 327, 338, 353, 365, 408, 413, 434, 445, 444, 27, 1], [1, 3, 52, 49, 48, 44, 43, 46, 47, 45, 42, 41, 35, 36, 38, 37, 1], [1, 40, 39, 34, 269, 266, 277, 334, 352, 358, 389, 409, 424, 431, 25, 28, 1], [1, 8, 12, 66, 69, 70, 72, 73, 74, 71, 75, 76, 77, 87, 55, 54, 1], [1, 181, 173, 162, 160, 156, 172, 169, 164, 187, 191, 192, 212, 208, 211, 218, 1], [1, 24, 23, 268, 241, 234, 229, 228, 227, 233, 238, 245, 244, 243, 242, 272, 1], [1, 85, 86, 116, 106, 99, 97, 98, 101, 100, 105, 108, 112, 113, 119, 125, 1], [1, 188, 183, 196, 178, 157, 151, 143, 109, 103, 104, 111, 118, 124, 141, 153, 1], [1, 56, 58, 59, 60, 64, 84, 83, 19, 11, 10, 9, 7, 6, 5, 4, 1], [1, 149, 155, 154, 152, 145, 146, 135, 133, 131, 137, 136, 129, 132, 126, 139, 1], [1, 2, 13, 14, 15, 16, 17, 18, 20, 63, 62, 61, 57, 53, 50, 51, 1], [1, 90, 88, 89, 91, 94, 92, 93, 95, 102, 110, 114, 115, 120, 123, 127, 1], [1, 65, 128, 122, 121, 117, 107, 96, 79, 82, 80, 78, 81, 68, 67, 1]]


### Instância cup2

Time = 210975

Route = [[1, 197, 198, 226, 225, 224, 236, 234, 227, 223, 200, 199, 196, 1], [1, 235, 244, 243, 245, 252, 253, 260, 259, 254, 251, 246, 1], [1, 14, 15, 16, 42, 41, 50, 51, 52, 53, 31, 30, 29, 1], [1, 293, 364, 363, 321, 322, 361, 362, 385, 384, 383, 365, 315, 1], [1, 49, 48, 68, 69, 70, 73, 74, 75, 78, 79, 61, 56, 1], [1, 443, 468, 482, 481, 480, 471, 454, 447, 430, 419, 402, 403, 1], [1, 213, 230, 231, 239, 240, 248, 249, 256, 257, 258, 255, 250, 1], [1, 475, 476, 491, 492, 493, 494, 495, 496, 497, 498, 490, 489, 1], [1, 263, 264, 265, 266, 267, 303, 378, 392, 407, 389, 391, 382, 1], [1, 310, 311, 370, 369, 368, 395, 400, 420, 401, 394, 371, 372, 1], [1, 415, 433, 445, 456, 469, 470, 455, 446, 431, 418, 417, 404, 1], [1, 169, 168, 167, 171, 172, 173, 174, 193, 192, 191, 176, 164, 1], [1, 261, 262, 300, 301, 302, 268, 269, 379, 380, 381, 17, 18, 1], [1, 393, 434, 444, 457, 458, 467, 459, 442, 435, 414, 406, 299, 1], [1, 290, 291, 292, 314, 289, 288, 287, 286, 285, 284, 283, 282, 1], [1, 58, 85, 84, 87, 88, 89, 83, 60, 55, 32, 27, 2, 1], [1, 353, 352, 351, 350, 349, 348, 337, 336, 334, 333, 332, 1], [1, 26, 36, 37, 38, 39, 40, 20, 21, 22, 23, 24, 25, 1], [1, 426, 425, 424, 423, 354, 330, 355, 329, 356, 328, 357, 387, 1], [1, 181, 186, 216, 217, 218, 219, 220, 221, 222, 201, 195, 170, 1], [1, 114, 140, 139, 138, 145, 146, 165, 166, 144, 143, 142, 141, 1], [1, 19, 43, 44, 71, 72, 99, 98, 97, 76, 63, 62, 54, 1], [1, 438, 439, 462, 463, 488, 45, 46, 47, 35, 34, 33, 28, 1], [1, 111, 118, 119, 120, 124, 125, 126, 127, 100, 101, 102, 103, 1], [1, 399, 421, 428, 449, 452, 473, 479, 472, 453, 432, 416, 405, 1], [1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1], [1, 159, 158, 182, 185, 209, 210, 211, 212, 184, 183, 156, 157, 1], [1, 57, 59, 82, 81, 91, 92, 93, 77, 67, 66, 65, 64, 1], [1, 429, 448, 478, 477, 474, 451, 450, 427, 422, 398, 397, 396, 1], [1, 80, 94, 95, 96, 104, 105, 106, 107, 108, 109, 110, 86, 1], [1, 194, 203, 204, 205, 206, 207, 208, 187, 188, 189, 190, 175, 1], [1, 134, 133, 132, 152, 153, 154, 155, 128, 129, 130, 123, 122, 1], [1, 112, 135, 148, 162, 161, 160, 180, 179, 178, 177, 163, 147, 1], [1, 304, 377, 376, 373, 309, 281, 280, 279, 278, 277, 274, 271, 1], [1, 113, 115, 116, 117, 137, 136, 149, 150, 151, 131, 121, 90, 1], [1, 312, 388, 386, 360, 359, 358, 327, 326, 325, 324, 323, 320, 1], [1, 390, 409, 408, 413, 436, 441, 440, 437, 412, 411, 410, 1], [1, 460, 465, 466, 484, 483, 499, 500, 485, 486, 487, 464, 461, 1], [1, 331, 335, 347, 346, 345, 344, 343, 342, 341, 340, 339, 338, 1], [1, 202, 228, 233, 237, 242, 247, 241, 238, 232, 229, 214, 215, 1], [1, 313, 367, 366, 316, 317, 318, 319, 298, 297, 296, 295, 294, 1], [1, 272, 273, 275, 276, 307, 308, 374, 375, 306, 305, 270, 1]]


### Instância cup3

Time = 49029

Route = [[1, 275, 104, 290, 125, 245, 467, 169, 253, 550, 384, 205, 541, 238, 236, 387, 1], [1, 489, 483, 53, 500, 185, 344, 402, 2, 4, 3, 328, 289, 487, 316, 334, 1], [1, 180, 299, 213, 336, 390, 540, 527, 391, 428, 155, 512, 372, 85, 136, 348, 196, 1], [1, 400, 535, 113, 295, 60, 436, 131, 101, 426, 15, 222, 146, 518, 342, 235, 188, 1], [1, 288, 58, 92, 167, 425, 12, 133, 176, 475, 377, 318, 294, 351, 458, 254, 1], [1, 157, 492, 393, 346, 304, 82, 214, 38, 265, 454, 91, 523, 232, 75, 194, 423, 1], [1, 385, 524, 534, 521, 544, 514, 280, 141, 152, 259, 438, 145, 532, 43, 64, 373, 1], [1, 364, 18, 325, 291, 24, 389, 247, 421, 184, 79, 302, 28, 62, 337, 32, 422, 1], [1, 76, 122, 499, 539, 397, 83, 531, 186, 376, 494, 248, 21, 250, 77, 324, 1], [1, 111, 478, 134, 87, 503, 362, 286, 102, 480, 163, 519, 442, 405, 241, 59, 130, 1], [1, 150, 409, 178, 268, 30, 98, 153, 420, 296, 262, 72, 23, 170, 226, 51, 114, 1], [1, 452, 16, 356, 164, 139, 42, 29, 25, 208, 210, 345, 310, 240, 360, 192, 1], [1, 327, 549, 529, 137, 263, 307, 41, 116, 418, 293, 107, 124, 375, 504, 349, 281, 1], [1, 538, 406, 138, 350, 411, 120, 237, 199, 31, 511, 49, 200, 321, 229, 40, 207, 1], [1, 513, 395, 509, 326, 121, 144, 151, 173, 357, 453, 506, 239, 491, 86, 65, 470, 1], [1, 260, 386, 266, 320, 398, 112, 547, 396, 117, 287, 314, 80, 52, 182, 190, 292, 1], [1, 99, 414, 252, 445, 365, 444, 135, 6, 73, 367, 273, 461, 322, 90, 227, 197, 1], [1, 183, 118, 282, 498, 517, 297, 174, 127, 434, 71, 528, 45, 140, 94, 479, 447, 1], [1, 424, 306, 264, 161, 301, 477, 546, 26, 548, 37, 177, 381, 224, 515, 335, 536, 1], [1, 20, 502, 464, 89, 261, 303, 315, 88, 323, 474, 343, 195, 50, 415, 34, 1], [1, 158, 231, 14, 485, 203, 17, 399, 408, 225, 481, 129, 354, 10, 160, 451, 283, 1], [1, 217, 404, 412, 410, 33, 359, 39, 278, 175, 456, 437, 525, 274, 369, 530, 168, 1], [1, 300, 255, 57, 202, 339, 219, 435, 488, 143, 355, 416, 74, 417, 495, 378, 243, 1], [1, 407, 48, 446, 284, 501, 27, 8, 319, 81, 277, 108, 543, 123, 520, 382, 206, 1], [1, 308, 103, 63, 361, 201, 198, 313, 298, 537, 189, 13, 212, 7, 267, 482, 1], [1, 431, 368, 66, 96, 439, 172, 449, 329, 331, 249, 193, 441, 44, 340, 279, 1], [1, 256, 533, 228, 455, 433, 448, 332, 542, 443, 366, 97, 317, 459, 392, 484, 154, 1], [1, 429, 457, 105, 223, 432, 215, 430, 230, 311, 93, 465, 246, 128, 216, 490, 69, 1], [1, 142, 209, 270, 119, 54, 244, 165, 126, 70, 242, 526, 110, 221, 251, 338, 148, 1], [1, 61, 374, 380, 403, 181, 234, 36, 358, 468, 171, 35, 156, 67, 341, 388, 379, 1], [1, 179, 401, 272, 463, 476, 370, 233, 516, 371, 100, 383, 187, 5, 497, 545, 11, 1], [1, 285, 505, 312, 466, 510, 257, 269, 149, 47, 427, 204, 493, 486, 115, 472, 1], [1, 462, 109, 84, 162, 309, 166, 471, 159, 55, 271, 419, 19, 440, 394, 305, 1], [1, 363, 56, 353, 352, 191, 95, 147, 132, 276, 450, 507, 473, 22, 413, 218, 496, 1], [1, 469, 333, 9, 68, 78, 508, 347, 106, 258, 330, 46, 220, 211, 460, 522, 1]]

