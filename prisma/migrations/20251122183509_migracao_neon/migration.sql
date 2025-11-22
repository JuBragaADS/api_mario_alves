-- CreateEnum
CREATE TYPE "Escolaridade" AS ENUM ('ENSINO_MEDIO', 'ENSINO_SUPERIOR', 'POS_GRADUACAO', 'MESTRADO', 'DOUTORADO', 'OUTRO');

-- CreateEnum
CREATE TYPE "MetodoPagamento" AS ENUM ('DINHEIRO', 'PIX', 'CARTAO_CREDITO', 'CARTAO_DEBITO');

-- CreateTable
CREATE TABLE "livros" (
    "id" SERIAL NOT NULL,
    "titulo" VARCHAR(255) NOT NULL,
    "foto" VARCHAR(1024) NOT NULL,
    "sinopse" VARCHAR(1000),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "editoraId" INTEGER NOT NULL,

    CONSTRAINT "livros_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "autores" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "pais" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "autores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "generos" (
    "id" SERIAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "generos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "editoras" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "editoras_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuarios" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(60) NOT NULL,
    "email" VARCHAR(60) NOT NULL,
    "telefone" VARCHAR(15) NOT NULL,
    "escolaridade" "Escolaridade" NOT NULL DEFAULT 'OUTRO',
    "instituicao" VARCHAR(60) NOT NULL,
    "diaPagamento" INTEGER NOT NULL DEFAULT 2,
    "senha" VARCHAR(60) NOT NULL,
    "admin" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pagamentos" (
    "id" SERIAL NOT NULL,
    "dataPagamento" DATE NOT NULL,
    "valor" DECIMAL(10,2) NOT NULL,
    "formaPagamento" VARCHAR(20) NOT NULL,
    "pago" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "usuarioId" INTEGER NOT NULL,

    CONSTRAINT "pagamentos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reservas" (
    "id" SERIAL NOT NULL,
    "livroId" INTEGER NOT NULL,
    "usuarioId" INTEGER NOT NULL,
    "titulo" TEXT NOT NULL,
    "datadaReserva" DATE NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "reservas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "renovacoes" (
    "id" SERIAL NOT NULL,
    "datadaEntrega" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "usuarioId" INTEGER NOT NULL,
    "livroId" INTEGER NOT NULL,

    CONSTRAINT "renovacoes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "comentarios" (
    "id" SERIAL NOT NULL,
    "livroId" INTEGER NOT NULL,
    "usuarioId" INTEGER NOT NULL,
    "descricao" VARCHAR(255) NOT NULL,
    "resposta" VARCHAR(255),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "comentarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "emprestimos" (
    "id" SERIAL NOT NULL,
    "titulo" TEXT NOT NULL,
    "datadaReserva" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,
    "datadaEntrega" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "usuarioId" INTEGER NOT NULL,
    "livroId" INTEGER NOT NULL,

    CONSTRAINT "emprestimos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_LivroToUsuario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AutorToUsuario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AutorToReserva" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AutorToRenovacao" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AutorToComentario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AutorToEmprestimo" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AutorToLivro" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AutorToGenero" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AutorToEditora" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GeneroToUsuario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GeneroToReserva" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GeneroToRenovacao" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_GeneroToLivro" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EditoraToUsuario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EditoraToReserva" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EditoraToRenovacao" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EditoraToEmprestimo" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EditoraToGenero" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ComentarioToGenero" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ComentarioToEditora" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EmprestimoToReserva" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EmprestimoToRenovacao" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EmprestimoToGenero" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_LivroToUsuario_AB_unique" ON "_LivroToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_LivroToUsuario_B_index" ON "_LivroToUsuario"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AutorToUsuario_AB_unique" ON "_AutorToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_AutorToUsuario_B_index" ON "_AutorToUsuario"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AutorToReserva_AB_unique" ON "_AutorToReserva"("A", "B");

-- CreateIndex
CREATE INDEX "_AutorToReserva_B_index" ON "_AutorToReserva"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AutorToRenovacao_AB_unique" ON "_AutorToRenovacao"("A", "B");

-- CreateIndex
CREATE INDEX "_AutorToRenovacao_B_index" ON "_AutorToRenovacao"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AutorToComentario_AB_unique" ON "_AutorToComentario"("A", "B");

-- CreateIndex
CREATE INDEX "_AutorToComentario_B_index" ON "_AutorToComentario"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AutorToEmprestimo_AB_unique" ON "_AutorToEmprestimo"("A", "B");

-- CreateIndex
CREATE INDEX "_AutorToEmprestimo_B_index" ON "_AutorToEmprestimo"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AutorToLivro_AB_unique" ON "_AutorToLivro"("A", "B");

-- CreateIndex
CREATE INDEX "_AutorToLivro_B_index" ON "_AutorToLivro"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AutorToGenero_AB_unique" ON "_AutorToGenero"("A", "B");

-- CreateIndex
CREATE INDEX "_AutorToGenero_B_index" ON "_AutorToGenero"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AutorToEditora_AB_unique" ON "_AutorToEditora"("A", "B");

-- CreateIndex
CREATE INDEX "_AutorToEditora_B_index" ON "_AutorToEditora"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GeneroToUsuario_AB_unique" ON "_GeneroToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_GeneroToUsuario_B_index" ON "_GeneroToUsuario"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GeneroToReserva_AB_unique" ON "_GeneroToReserva"("A", "B");

-- CreateIndex
CREATE INDEX "_GeneroToReserva_B_index" ON "_GeneroToReserva"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GeneroToRenovacao_AB_unique" ON "_GeneroToRenovacao"("A", "B");

-- CreateIndex
CREATE INDEX "_GeneroToRenovacao_B_index" ON "_GeneroToRenovacao"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GeneroToLivro_AB_unique" ON "_GeneroToLivro"("A", "B");

-- CreateIndex
CREATE INDEX "_GeneroToLivro_B_index" ON "_GeneroToLivro"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EditoraToUsuario_AB_unique" ON "_EditoraToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_EditoraToUsuario_B_index" ON "_EditoraToUsuario"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EditoraToReserva_AB_unique" ON "_EditoraToReserva"("A", "B");

-- CreateIndex
CREATE INDEX "_EditoraToReserva_B_index" ON "_EditoraToReserva"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EditoraToRenovacao_AB_unique" ON "_EditoraToRenovacao"("A", "B");

-- CreateIndex
CREATE INDEX "_EditoraToRenovacao_B_index" ON "_EditoraToRenovacao"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EditoraToEmprestimo_AB_unique" ON "_EditoraToEmprestimo"("A", "B");

-- CreateIndex
CREATE INDEX "_EditoraToEmprestimo_B_index" ON "_EditoraToEmprestimo"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EditoraToGenero_AB_unique" ON "_EditoraToGenero"("A", "B");

-- CreateIndex
CREATE INDEX "_EditoraToGenero_B_index" ON "_EditoraToGenero"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ComentarioToGenero_AB_unique" ON "_ComentarioToGenero"("A", "B");

-- CreateIndex
CREATE INDEX "_ComentarioToGenero_B_index" ON "_ComentarioToGenero"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ComentarioToEditora_AB_unique" ON "_ComentarioToEditora"("A", "B");

-- CreateIndex
CREATE INDEX "_ComentarioToEditora_B_index" ON "_ComentarioToEditora"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EmprestimoToReserva_AB_unique" ON "_EmprestimoToReserva"("A", "B");

-- CreateIndex
CREATE INDEX "_EmprestimoToReserva_B_index" ON "_EmprestimoToReserva"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EmprestimoToRenovacao_AB_unique" ON "_EmprestimoToRenovacao"("A", "B");

-- CreateIndex
CREATE INDEX "_EmprestimoToRenovacao_B_index" ON "_EmprestimoToRenovacao"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EmprestimoToGenero_AB_unique" ON "_EmprestimoToGenero"("A", "B");

-- CreateIndex
CREATE INDEX "_EmprestimoToGenero_B_index" ON "_EmprestimoToGenero"("B");

-- AddForeignKey
ALTER TABLE "livros" ADD CONSTRAINT "livros_editoraId_fkey" FOREIGN KEY ("editoraId") REFERENCES "editoras"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pagamentos" ADD CONSTRAINT "pagamentos_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reservas" ADD CONSTRAINT "reservas_livroId_fkey" FOREIGN KEY ("livroId") REFERENCES "livros"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reservas" ADD CONSTRAINT "reservas_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "renovacoes" ADD CONSTRAINT "renovacoes_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "renovacoes" ADD CONSTRAINT "renovacoes_livroId_fkey" FOREIGN KEY ("livroId") REFERENCES "livros"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comentarios" ADD CONSTRAINT "comentarios_livroId_fkey" FOREIGN KEY ("livroId") REFERENCES "livros"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comentarios" ADD CONSTRAINT "comentarios_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "emprestimos" ADD CONSTRAINT "emprestimos_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "emprestimos" ADD CONSTRAINT "emprestimos_livroId_fkey" FOREIGN KEY ("livroId") REFERENCES "livros"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivroToUsuario" ADD CONSTRAINT "_LivroToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "livros"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LivroToUsuario" ADD CONSTRAINT "_LivroToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToUsuario" ADD CONSTRAINT "_AutorToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "autores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToUsuario" ADD CONSTRAINT "_AutorToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToReserva" ADD CONSTRAINT "_AutorToReserva_A_fkey" FOREIGN KEY ("A") REFERENCES "autores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToReserva" ADD CONSTRAINT "_AutorToReserva_B_fkey" FOREIGN KEY ("B") REFERENCES "reservas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToRenovacao" ADD CONSTRAINT "_AutorToRenovacao_A_fkey" FOREIGN KEY ("A") REFERENCES "autores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToRenovacao" ADD CONSTRAINT "_AutorToRenovacao_B_fkey" FOREIGN KEY ("B") REFERENCES "renovacoes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToComentario" ADD CONSTRAINT "_AutorToComentario_A_fkey" FOREIGN KEY ("A") REFERENCES "autores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToComentario" ADD CONSTRAINT "_AutorToComentario_B_fkey" FOREIGN KEY ("B") REFERENCES "comentarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToEmprestimo" ADD CONSTRAINT "_AutorToEmprestimo_A_fkey" FOREIGN KEY ("A") REFERENCES "autores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToEmprestimo" ADD CONSTRAINT "_AutorToEmprestimo_B_fkey" FOREIGN KEY ("B") REFERENCES "emprestimos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToLivro" ADD CONSTRAINT "_AutorToLivro_A_fkey" FOREIGN KEY ("A") REFERENCES "autores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToLivro" ADD CONSTRAINT "_AutorToLivro_B_fkey" FOREIGN KEY ("B") REFERENCES "livros"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToGenero" ADD CONSTRAINT "_AutorToGenero_A_fkey" FOREIGN KEY ("A") REFERENCES "autores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToGenero" ADD CONSTRAINT "_AutorToGenero_B_fkey" FOREIGN KEY ("B") REFERENCES "generos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToEditora" ADD CONSTRAINT "_AutorToEditora_A_fkey" FOREIGN KEY ("A") REFERENCES "autores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AutorToEditora" ADD CONSTRAINT "_AutorToEditora_B_fkey" FOREIGN KEY ("B") REFERENCES "editoras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GeneroToUsuario" ADD CONSTRAINT "_GeneroToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "generos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GeneroToUsuario" ADD CONSTRAINT "_GeneroToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GeneroToReserva" ADD CONSTRAINT "_GeneroToReserva_A_fkey" FOREIGN KEY ("A") REFERENCES "generos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GeneroToReserva" ADD CONSTRAINT "_GeneroToReserva_B_fkey" FOREIGN KEY ("B") REFERENCES "reservas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GeneroToRenovacao" ADD CONSTRAINT "_GeneroToRenovacao_A_fkey" FOREIGN KEY ("A") REFERENCES "generos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GeneroToRenovacao" ADD CONSTRAINT "_GeneroToRenovacao_B_fkey" FOREIGN KEY ("B") REFERENCES "renovacoes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GeneroToLivro" ADD CONSTRAINT "_GeneroToLivro_A_fkey" FOREIGN KEY ("A") REFERENCES "generos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GeneroToLivro" ADD CONSTRAINT "_GeneroToLivro_B_fkey" FOREIGN KEY ("B") REFERENCES "livros"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToUsuario" ADD CONSTRAINT "_EditoraToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "editoras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToUsuario" ADD CONSTRAINT "_EditoraToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToReserva" ADD CONSTRAINT "_EditoraToReserva_A_fkey" FOREIGN KEY ("A") REFERENCES "editoras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToReserva" ADD CONSTRAINT "_EditoraToReserva_B_fkey" FOREIGN KEY ("B") REFERENCES "reservas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToRenovacao" ADD CONSTRAINT "_EditoraToRenovacao_A_fkey" FOREIGN KEY ("A") REFERENCES "editoras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToRenovacao" ADD CONSTRAINT "_EditoraToRenovacao_B_fkey" FOREIGN KEY ("B") REFERENCES "renovacoes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToEmprestimo" ADD CONSTRAINT "_EditoraToEmprestimo_A_fkey" FOREIGN KEY ("A") REFERENCES "editoras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToEmprestimo" ADD CONSTRAINT "_EditoraToEmprestimo_B_fkey" FOREIGN KEY ("B") REFERENCES "emprestimos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToGenero" ADD CONSTRAINT "_EditoraToGenero_A_fkey" FOREIGN KEY ("A") REFERENCES "editoras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EditoraToGenero" ADD CONSTRAINT "_EditoraToGenero_B_fkey" FOREIGN KEY ("B") REFERENCES "generos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ComentarioToGenero" ADD CONSTRAINT "_ComentarioToGenero_A_fkey" FOREIGN KEY ("A") REFERENCES "comentarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ComentarioToGenero" ADD CONSTRAINT "_ComentarioToGenero_B_fkey" FOREIGN KEY ("B") REFERENCES "generos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ComentarioToEditora" ADD CONSTRAINT "_ComentarioToEditora_A_fkey" FOREIGN KEY ("A") REFERENCES "comentarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ComentarioToEditora" ADD CONSTRAINT "_ComentarioToEditora_B_fkey" FOREIGN KEY ("B") REFERENCES "editoras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmprestimoToReserva" ADD CONSTRAINT "_EmprestimoToReserva_A_fkey" FOREIGN KEY ("A") REFERENCES "emprestimos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmprestimoToReserva" ADD CONSTRAINT "_EmprestimoToReserva_B_fkey" FOREIGN KEY ("B") REFERENCES "reservas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmprestimoToRenovacao" ADD CONSTRAINT "_EmprestimoToRenovacao_A_fkey" FOREIGN KEY ("A") REFERENCES "emprestimos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmprestimoToRenovacao" ADD CONSTRAINT "_EmprestimoToRenovacao_B_fkey" FOREIGN KEY ("B") REFERENCES "renovacoes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmprestimoToGenero" ADD CONSTRAINT "_EmprestimoToGenero_A_fkey" FOREIGN KEY ("A") REFERENCES "emprestimos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EmprestimoToGenero" ADD CONSTRAINT "_EmprestimoToGenero_B_fkey" FOREIGN KEY ("B") REFERENCES "generos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
