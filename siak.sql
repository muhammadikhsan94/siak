-- This script only contains the table creation statements and does not fully represent the table in database. It's still missing: indices, triggers. Do not use it as backup.

-- Table Definition
CREATE TABLE "public"."coa" (
    "id_coa" uuid NOT NULL,
    "no_coa" varchar(20),
    "nm_coa" varchar(255) NOT NULL,
    "id_coa_sub" uuid,
    "created_at" timestamp,
    "updated_at" timestamp,
    "deleted_at" timestamp,
    "id_updater" uuid,
    PRIMARY KEY ("id_coa")
);

-- This script only contains the table creation statements and does not fully represent the table in database. It's still missing: indices, triggers. Do not use it as backup.

-- Table Definition
CREATE TABLE "public"."coa_reporting" (
    "id_coa_reporting" uuid NOT NULL,
    "id_pengguna" uuid NOT NULL,
    "tgl_create" timestamp NOT NULL,
    "a_submit" bpchar(1) NOT NULL,
    "tgl_submit" timestamp,
    "id_verifikator" uuid,
    "tgl_verifikator" timestamp,
    "created_at" timestamp,
    "updated_at" timestamp,
    "deleted_at" timestamp,
    "id_updater" uuid,
    PRIMARY KEY ("id_coa_reporting")
);

-- This script only contains the table creation statements and does not fully represent the table in database. It's still missing: indices, triggers. Do not use it as backup.

-- Table Definition
CREATE TABLE "public"."coa_transaction" (
    "id_coa_transaction" uuid NOT NULL,
    "id_coa" uuid NOT NULL,
    "total" int8 NOT NULL,
    "created_at" timestamp,
    "updated_at" timestamp,
    "deleted_at" timestamp,
    "id_updater" uuid,
    "id_pengguna" uuid NOT NULL,
    "id_coa_reporting" uuid NOT NULL,
    PRIMARY KEY ("id_coa_transaction")
);

-- This script only contains the table creation statements and does not fully represent the table in database. It's still missing: indices, triggers. Do not use it as backup.

-- Table Definition
CREATE TABLE "public"."pengguna" (
    "id_pengguna" uuid NOT NULL,
    "username" varchar(100) NOT NULL,
    "password" varchar(60) NOT NULL,
    "nm_pengguna" varchar(255) NOT NULL,
    "jk" bpchar(1),
    "no_hp" varchar(15),
    "alamat" text,
    "created_at" timestamp,
    "updated_at" timestamp,
    "deleted_at" timestamp,
    "id_updater" uuid,
    PRIMARY KEY ("id_pengguna")
);

-- This script only contains the table creation statements and does not fully represent the table in database. It's still missing: indices, triggers. Do not use it as backup.

-- Squences
CREATE SEQUENCE IF NOT EXISTS perans_id_peran_seq

-- Table Definition
CREATE TABLE "public"."peran" (
    "id_peran" int4 NOT NULL DEFAULT nextval('perans_id_peran_seq'::regclass),
    "nm_peran" varchar(255) NOT NULL,
    "created_at" timestamp,
    "updated_at" timestamp,
    "deleted_at" timestamp,
    "id_updater" uuid,
    PRIMARY KEY ("id_peran")
);

-- This script only contains the table creation statements and does not fully represent the table in database. It's still missing: indices, triggers. Do not use it as backup.

-- Table Definition
CREATE TABLE "public"."role_pengguna" (
    "id_role_pengguna" uuid NOT NULL,
    "id_pengguna" uuid NOT NULL,
    "id_peran" int2 NOT NULL,
    "a_aktif" bpchar(1) NOT NULL,
    "created_at" timestamp,
    "updated_at" timestamp,
    "id_updater" uuid,
    "deleted_at" timestamp,
    PRIMARY KEY ("id_role_pengguna")
);

INSERT INTO "public"."coa" ("id_coa", "no_coa", "nm_coa", "id_coa_sub", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('d28b45f9-5c93-4230-a639-8bb33f6cc59e', '204', 'Simpanan berjangka calon anggota & koperasi lain', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:31:46', '2022-11-04 06:31:46', NULL, NULL);
INSERT INTO "public"."coa" ("id_coa", "no_coa", "nm_coa", "id_coa_sub", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('375d46ab-cf50-4940-931d-58bfd2498020', '205', 'Hutang Bank (Bagian jatuh tempo kurang 1 tahun)', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:31:57', '2022-11-04 06:31:57', NULL, NULL);
INSERT INTO "public"."coa" ("id_coa", "no_coa", "nm_coa", "id_coa_sub", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('3cd0752b-3563-4c16-99a0-ba2632ccb254', '206', 'Hutang LPDB (Bagian jatuh tempo kurang 1 tahun)', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:32:12', '2022-11-04 06:32:12', NULL, NULL);
INSERT INTO "public"."coa" ("id_coa", "no_coa", "nm_coa", "id_coa_sub", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('8d288cc1-01f8-4bad-ba2e-7c3f0bfa827b', '207', 'Hutang Pajak', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:32:22', '2022-11-04 06:32:22', NULL, NULL),
('55e2313e-f489-4d91-bc5c-356ccaa90e18', '101', 'Kas', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:18:51', '2022-11-04 04:18:51', NULL, NULL),
('6ec18b66-5bb8-4625-90cb-2792e607a96c', '102', 'Giro', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:19:04', '2022-11-04 04:19:04', NULL, NULL),
('64b9b81b-7340-4634-873e-ae821acfbbe3', '103', 'Tabungan', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:19:12', '2022-11-04 04:19:12', NULL, NULL),
('df29ce24-5de2-4a18-9251-bc22d8836fa2', '104', 'Deposito', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:19:28', '2022-11-04 04:19:28', NULL, NULL),
('182bb000-710d-42d6-a018-a5ec01b2032e', '105', 'Simpanan Sukarela pada Koperasi Lain', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:19:43', '2022-11-04 04:19:43', NULL, NULL),
('c2c08e37-1319-465d-8c8d-a30cbc401f97', '106', 'Simpanan Berjangka pada koperasi lain', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:19:52', '2022-11-04 04:19:52', NULL, NULL),
('10571528-4f9e-4db5-8c34-c851b68f8732', '208', 'Beban yang masih harus dibayar', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:32:30', '2022-11-04 06:32:30', NULL, NULL),
('40b3387d-9243-466b-9689-f88a2a221dde', '209', 'Pendapatan lain diterima dimuka', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:32:40', '2022-11-04 06:32:40', NULL, NULL),
('c418d40d-5a9b-43de-97ff-025103d1f7fd', '210', 'Hutang biaya', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:32:49', '2022-11-04 06:32:49', NULL, NULL),
('eea2e356-5363-4468-80b0-036f1dd1ee70', '211', 'Dana bagian SHU', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:32:58', '2022-11-04 06:32:58', NULL, NULL),
('cbce2550-9d48-4cfc-87b6-f87c98f02e3f', '212', 'Titipan dana kebajikan anggota (RPA)', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:33:05', '2022-11-04 06:33:05', NULL, NULL),
('ee470f11-9b74-4dd9-8a36-789e37f0d933', '213', 'Titipan jaminan kesehatan', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:33:12', '2022-11-04 06:33:12', NULL, NULL),
('35372d2c-d867-415a-9659-2d9364a1c1a2', '214', 'Titipan Zakat, Infaq dan Shadaqoh', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:33:20', '2022-11-04 06:33:20', NULL, NULL),
('401617e4-a957-4ff1-83fa-3df3a84e2063', '215', 'Hutang Sewa Guna Usaha (kurang 1 tahun)', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:33:30', '2022-11-04 06:33:30', NULL, NULL),
('a44e8692-325f-4e02-97a7-99dc176572fd', '216', 'Kewajiban Jangka Pendek Lainmya', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:33:39', '2022-11-04 06:33:39', NULL, NULL),
('7fbd5845-47c2-4ab9-ae5f-e8c734b11f5d', NULL, 'Hutang Jangka Panjang', NULL, '2022-11-04 06:34:23', '2022-11-04 06:34:23', NULL, NULL),
('7ab09c67-5ce4-4617-94c1-7037408b1e4e', '220', 'Hutang Bank', '7fbd5845-47c2-4ab9-ae5f-e8c734b11f5d', '2022-11-04 06:34:44', '2022-11-04 06:34:44', NULL, NULL),
('6ee108d6-87fb-4328-973e-710a01cadee4', '221', 'Hutang jangka panjang Koperasi lainnya', '7fbd5845-47c2-4ab9-ae5f-e8c734b11f5d', '2022-11-04 06:37:13', '2022-11-04 06:37:13', NULL, NULL),
('c35165bd-fe85-466a-bd68-26376a8c69ba', '222', 'Antar Kantor Pasiva', '7fbd5845-47c2-4ab9-ae5f-e8c734b11f5d', '2022-11-04 06:37:22', '2022-11-04 06:37:22', NULL, NULL),
('d773b973-8594-4fd1-a638-48af2e1460d6', '223', 'Simpanan Berjangka', '7fbd5845-47c2-4ab9-ae5f-e8c734b11f5d', '2022-11-04 06:37:30', '2022-11-04 06:37:30', NULL, NULL),
('abc98192-71ed-4857-8ad9-bf893ec51481', '107', 'Surat Berharga (Investasi Jangka Pendek)', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:26:30', '2022-11-04 04:26:30', NULL, NULL),
('2d77ad50-08a3-4626-98c1-691fc42eab0d', '108', 'Piutang anggota', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:26:42', '2022-11-04 04:26:42', NULL, NULL),
('e1b98a28-d5b1-437a-8797-174e977552cc', '109', 'Piutang pada calon anggota', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:27:07', '2022-11-04 04:27:07', NULL, NULL),
('df6b04a6-31f1-4677-a7d7-5bec095b3cb8', '1011', 'Piutang yang diberikan pada koperasi lain', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:27:20', '2022-11-04 04:27:20', NULL, NULL),
('a5ad4c4e-fb19-43c8-8ef2-b4b88fffe00e', '1012', 'Piutang Bunga', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:27:28', '2022-11-04 04:27:28', NULL, NULL),
('fcf584c8-fe3e-4e60-9693-ddd50cfd5568', '1013', 'Piutang lain-lain', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:27:36', '2022-11-04 04:27:36', NULL, NULL),
('debb03b7-b76d-4152-b580-1d8721ad6db4', '1014', 'Penyisihan pinjaman yang tidak tertagih', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:27:44', '2022-11-04 04:27:44', NULL, NULL),
('0f61929f-c693-4839-9691-ed543cd29dd3', '1015', 'Premi asuransi', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:27:53', '2022-11-04 04:27:53', NULL, NULL),
('09f183e4-d45f-4222-888a-dc87c92a03dc', '1016', 'Perlengkapan', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:28:01', '2022-11-04 04:28:01', NULL, NULL),
('046d1bbc-5266-4dc1-af5f-57aafef8bef7', '1017', 'Beban Dibayar Dimuka', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:28:10', '2022-11-04 04:28:10', NULL, NULL),
('cb4cafaa-f055-479d-9195-75da70fd50b2', '1018', 'Pendapatan Akan Diterima', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:28:21', '2022-11-04 04:28:21', NULL, NULL),
('58a1947c-feb9-49ed-aacb-2a3b1d00be70', '1019', 'Persediaan', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:28:28', '2022-11-04 04:28:28', NULL, NULL),
('5a27e8d4-cdb9-46c4-8e66-0ef0cad22fc6', '1020', 'Aktiva Lancar Lainnya', 'c831ce06-1786-4510-9246-5b75da2050b0', '2022-11-04 04:28:39', '2022-11-04 04:28:39', NULL, NULL),
('c0dc01f2-284e-4b1f-bb6d-7c2889a1eef4', '224', 'Titipan dana jangka panjang', '7fbd5845-47c2-4ab9-ae5f-e8c734b11f5d', '2022-11-04 06:37:37', '2022-11-04 06:37:37', NULL, NULL),
('31459c65-3b94-416b-9c35-b631ee31963c', '225', 'Hutang LPDB', '7fbd5845-47c2-4ab9-ae5f-e8c734b11f5d', '2022-11-04 06:37:46', '2022-11-04 06:37:46', NULL, NULL),
('c831ce06-1786-4510-9246-5b75da2050b0', NULL, 'Aktiva Lancar', NULL, '2022-11-04 04:18:31', '2022-11-04 06:24:15', NULL, NULL),
('15f0f68e-5827-485f-82b6-a67a7c27fadc', NULL, 'Investasi Jangka Panjang', NULL, '2022-11-04 06:24:36', '2022-11-04 06:24:36', NULL, NULL),
('0ee0fe26-3279-49c4-a5be-ac66a6b13839', '110', 'Simpanan/Tabungan Berjangka', '15f0f68e-5827-485f-82b6-a67a7c27fadc', '2022-11-04 06:25:13', '2022-11-04 06:25:13', NULL, NULL),
('7b59d0de-7ee7-4e1d-bf50-856c6eeefd6d', '111', 'Surat Berharga', '15f0f68e-5827-485f-82b6-a67a7c27fadc', '2022-11-04 06:25:20', '2022-11-04 06:25:20', NULL, NULL),
('87933d5e-cbec-40e3-92a1-4da406b3000c', '112', 'Simpanan di KSP lain', '15f0f68e-5827-485f-82b6-a67a7c27fadc', '2022-11-04 06:25:28', '2022-11-04 06:25:28', NULL, NULL),
('8adbd87b-dd3e-47fd-8d0b-e060480124ed', '113', 'Penyertaan pada Koperasi Lain', '15f0f68e-5827-485f-82b6-a67a7c27fadc', '2022-11-04 06:25:36', '2022-11-04 06:25:36', NULL, NULL),
('0f4fbbc3-f4b8-4db4-bcd9-90907cbaf984', '114', 'Penyertaan pada Lembaga Keuangan lain', '15f0f68e-5827-485f-82b6-a67a7c27fadc', '2022-11-04 06:25:58', '2022-11-04 06:25:58', NULL, NULL),
('61809e8c-8ea1-4c38-b83b-93005a9de239', '115', 'Investasi jangka panjang lainnya', '15f0f68e-5827-485f-82b6-a67a7c27fadc', '2022-11-04 06:26:11', '2022-11-04 06:26:11', NULL, NULL),
('09084efa-983f-4da7-b8b0-d8aaa1ff1fc5', NULL, 'Aktiva Tetap', NULL, '2022-11-04 06:27:24', '2022-11-04 06:27:24', NULL, NULL),
('c53a05f4-f5f6-4698-9127-ed8f8d6e8d91', '120', 'Tanah', '09084efa-983f-4da7-b8b0-d8aaa1ff1fc5', '2022-11-04 06:27:42', '2022-11-04 06:27:42', NULL, NULL),
('029230d2-f20f-471a-b21c-0222ec7e915c', '121', 'Bangunan', '09084efa-983f-4da7-b8b0-d8aaa1ff1fc5', '2022-11-04 06:27:54', '2022-11-04 06:27:54', NULL, NULL),
('e354f200-5741-4b44-ad82-a755202fcc5c', '122', 'Kendaraan', '09084efa-983f-4da7-b8b0-d8aaa1ff1fc5', '2022-11-04 06:28:03', '2022-11-04 06:28:03', NULL, NULL),
('c090933d-ab80-4f87-9242-d6170b39a991', '123', 'Inventaris dan Peralatan', '09084efa-983f-4da7-b8b0-d8aaa1ff1fc5', '2022-11-04 06:28:11', '2022-11-04 06:28:11', NULL, NULL),
('1338e9ac-1b69-420b-9fa9-2ac8b1c1796d', '124', 'Akumulasi penyusutan', '09084efa-983f-4da7-b8b0-d8aaa1ff1fc5', '2022-11-04 06:28:23', '2022-11-04 06:28:23', NULL, NULL),
('ce285a62-b080-4a52-893c-fecd75f178ce', NULL, 'Aktiva Tidak Berwujud', NULL, '2022-11-04 06:29:07', '2022-11-04 06:29:07', NULL, NULL),
('41e25c99-d327-4da2-8c79-c70e3d0d9310', '130', 'Aktiva Tidak Berwujud', 'ce285a62-b080-4a52-893c-fecd75f178ce', '2022-11-04 06:29:23', '2022-11-04 06:29:23', NULL, NULL),
('e7bc52e5-fba1-487f-bc2b-3ed5dee5af6a', NULL, 'Aktiva Lainnya', NULL, '2022-11-04 06:29:32', '2022-11-04 06:29:32', NULL, NULL),
('db43c906-ca52-4e94-891b-34d60de21006', '131', 'Beban ditangguhkan', 'e7bc52e5-fba1-487f-bc2b-3ed5dee5af6a', '2022-11-04 06:30:06', '2022-11-04 06:30:06', NULL, NULL),
('df0d4f8c-b4eb-46a3-a842-65c85cd7878a', '132', 'Amortisasi beban ditangguhkan', 'e7bc52e5-fba1-487f-bc2b-3ed5dee5af6a', '2022-11-04 06:30:14', '2022-11-04 06:30:14', NULL, NULL),
('481f53fd-00cb-413f-9627-878552f30fe9', '133', 'Agunan yang diambil alih', 'e7bc52e5-fba1-487f-bc2b-3ed5dee5af6a', '2022-11-04 06:30:23', '2022-11-04 06:30:23', NULL, NULL),
('c2bbbc72-8a06-4537-9fe7-1d6c0a0a8e39', '134', 'Beban Pra Operasional', 'e7bc52e5-fba1-487f-bc2b-3ed5dee5af6a', '2022-11-04 06:30:31', '2022-11-04 06:30:31', NULL, NULL),
('6eea9b76-68ed-41e4-bd69-453f21a20b1d', '135', 'Amortisasi Biaya Pra Operasional', 'e7bc52e5-fba1-487f-bc2b-3ed5dee5af6a', '2022-11-04 06:30:39', '2022-11-04 06:30:39', NULL, NULL),
('d01f38cc-c7b4-481b-862d-a681d2e5d63e', '136', 'Lain - lain', 'e7bc52e5-fba1-487f-bc2b-3ed5dee5af6a', '2022-11-04 06:30:47', '2022-11-04 06:30:47', NULL, NULL),
('affdc385-51a6-446e-b548-57f77ed7394b', NULL, 'Hutang Jangka Pendek', NULL, '2022-11-04 06:30:58', '2022-11-04 06:30:58', NULL, NULL),
('f659522b-8057-42bf-b286-a9cf659e6780', '201', 'Tabungan/simpanan anggota', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:31:16', '2022-11-04 06:31:16', NULL, NULL),
('9d9848fe-fa72-426a-8601-9f3b3fd510f5', '202', 'Tabungan/simpanan non anggota', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:31:25', '2022-11-04 06:31:25', NULL, NULL),
('425ebce5-0204-47f1-bd2a-38fedfe017f6', '203', 'Simpanan berjangka anggota', 'affdc385-51a6-446e-b548-57f77ed7394b', '2022-11-04 06:31:36', '2022-11-04 06:31:36', NULL, NULL),
('10fb4b91-b14c-441e-8913-614823efab4c', '226', 'Hutang Sewa Guna Usaha', '7fbd5845-47c2-4ab9-ae5f-e8c734b11f5d', '2022-11-04 06:39:32', '2022-11-04 06:39:32', NULL, NULL),
('f9dc486c-b8fa-412a-a508-d3f7b262b87c', '227', 'Hutang Jangka Panjang Lain', '7fbd5845-47c2-4ab9-ae5f-e8c734b11f5d', '2022-11-04 06:39:40', '2022-11-04 06:39:40', NULL, NULL),
('1c97ea29-900c-43d0-8543-d60e20f831f0', NULL, 'Ekuitas', NULL, '2022-11-04 06:39:47', '2022-11-04 06:39:47', NULL, NULL),
('e23afc80-06e0-4dc2-821c-45fe37174395', '301', 'Simpanan pokok', '1c97ea29-900c-43d0-8543-d60e20f831f0', '2022-11-04 06:40:04', '2022-11-04 06:40:04', NULL, NULL),
('087326e0-bab4-4730-add1-6fc32421ecd1', '301', 'Simpanan wajib', '1c97ea29-900c-43d0-8543-d60e20f831f0', '2022-11-04 06:40:20', '2022-11-04 06:40:20', NULL, NULL),
('b224f2b8-7bd5-4db5-9f9e-4ccdfab4cdde', '301', 'Modal Penyetaraan', '1c97ea29-900c-43d0-8543-d60e20f831f0', '2022-11-04 06:40:30', '2022-11-04 06:40:30', NULL, NULL),
('afc8f572-8056-4a0d-8418-0f99a60c4e77', '301', 'Modal Penyertaan', '1c97ea29-900c-43d0-8543-d60e20f831f0', '2022-11-04 06:40:38', '2022-11-04 06:40:38', NULL, NULL),
('7ebba47d-16a4-4829-a69b-a32afc73b9a9', '301', 'Modal sumbangan/hibah/donasi', '1c97ea29-900c-43d0-8543-d60e20f831f0', '2022-11-04 06:40:47', '2022-11-04 06:40:47', NULL, NULL),
('5eb2ebd5-ea19-407c-9a20-48e0e2ef5374', '301', 'Cadangan Umum', '1c97ea29-900c-43d0-8543-d60e20f831f0', '2022-11-04 06:40:56', '2022-11-04 06:40:56', NULL, NULL),
('8c543a3b-e4ad-4881-b787-2bbf407a2ba6', '301', 'Cadangan Tujuan Resiko', '1c97ea29-900c-43d0-8543-d60e20f831f0', '2022-11-04 06:41:03', '2022-11-04 06:41:03', NULL, NULL),
('e4ea84f6-0dc2-4970-96a3-66f114bcb1ee', '301', 'SHU periode sebelumnya', '1c97ea29-900c-43d0-8543-d60e20f831f0', '2022-11-04 06:41:11', '2022-11-04 06:41:11', NULL, NULL),
('1ebbf514-2715-43bc-b4e3-ce888c6a4eb1', '301', 'SHU periode berjalan', '1c97ea29-900c-43d0-8543-d60e20f831f0', '2022-11-04 06:41:20', '2022-11-04 06:41:20', NULL, NULL),
('a656f5eb-a9b4-4c8e-a15e-63ed4e6d280a', NULL, 'Partisipasi Bruto', NULL, '2022-11-04 06:41:38', '2022-11-04 06:41:38', NULL, NULL),
('bdc0a2af-6d02-449b-b99b-3bddfc69c221', '401', 'Pendapatan Jasa Pinjaman anggota', 'a656f5eb-a9b4-4c8e-a15e-63ed4e6d280a', '2022-11-04 06:41:55', '2022-11-04 06:41:55', NULL, NULL),
('9319667f-1ece-460f-995f-583ce20c13c3', '402', 'Pendapatan Administrasi Anggota', 'a656f5eb-a9b4-4c8e-a15e-63ed4e6d280a', '2022-11-04 06:42:04', '2022-11-04 06:42:04', NULL, NULL),
('fa6831f3-4e99-48fe-b8c9-70628ab38ce3', '403', 'Pendapatan Provisi Anggota', 'a656f5eb-a9b4-4c8e-a15e-63ed4e6d280a', '2022-11-04 06:42:17', '2022-11-04 06:42:17', NULL, NULL),
('56531895-9b08-4e25-a826-388f5df7994a', '404', 'Pendapatan Jasa Pelayanan Lainnya Anggota', 'a656f5eb-a9b4-4c8e-a15e-63ed4e6d280a', '2022-11-04 06:42:27', '2022-11-04 06:42:27', NULL, NULL),
('4b05ff7b-b265-4fba-aa99-9b12bb3e3540', NULL, 'Pendapatan Non Anggota', NULL, '2022-11-04 06:42:42', '2022-11-04 06:42:42', NULL, NULL),
('95ba379d-8cd8-4e9e-a416-18ba9a8ff872', '405', 'Pendapatan Jasa simpanan non anggota', '4b05ff7b-b265-4fba-aa99-9b12bb3e3540', '2022-11-04 06:43:00', '2022-11-04 06:43:00', NULL, NULL),
('3c244132-919b-4752-bada-fcccd9025833', '406', 'Pendapatan Administrasi non anggota', '4b05ff7b-b265-4fba-aa99-9b12bb3e3540', '2022-11-04 06:43:08', '2022-11-04 06:43:08', NULL, NULL),
('102a39ff-88c2-436a-a7dd-7141cbe4d42d', '407', 'Pendapatan Provisi non anggota', '4b05ff7b-b265-4fba-aa99-9b12bb3e3540', '2022-11-04 06:43:23', '2022-11-04 06:43:23', NULL, NULL),
('4ad50be5-cc32-46ed-a5de-1e7f94f0470d', '408', 'Pendapatan Jasa Pelayanan Lainnya non anggota', '4b05ff7b-b265-4fba-aa99-9b12bb3e3540', '2022-11-04 06:43:31', '2022-11-04 06:43:31', NULL, NULL),
('46d45498-f64f-4d2e-8a22-20ab9e90b9ab', NULL, 'Beban Pokok Anggota', NULL, '2022-11-04 06:43:45', '2022-11-04 06:43:45', NULL, NULL),
('1b84ec98-3ef1-4218-b5f6-e5d953a2b9fd', '501', 'Beban Jasa Simpanan /Tabungan dari Anggota', '46d45498-f64f-4d2e-8a22-20ab9e90b9ab', '2022-11-04 06:44:01', '2022-11-04 06:44:01', NULL, NULL),
('6ca2dcd5-85e1-4c45-856b-d70493d0b4bc', '502', 'Beban Jasa Simpanan Berjangka dari Anggota', '46d45498-f64f-4d2e-8a22-20ab9e90b9ab', '2022-11-04 06:44:14', '2022-11-04 06:44:14', NULL, NULL),
('51906010-e053-4509-91e0-5cfd2a30bf31', NULL, 'Beban Pokok Non Anggota', NULL, '2022-11-04 06:47:42', '2022-11-04 06:47:42', NULL, NULL),
('90c80b6c-8061-4469-82ba-1aeba452897d', '503', 'Beban Jasa Simpanan / Tabungan dari Non Anggota', '51906010-e053-4509-91e0-5cfd2a30bf31', '2022-11-04 06:47:58', '2022-11-04 06:47:58', NULL, NULL),
('b64f5d52-63af-4125-a911-b12e115969a3', '504', 'Beban Jasa Simpanan Berjangka dari Non Anggota', '51906010-e053-4509-91e0-5cfd2a30bf31', '2022-11-04 06:48:07', '2022-11-04 06:48:07', NULL, NULL),
('0f848ebd-97d8-4069-8f31-7b1dd1aa66ab', '505', 'Beban Jasa Hutang Bank', '51906010-e053-4509-91e0-5cfd2a30bf31', '2022-11-04 06:48:27', '2022-11-04 06:48:27', NULL, NULL),
('3a73e607-8dab-4ac8-90cd-968b9b368eab', '506', 'Beban Jasa Pinjaman LPDB', '51906010-e053-4509-91e0-5cfd2a30bf31', '2022-11-04 06:48:36', '2022-11-04 06:48:36', NULL, NULL),
('f39d6dad-305f-4dd4-9874-1fb15fad3088', '507', 'Beban Jasa Modal Penyertaan', '51906010-e053-4509-91e0-5cfd2a30bf31', '2022-11-04 06:48:47', '2022-11-04 06:48:47', NULL, NULL),
('cd22c845-5641-4102-8598-25a8795452fe', '508', 'Beban Jasa Pinjaman Pihak ke III', '51906010-e053-4509-91e0-5cfd2a30bf31', '2022-11-04 06:49:02', '2022-11-04 06:49:02', NULL, NULL),
('090460ad-be4a-4dbc-9445-c035d15d4a35', NULL, 'Beban Usaha', NULL, '2022-11-04 06:49:17', '2022-11-04 06:49:17', NULL, NULL),
('81590215-502f-4b52-b1f9-248614ec4861', '509', 'Biaya Penyisihan Penghapusan Piutang', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:49:37', '2022-11-04 06:49:37', NULL, NULL),
('20c22c0e-ca25-4ab0-80cb-91bc7d3eaecd', '510', 'Biaya bunga pinjaman', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:49:46', '2022-11-04 06:49:46', NULL, NULL),
('90bf8472-107f-4dd5-a2b3-1937dbbcb6d0', '511', 'Honor karyawan', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:50:04', '2022-11-04 06:50:04', NULL, NULL),
('d3b4138e-a963-4b25-9028-ec13ecab2552', '512', 'Biaya perlengkapan', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:50:14', '2022-11-04 06:50:14', NULL, NULL),
('7b1d22b8-8017-49c5-9d17-bbf068905521', '513', 'Biaya asuransi', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:50:24', '2022-11-04 06:50:24', NULL, NULL),
('1ba93764-7cef-4616-8eff-4ad547a08a2a', '514', 'Biaya listrik, air dan telepon', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:50:32', '2022-11-04 06:50:32', NULL, NULL),
('be76cd83-8035-4cb0-aafb-142a490f2cbc', '515', 'Biaya penyusutan', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:50:42', '2022-11-04 06:50:42', NULL, NULL),
('e964780d-4346-47e2-a5c2-f01d3a8ac428', '516', 'Biaya lain-lain (karyawan)', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:50:53', '2022-11-04 06:50:53', NULL, NULL),
('15fac8d0-7993-4549-8e82-a8423bdafd4c', '517', 'Biaya Pemeliharaaan', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:51:05', '2022-11-04 06:51:05', NULL, NULL),
('52a5fb9d-ab37-43f3-9553-74e5dcee7b44', '518', 'Biaya Promosi dan Pemasaran', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:52:53', '2022-11-04 06:52:53', NULL, NULL),
('1f1791e6-795a-48e6-8ea3-519ad7b28db8', '519', 'Biaya Akomodasi dan Konsumsi', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:53:02', '2022-11-04 06:53:02', NULL, NULL),
('d8470504-7ddb-4538-92a5-4c15482f6674', '520', 'Biaya Transportasi', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:53:11', '2022-11-04 06:53:11', NULL, NULL),
('aa7135b2-46a5-45d5-b691-629ffdc9e972', '521', 'Biaya administrasi dan umum', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:53:20', '2022-11-04 06:53:20', NULL, NULL),
('ac5f156d-cc04-4830-ab4f-7ffa9a185fc9', '522', 'Biaya Pajak (tidak termasuk pajak penghasilan)', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:53:29', '2022-11-04 06:53:29', NULL, NULL),
('846cb434-06eb-4526-9a87-d2cb8c67764e', '523', 'Biaya sewa tahun berjalan (sosial)', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:53:38', '2022-11-04 06:53:38', NULL, NULL),
('4eb5d2d8-766a-46ae-8d46-30bfbd99d35d', '524', 'Biaya Operasional lain', '090460ad-be4a-4dbc-9445-c035d15d4a35', '2022-11-04 06:53:47', '2022-11-04 06:53:47', NULL, NULL),
('5c36c50d-b98c-4151-acf3-edc68954d875', NULL, 'Beban Perkoperasian', NULL, '2022-11-04 06:54:07', '2022-11-04 06:54:07', NULL, NULL),
('b813794a-05aa-4fe0-989a-786dc9e18303', '525', 'Beban Pengawas dan pengurus koperasi', '5c36c50d-b98c-4151-acf3-edc68954d875', '2022-11-04 06:55:38', '2022-11-04 06:55:38', NULL, NULL),
('24f60d73-ae66-4a2a-bc51-371c2c3ea893', '526', 'Beban Pembinaan', '5c36c50d-b98c-4151-acf3-edc68954d875', '2022-11-04 06:55:47', '2022-11-04 06:55:47', NULL, NULL),
('d5da99f1-ecdf-4f85-8afb-5032ed3d75cc', '527', 'Beban Rapat Anggota', '5c36c50d-b98c-4151-acf3-edc68954d875', '2022-11-04 06:55:56', '2022-11-04 06:55:56', NULL, NULL),
('72ed99f1-d9bd-4545-9a59-8e509ba280ea', NULL, 'Pendapatan Lain-lain', NULL, '2022-11-04 06:56:04', '2022-11-04 06:56:04', NULL, NULL),
('5624f9de-68a4-44c5-b653-5f25eadeeb0b', '528', 'Pendapatan Dividen dan bagi hasil usaha', '72ed99f1-d9bd-4545-9a59-8e509ba280ea', '2022-11-04 06:56:16', '2022-11-04 06:56:16', NULL, NULL),
('736e45cb-33e8-4c13-9179-c5233e2ba79c', '529', 'Pendapatan sewa', '72ed99f1-d9bd-4545-9a59-8e509ba280ea', '2022-11-04 06:56:25', '2022-11-04 06:56:25', NULL, NULL),
('bdac1c0f-704b-451e-a410-e9f724185e66', '530', 'Pendapatan Lain-lain', '72ed99f1-d9bd-4545-9a59-8e509ba280ea', '2022-11-04 06:56:34', '2022-11-04 06:56:34', NULL, NULL),
('91a1d4b9-bb70-4fcf-963c-957f33519e45', NULL, 'Beban Lain-lain', NULL, '2022-11-04 06:56:44', '2022-11-04 06:56:44', NULL, NULL),
('f887b565-a960-41a1-963d-78d9e0decdd7', '531', 'Biaya lain-lain', '91a1d4b9-bb70-4fcf-963c-957f33519e45', '2022-11-04 06:56:57', '2022-11-04 06:56:57', NULL, NULL),
('bec7ad31-2e7a-4aef-94fe-7ed4ad9a94b9', NULL, 'Pajak Penghasilan', NULL, '2022-11-04 06:57:05', '2022-11-04 06:57:05', NULL, NULL),
('fe3a9f71-e692-41f3-b9d3-f090af4be7e3', '532', 'Pajak Penghasilan', 'bec7ad31-2e7a-4aef-94fe-7ed4ad9a94b9', '2022-11-04 06:57:18', '2022-11-04 06:57:18', NULL, NULL),
('a6a0251f-fa57-4c90-bb6f-b6e78f4f20d7', NULL, 'Pajak Bermasalah', NULL, '2022-11-04 06:57:27', '2022-11-04 06:57:27', NULL, NULL),
('5eb0c2a2-8f05-49b4-9ae0-b5971e1660c0', '601', 'Pinjaman Kurang Lancar (PKL):', 'a6a0251f-fa57-4c90-bb6f-b6e78f4f20d7', '2022-11-04 06:57:41', '2022-11-04 06:57:41', NULL, NULL),
('18cd7e20-af25-46af-b7ff-cd6e86db528c', '602', 'Pinjaman yang Diragukan (PDR):', 'a6a0251f-fa57-4c90-bb6f-b6e78f4f20d7', '2022-11-04 06:57:53', '2022-11-04 06:57:53', NULL, NULL),
('e80c5d47-003c-4416-9c31-57fdfb2c158a', '603', 'Pinjaman Macet:', 'a6a0251f-fa57-4c90-bb6f-b6e78f4f20d7', '2022-11-04 06:58:02', '2022-11-04 06:58:02', NULL, NULL),
('850b7cbc-6ab5-4faf-9583-c81abad6d596', NULL, 'Agunan', NULL, '2022-11-04 06:58:11', '2022-11-04 06:58:11', NULL, NULL),
('a6f7a3b9-e969-457b-a353-cb13b978ec2a', '604', 'Nilai agunan pinjaman kurang lancar', '850b7cbc-6ab5-4faf-9583-c81abad6d596', '2022-11-04 06:58:24', '2022-11-04 06:58:24', NULL, NULL),
('dc63644c-b530-463f-9c74-056c1752c54d', '605', 'Nilai agunan pinjaman diragukan', '850b7cbc-6ab5-4faf-9583-c81abad6d596', '2022-11-04 06:58:32', '2022-11-04 06:58:32', NULL, NULL),
('80b4a9de-452e-4553-b657-32eaa0df0381', '606', 'Nilai agunan pinjaman macet', '850b7cbc-6ab5-4faf-9583-c81abad6d596', '2022-11-04 06:58:43', '2022-11-04 06:58:43', NULL, NULL);

INSERT INTO "public"."coa_reporting" ("id_coa_reporting", "id_pengguna", "tgl_create", "a_submit", "tgl_submit", "id_verifikator", "tgl_verifikator", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('96be5c23-6e65-40e2-8cb0-7cff67d12a58', '9d430d22-26da-40ee-866b-4a7cb9015b45', '2022-11-05 09:23:19', '2', '2022-11-08 06:18:38', '9d430d22-26da-40ee-866b-4a7cb9015b45', '2022-11-14 06:30:14', '2022-11-05 09:23:19', '2022-11-14 06:30:14', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45');
INSERT INTO "public"."coa_reporting" ("id_coa_reporting", "id_pengguna", "tgl_create", "a_submit", "tgl_submit", "id_verifikator", "tgl_verifikator", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('c48548bb-f490-45a7-a773-0acc064a1967', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '2022-11-14 06:39:40', '0', NULL, NULL, NULL, '2022-11-14 06:39:40', '2022-11-14 06:39:40', NULL, NULL);


INSERT INTO "public"."coa_transaction" ("id_coa_transaction", "id_coa", "total", "created_at", "updated_at", "deleted_at", "id_updater", "id_pengguna", "id_coa_reporting") VALUES
('c72d37c6-0f05-4534-92b8-3c0c3eaf1d68', '55e2313e-f489-4d91-bc5c-356ccaa90e18', 0, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58');
INSERT INTO "public"."coa_transaction" ("id_coa_transaction", "id_coa", "total", "created_at", "updated_at", "deleted_at", "id_updater", "id_pengguna", "id_coa_reporting") VALUES
('6add25af-1617-4a63-9de4-db4fac2a5e34', '6ec18b66-5bb8-4625-90cb-2792e607a96c', 0, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58');
INSERT INTO "public"."coa_transaction" ("id_coa_transaction", "id_coa", "total", "created_at", "updated_at", "deleted_at", "id_updater", "id_pengguna", "id_coa_reporting") VALUES
('0bcc77dc-fc66-49d6-8f61-6b2470145426', '64b9b81b-7340-4634-873e-ae821acfbbe3', 0, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58');
INSERT INTO "public"."coa_transaction" ("id_coa_transaction", "id_coa", "total", "created_at", "updated_at", "deleted_at", "id_updater", "id_pengguna", "id_coa_reporting") VALUES
('f01faf5c-1b36-425e-b872-a2131255b306', 'df29ce24-5de2-4a18-9251-bc22d8836fa2', 0, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('26237d0a-c8c7-4bf4-99e6-e60604bb015d', '182bb000-710d-42d6-a018-a5ec01b2032e', 5000000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('e62819c9-0823-411a-923c-4300c684f535', 'c2c08e37-1319-465d-8c8d-a30cbc401f97', 2000000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('ef17e808-fdb3-4f34-a609-991960bf83ec', 'abc98192-71ed-4857-8ad9-bf893ec51481', 10000000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('fa7c6abd-fcf2-4aaa-8e87-0b8a38d52b7a', '2d77ad50-08a3-4626-98c1-691fc42eab0d', 2000000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('d4662099-70bf-4399-8414-09d376764248', 'e1b98a28-d5b1-437a-8797-174e977552cc', 40000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('080df4d8-473a-4651-b1bb-e8c8957fd89e', 'df6b04a6-31f1-4677-a7d7-5bec095b3cb8', 500000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('77c2347f-1282-4a1f-8f36-5afe0e70af99', 'a5ad4c4e-fb19-43c8-8ef2-b4b88fffe00e', 10000000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('107faf17-719f-4f25-8b34-ba0759c968c9', 'fcf584c8-fe3e-4e60-9693-ddd50cfd5568', 200000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('2642c9cb-fe25-41fc-b1c0-6505a8e284cb', 'debb03b7-b76d-4152-b580-1d8721ad6db4', 30000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('42d9a926-ea1b-4ca9-a845-1d1ce4cf35f9', '0f61929f-c693-4839-9691-ed543cd29dd3', 2000000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('ef8605ab-5eae-4d47-9c08-a61555fa3980', '09f183e4-d45f-4222-888a-dc87c92a03dc', 10000000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('9846576d-1d68-45d7-a403-29b5e50ac12f', '046d1bbc-5266-4dc1-af5f-57aafef8bef7', 2000000, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('a5d467c7-4293-4f84-9a9f-a6ee14593890', 'cb4cafaa-f055-479d-9195-75da70fd50b2', 0, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('0711731d-6d90-41d1-8702-cee41cd3487a', '58a1947c-feb9-49ed-aacb-2a3b1d00be70', 0, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('616382f1-353f-4d25-98de-50dd2e3887b5', '5a27e8d4-cdb9-46c4-8e66-0ef0cad22fc6', 0, '2022-11-08 04:04:22', '2022-11-08 04:04:22', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('a4023304-11db-4b87-ad25-fdd91dad88ec', '0ee0fe26-3279-49c4-a5be-ac66a6b13839', 0, '2022-11-08 04:04:38', '2022-11-08 04:04:38', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('317f1fc8-d086-406d-85f7-471f24c50b0c', '7b59d0de-7ee7-4e1d-bf50-856c6eeefd6d', 0, '2022-11-08 04:04:38', '2022-11-08 04:04:38', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('607a575b-e019-4907-a78a-760260ff13ce', '87933d5e-cbec-40e3-92a1-4da406b3000c', 0, '2022-11-08 04:04:38', '2022-11-08 04:04:38', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('5bd476eb-18b8-4685-a4ff-286476f619ae', '8adbd87b-dd3e-47fd-8d0b-e060480124ed', 5000000, '2022-11-08 04:04:38', '2022-11-08 04:04:38', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('78373740-ffdc-43fa-a594-1b145fba6038', '0f4fbbc3-f4b8-4db4-bcd9-90907cbaf984', 2000000, '2022-11-08 04:04:38', '2022-11-08 04:04:38', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('7a2fbfd6-d65e-45b8-a747-c51d70d5bf8c', '61809e8c-8ea1-4c38-b83b-93005a9de239', 20000000, '2022-11-08 04:04:38', '2022-11-08 04:04:38', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('8e5c491b-5b1c-43b7-8772-7b37f044b2bf', 'c53a05f4-f5f6-4698-9127-ed8f8d6e8d91', 0, '2022-11-08 04:04:45', '2022-11-08 04:04:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('9746c1c3-79d2-4b86-a229-a3c9b32a1f4e', '029230d2-f20f-471a-b21c-0222ec7e915c', 0, '2022-11-08 04:04:45', '2022-11-08 04:04:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('6e06920d-0290-427c-96c3-145a58da74de', 'e354f200-5741-4b44-ad82-a755202fcc5c', 0, '2022-11-08 04:04:45', '2022-11-08 04:04:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('b2fa6c94-3a47-4bbd-b962-8d1824b2b784', 'c090933d-ab80-4f87-9242-d6170b39a991', 0, '2022-11-08 04:04:45', '2022-11-08 04:04:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('6a0a9c67-c918-4727-8aa0-6b7a73272579', '1338e9ac-1b69-420b-9fa9-2ac8b1c1796d', 0, '2022-11-08 04:04:45', '2022-11-08 04:04:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('f4f64b92-31cd-4cee-8449-d3874645e038', '41e25c99-d327-4da2-8c79-c70e3d0d9310', 10000000000, '2022-11-08 04:04:53', '2022-11-08 04:04:53', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('9a87e5e9-2f88-4989-af4f-017f9e7913a4', 'db43c906-ca52-4e94-891b-34d60de21006', 0, '2022-11-08 04:05:09', '2022-11-08 04:05:09', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('4126eb0b-afe9-4b9a-b06b-ac2a94b3f96d', 'df0d4f8c-b4eb-46a3-a842-65c85cd7878a', 5000000, '2022-11-08 04:05:09', '2022-11-08 04:05:09', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('88114bee-4a26-4e07-9e2a-beedee4dd11e', '481f53fd-00cb-413f-9627-878552f30fe9', 200000, '2022-11-08 04:05:09', '2022-11-08 04:05:09', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('fd339cd8-e747-4bc6-a2b4-7eef09843c3d', 'c2bbbc72-8a06-4537-9fe7-1d6c0a0a8e39', 20000000, '2022-11-08 04:05:09', '2022-11-08 04:05:09', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('b4185f81-bec4-472b-af05-1ae5326d81ea', '6eea9b76-68ed-41e4-bd69-453f21a20b1d', 10000000, '2022-11-08 04:05:09', '2022-11-08 04:05:09', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('a6f287a5-9dfd-4a8d-a99e-4bdd22df69ca', 'd01f38cc-c7b4-481b-862d-a681d2e5d63e', 0, '2022-11-08 04:05:09', '2022-11-08 04:05:09', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('1fbcfb04-1fdb-4be6-a30b-8fdff373d0cb', 'f659522b-8057-42bf-b286-a9cf659e6780', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('6c7c1b7c-a55f-4aa7-817a-2366c01a3ec1', '9d9848fe-fa72-426a-8601-9f3b3fd510f5', 2000000, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('83c7b7c2-603d-4cbd-a9df-e6aaf870d20d', '425ebce5-0204-47f1-bd2a-38fedfe017f6', 5000000, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('2ea64237-2a79-44c8-8dd9-5827d72a506b', 'd28b45f9-5c93-4230-a639-8bb33f6cc59e', 2000000, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('51ecd659-0052-4761-9c47-8618028c89f0', '375d46ab-cf50-4940-931d-58bfd2498020', 10000000, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('000ec054-a259-4f40-9ce0-5dd3eb6223e9', '3cd0752b-3563-4c16-99a0-ba2632ccb254', 2000000, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('14cdfd89-15ff-47c4-bdf1-34f5c40e9a7f', '8d288cc1-01f8-4bad-ba2e-7c3f0bfa827b', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('622ed1d4-ae01-4491-b432-32ff2b995b84', '10571528-4f9e-4db5-8c34-c851b68f8732', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('a0046be3-b509-4ca7-ae95-011dac83a098', '40b3387d-9243-466b-9689-f88a2a221dde', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('b3f187b7-9211-46b8-ae9c-c00d9dc4f6c5', 'c418d40d-5a9b-43de-97ff-025103d1f7fd', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('c445b233-acb1-444c-b7cf-b0ee36ad79a3', 'eea2e356-5363-4468-80b0-036f1dd1ee70', 500000000, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('30826493-2408-495b-8d50-8174117b917a', 'cbce2550-9d48-4cfc-87b6-f87c98f02e3f', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('8e818571-673d-4dfd-9d63-36eb85f298f3', 'ee470f11-9b74-4dd9-8a36-789e37f0d933', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('ee8258da-8e46-49fe-98aa-9df0e8e28fc1', '35372d2c-d867-415a-9659-2d9364a1c1a2', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('d90c9002-10af-4cfd-a529-35248b247985', '401617e4-a957-4ff1-83fa-3df3a84e2063', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('7279d59f-b0b3-4c5e-993a-1ab21e1d2c90', 'a44e8692-325f-4e02-97a7-99dc176572fd', 0, '2022-11-08 04:05:45', '2022-11-08 04:05:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('2dcd4533-4215-4994-af51-15f3ac31ff71', '7ab09c67-5ce4-4617-94c1-7037408b1e4e', 0, '2022-11-08 04:06:31', '2022-11-08 04:06:31', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('7abd2f09-26ad-407c-9815-a8d5e0dba462', '6ee108d6-87fb-4328-973e-710a01cadee4', 0, '2022-11-08 04:06:31', '2022-11-08 04:06:31', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('fa2cb957-7335-43bd-a4b1-8442d5d96d64', 'c35165bd-fe85-466a-bd68-26376a8c69ba', 0, '2022-11-08 04:06:31', '2022-11-08 04:06:31', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('8d6510f4-4afa-440e-80ba-c9d882cb1a2f', 'd773b973-8594-4fd1-a638-48af2e1460d6', 0, '2022-11-08 04:06:31', '2022-11-08 04:06:31', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('49105aff-d55c-462f-b8d7-d1d2fd46ac82', 'c0dc01f2-284e-4b1f-bb6d-7c2889a1eef4', 0, '2022-11-08 04:06:31', '2022-11-08 04:06:31', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('8026f615-93e0-43cb-952a-547a4847291c', '31459c65-3b94-416b-9c35-b631ee31963c', 0, '2022-11-08 04:06:31', '2022-11-08 04:06:31', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('8941d408-abbc-42da-87b1-d08f4b24d02a', '10fb4b91-b14c-441e-8913-614823efab4c', 0, '2022-11-08 04:06:31', '2022-11-08 04:06:31', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('18e09cbd-ede9-47eb-bd8d-dc1c68f71db0', 'f9dc486c-b8fa-412a-a508-d3f7b262b87c', 0, '2022-11-08 04:06:31', '2022-11-08 04:06:31', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('38bfd14c-4a72-4aa4-9218-4c3f5c0536f7', 'e23afc80-06e0-4dc2-821c-45fe37174395', 0, '2022-11-08 04:06:37', '2022-11-08 04:06:37', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('47031aaa-6e78-4115-8e75-4da641f86149', '087326e0-bab4-4730-add1-6fc32421ecd1', 0, '2022-11-08 04:06:37', '2022-11-08 04:06:37', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('cee4697b-d13e-4a42-837f-4e6985e01842', 'b224f2b8-7bd5-4db5-9f9e-4ccdfab4cdde', 0, '2022-11-08 04:06:37', '2022-11-08 04:06:37', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('87ad44c7-2842-4dc3-8e9f-6e315560e0f2', 'afc8f572-8056-4a0d-8418-0f99a60c4e77', 0, '2022-11-08 04:06:37', '2022-11-08 04:06:37', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('0f027e59-b8c4-46e7-825f-224ccb52e400', '7ebba47d-16a4-4829-a69b-a32afc73b9a9', 0, '2022-11-08 04:06:37', '2022-11-08 04:06:37', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('e22838a5-3950-424e-93db-577b7d0ee8d3', '5eb2ebd5-ea19-407c-9a20-48e0e2ef5374', 0, '2022-11-08 04:06:37', '2022-11-08 04:06:37', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('7d41912c-f2c3-4f34-b9b7-068e50b06e8e', '8c543a3b-e4ad-4881-b787-2bbf407a2ba6', 0, '2022-11-08 04:06:37', '2022-11-08 04:06:37', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('89bfb018-39f6-4bd3-9c03-bde2b5f2ef0f', 'e4ea84f6-0dc2-4970-96a3-66f114bcb1ee', 0, '2022-11-08 04:06:37', '2022-11-08 04:06:37', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('53b3f209-7c86-4560-a272-117ec71f085a', '1ebbf514-2715-43bc-b4e3-ce888c6a4eb1', 0, '2022-11-08 04:06:37', '2022-11-08 04:06:37', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('4cf8bcd3-bc6e-4da6-81a1-c4da397d761f', 'bdc0a2af-6d02-449b-b99b-3bddfc69c221', 0, '2022-11-08 04:06:53', '2022-11-08 04:06:53', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('e9468bad-708f-4932-bd09-1cd1d51feede', '9319667f-1ece-460f-995f-583ce20c13c3', 0, '2022-11-08 04:06:53', '2022-11-08 04:06:53', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('2bc812d8-b377-4eb0-8fee-d314e6e270f1', 'fa6831f3-4e99-48fe-b8c9-70628ab38ce3', 20000000, '2022-11-08 04:06:53', '2022-11-08 04:06:53', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('8d6e77be-94c8-47b4-827a-a1eed981ae24', '56531895-9b08-4e25-a826-388f5df7994a', 0, '2022-11-08 04:06:53', '2022-11-08 04:06:53', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('365f857b-dda1-4186-9597-c6ac78bb7ff6', '95ba379d-8cd8-4e9e-a416-18ba9a8ff872', 0, '2022-11-08 04:07:05', '2022-11-08 04:07:05', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('bf59e4b8-d6c5-4995-b331-dae494649d11', '3c244132-919b-4752-bada-fcccd9025833', 1000000, '2022-11-08 04:07:05', '2022-11-08 04:07:05', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('dd34fa8c-81d7-4db2-9e78-6b8ef8bada30', '102a39ff-88c2-436a-a7dd-7141cbe4d42d', 400000, '2022-11-08 04:07:05', '2022-11-08 04:07:05', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('bd3aa1ed-e02b-43dc-aef2-c3eb6864f1ae', '4ad50be5-cc32-46ed-a5de-1e7f94f0470d', 0, '2022-11-08 04:07:05', '2022-11-08 04:07:05', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('1fb5ef89-d8da-4735-8fc1-f2f6bbb181ed', '1b84ec98-3ef1-4218-b5f6-e5d953a2b9fd', 3000000, '2022-11-08 04:07:16', '2022-11-08 04:07:16', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('b01d5b4e-27d7-47c8-aaa6-ee0a1e4573ea', '6ca2dcd5-85e1-4c45-856b-d70493d0b4bc', 10000000, '2022-11-08 04:07:16', '2022-11-08 04:07:16', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('0cdd9130-1c4a-4805-87be-3db973f37bcf', '90c80b6c-8061-4469-82ba-1aeba452897d', 5000000, '2022-11-08 04:07:39', '2022-11-08 04:07:39', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('a73fc02d-cdcc-43c8-b77a-0c74485c4a46', 'b64f5d52-63af-4125-a911-b12e115969a3', 100000, '2022-11-08 04:07:39', '2022-11-08 04:07:39', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('6655e7c2-d78f-4497-81ac-0c5840334176', '0f848ebd-97d8-4069-8f31-7b1dd1aa66ab', 2000000, '2022-11-08 04:07:39', '2022-11-08 04:07:39', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('ca3cfdf6-3040-4d8c-ac1e-7feb6373a7ae', '3a73e607-8dab-4ac8-90cd-968b9b368eab', 3000000, '2022-11-08 04:07:39', '2022-11-08 04:07:39', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('0c8e3956-18b7-40cb-8788-1a9784408b33', 'f39d6dad-305f-4dd4-9874-1fb15fad3088', 100000000, '2022-11-08 04:07:39', '2022-11-08 04:07:39', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('819ef7d6-303a-49b7-858b-8f4b52d3c9b5', 'cd22c845-5641-4102-8598-25a8795452fe', 10000000, '2022-11-08 04:07:39', '2022-11-08 04:07:39', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('4333ee3b-cb5a-4622-9dc5-5e1b73419d6b', '81590215-502f-4b52-b1f9-248614ec4861', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('e5faff90-1cfc-4fcf-8e96-15c6fed2db9a', '20c22c0e-ca25-4ab0-80cb-91bc7d3eaecd', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('b23819a6-6d76-4b54-b885-be398ef2ff1c', '90bf8472-107f-4dd5-a2b3-1937dbbcb6d0', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('426f240e-ccd5-43d2-bd6a-96ba13592780', 'd3b4138e-a963-4b25-9028-ec13ecab2552', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('1129fbab-fc05-41f7-88b4-f0436196d4be', '7b1d22b8-8017-49c5-9d17-bbf068905521', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('590864ef-83c1-496f-9703-c6ced7562c06', '1ba93764-7cef-4616-8eff-4ad547a08a2a', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('729f7d6e-b514-43ad-b431-8308d5caa735', 'be76cd83-8035-4cb0-aafb-142a490f2cbc', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('c0267c8e-9fb3-4333-b688-5257c65a792e', 'e964780d-4346-47e2-a5c2-f01d3a8ac428', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('97816eda-f1ac-4eef-a603-0e7d20ca67a5', '15fac8d0-7993-4549-8e82-a8423bdafd4c', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('e5b6234b-222c-4c16-9101-bf615af02191', '52a5fb9d-ab37-43f3-9553-74e5dcee7b44', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('852ba6de-5217-4450-a144-d77b12a169b3', '1f1791e6-795a-48e6-8ea3-519ad7b28db8', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('b2d0bc43-eeb7-48fa-8eec-e252b672374e', 'd8470504-7ddb-4538-92a5-4c15482f6674', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('92334467-e2b8-4511-a41e-050f549b25d4', 'aa7135b2-46a5-45d5-b691-629ffdc9e972', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('b1bb9b3c-30aa-47b1-926e-50f1f111d975', 'ac5f156d-cc04-4830-ab4f-7ffa9a185fc9', 0, '2022-11-08 04:07:45', '2022-11-08 04:07:45', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('2e42146b-c943-4036-a41a-bf1b4e0030df', '846cb434-06eb-4526-9a87-d2cb8c67764e', 0, '2022-11-08 04:07:46', '2022-11-08 04:07:46', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('2c375933-11e7-4b7d-9742-c498b948bbd1', '4eb5d2d8-766a-46ae-8d46-30bfbd99d35d', 0, '2022-11-08 04:07:46', '2022-11-08 04:07:46', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('f5fba0a7-0961-4ca5-b441-0569ac31f9fb', 'b813794a-05aa-4fe0-989a-786dc9e18303', 0, '2022-11-08 04:07:52', '2022-11-08 04:07:52', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('92148a40-aedf-4258-a39a-1d74690c8b41', '24f60d73-ae66-4a2a-bc51-371c2c3ea893', 0, '2022-11-08 04:07:52', '2022-11-08 04:07:52', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('5b129067-9fa4-42cb-9c64-445edd5a0606', 'd5da99f1-ecdf-4f85-8afb-5032ed3d75cc', 0, '2022-11-08 04:07:52', '2022-11-08 04:07:52', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('97ecd353-4282-477b-84a4-e91b453b1db5', '5624f9de-68a4-44c5-b653-5f25eadeeb0b', 0, '2022-11-08 04:07:58', '2022-11-08 04:07:58', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('eab4fe28-6711-473b-bafd-0782dac50840', '736e45cb-33e8-4c13-9179-c5233e2ba79c', 0, '2022-11-08 04:07:58', '2022-11-08 04:07:58', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('4f401c1c-8bc1-4383-81a7-6a7403d1a790', 'bdac1c0f-704b-451e-a410-e9f724185e66', 0, '2022-11-08 04:07:58', '2022-11-08 04:07:58', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('86f40610-faf7-4a99-a3a6-2cfadfc968e8', 'f887b565-a960-41a1-963d-78d9e0decdd7', 0, '2022-11-08 04:08:06', '2022-11-08 04:08:06', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('67d7c834-a5fd-4726-99e2-e0eca813bf00', 'fe3a9f71-e692-41f3-b9d3-f090af4be7e3', 500000, '2022-11-08 04:08:26', '2022-11-08 04:08:26', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('de062135-a8e2-4233-9b44-c7200ebb49b5', '5eb0c2a2-8f05-49b4-9ae0-b5971e1660c0', 0, '2022-11-08 04:08:32', '2022-11-08 04:08:32', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('e1db995a-4345-4fc3-a556-375c33788b58', '18cd7e20-af25-46af-b7ff-cd6e86db528c', 0, '2022-11-08 04:08:32', '2022-11-08 04:08:32', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('5aa7b40d-ad70-4e61-8837-dfba72e32a88', 'e80c5d47-003c-4416-9c31-57fdfb2c158a', 0, '2022-11-08 04:08:32', '2022-11-08 04:08:32', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('96d0a128-a71c-4a2c-b909-26bbb7d76ea8', 'a6f7a3b9-e969-457b-a353-cb13b978ec2a', 0, '2022-11-08 04:08:39', '2022-11-08 04:08:39', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('d4dd1909-dfea-4f9a-ab09-28d399a037bb', 'dc63644c-b530-463f-9c74-056c1752c54d', 0, '2022-11-08 04:08:39', '2022-11-08 04:08:39', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('384b38d3-8429-41fd-a98d-f919fed07851', '80b4a9de-452e-4553-b657-32eaa0df0381', 0, '2022-11-08 04:08:39', '2022-11-08 04:08:39', NULL, '9d430d22-26da-40ee-866b-4a7cb9015b45', '9d430d22-26da-40ee-866b-4a7cb9015b45', '96be5c23-6e65-40e2-8cb0-7cff67d12a58'),
('f1205f69-cb56-4427-8bc2-89d11a18f767', '55e2313e-f489-4d91-bc5c-356ccaa90e18', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('86016baf-b51d-4847-83df-765c022d66e2', '6ec18b66-5bb8-4625-90cb-2792e607a96c', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('dcd388b1-c549-4835-9892-a50f7fc25ce7', '64b9b81b-7340-4634-873e-ae821acfbbe3', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('ab079093-ffa4-4c54-996d-359acda75a2e', 'df29ce24-5de2-4a18-9251-bc22d8836fa2', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('f0e02e7f-2036-4d4d-a42a-2537cdb2996c', '182bb000-710d-42d6-a018-a5ec01b2032e', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('30ecdbf8-1050-4e97-97fe-13a7a6948c3e', 'c2c08e37-1319-465d-8c8d-a30cbc401f97', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('0c1bc0a5-ca5a-4b0d-8997-528e3a17c4b6', 'abc98192-71ed-4857-8ad9-bf893ec51481', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('5ac70f99-5465-4c75-b6b0-41d19a429650', '2d77ad50-08a3-4626-98c1-691fc42eab0d', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('db52f1e7-67c8-4377-b5e6-725a34106a61', 'e1b98a28-d5b1-437a-8797-174e977552cc', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('cc15376d-5d14-4060-97b5-8efb16092aa8', 'df6b04a6-31f1-4677-a7d7-5bec095b3cb8', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('adae51c1-0e84-40de-b82b-b7402353d7a5', 'a5ad4c4e-fb19-43c8-8ef2-b4b88fffe00e', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('50a5e8b7-cdbe-4b16-b190-bc88e612b221', 'fcf584c8-fe3e-4e60-9693-ddd50cfd5568', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('debae79f-ef35-424c-a9bd-faf58e2b55f5', 'debb03b7-b76d-4152-b580-1d8721ad6db4', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('61980daa-f9f8-40b2-b266-05d2ae28b097', '0f61929f-c693-4839-9691-ed543cd29dd3', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('cee7b66b-526b-40cf-a7c8-ad75db4592df', '09f183e4-d45f-4222-888a-dc87c92a03dc', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('1abce986-1cb0-4908-8602-a92cd4cbd420', '046d1bbc-5266-4dc1-af5f-57aafef8bef7', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('abca9562-33d7-4a4b-be2a-327d2e74b5d2', 'cb4cafaa-f055-479d-9195-75da70fd50b2', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('7c7e26cb-9ff4-44ca-920a-f29393588629', '58a1947c-feb9-49ed-aacb-2a3b1d00be70', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967'),
('eff48566-a673-43d8-a854-f523bb565a07', '5a27e8d4-cdb9-46c4-8e66-0ef0cad22fc6', 0, '2022-11-14 06:42:09', '2022-11-14 06:42:09', NULL, '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'c48548bb-f490-45a7-a773-0acc064a1967');

INSERT INTO "public"."pengguna" ("id_pengguna", "username", "password", "nm_pengguna", "jk", "no_hp", "alamat", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('9d430d22-26da-40ee-866b-4a7cb9015b45', 'admin', '$2y$10$/d5P99mDglv080anzZUoleFsUboY.5vT54wPz3.rfPECZW6Iaig.u', 'administrator', 'l', '08', 'jalanin aja dulu', '2022-11-02 07:30:05', '2022-11-02 07:30:05', NULL, NULL);
INSERT INTO "public"."pengguna" ("id_pengguna", "username", "password", "nm_pengguna", "jk", "no_hp", "alamat", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('a50e152f-5f71-4978-aea0-25f41cc64cef', 'dinaskoperasi', '$2y$10$xWv8g0EW64lNkN7iE9Vs2.qJoenYMMBLvebrH3m.CAo.KR8wfvHaK', 'Dinas Koperasi & UMKM', 'l', '08', 'jalanin aja dulu', '2022-11-02 07:30:39', '2022-11-02 07:30:39', NULL, NULL);
INSERT INTO "public"."pengguna" ("id_pengguna", "username", "password", "nm_pengguna", "jk", "no_hp", "alamat", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 'koperasi1', '$2y$10$YFD.M9NzsDbgPGejhPEP0e9/gkwukdoWx75EhZrIwnaJdWAqnGtzW', 'Koperasi 1', 'l', '08', 'jalanin aja dulu', '2022-11-02 07:39:49', '2022-11-02 07:39:49', NULL, NULL);
INSERT INTO "public"."pengguna" ("id_pengguna", "username", "password", "nm_pengguna", "jk", "no_hp", "alamat", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
('477e0f46-49f9-460f-aca4-8136321fd0d1', 'test123', '$2y$10$2ET7mvcVkFutFXzVIqP7l.cn02tfxFbiudVgQv4odXj7KNP2l2ySi', 'test123', 'l', '08', 'test', '2022-11-04 03:11:06', '2022-11-04 03:18:03', '2022-11-04 03:18:03', NULL),
('f8933765-acd3-4200-8bd5-8c9ef324550e', 'test', '$2y$10$L/hFHcyBqKXdiCZGTaspb.58bsXmfOA1S7Wl8ZANLrRU3YzOQMwYS', 'test', 'l', '08', 'test', '2022-11-04 03:10:55', '2022-11-04 03:18:07', '2022-11-04 03:18:07', NULL),
('aa5532ed-daa6-48af-ab95-067645d21cfd', 'ok1', '$2y$10$SWmB.qgMzgM2DPixVkdWaOBnKik6AUrF1Ws6UwQGXot1wiC2ZsEqy', 'ok2', 'p', '081', 'ok2', '2022-11-04 03:18:20', '2022-11-04 03:18:34', '2022-11-04 03:18:34', NULL);

INSERT INTO "public"."peran" ("id_peran", "nm_peran", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
(1, 'Administrator', '2022-11-02 04:28:08', '2022-11-02 04:28:08', NULL, 'c8e04648-0c73-4687-b49b-7db1ddcefcae');
INSERT INTO "public"."peran" ("id_peran", "nm_peran", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
(2, 'Dinas Koperasi & UMKM', '2022-11-02 04:30:17', '2022-11-02 04:30:17', NULL, 'f3b05532-cd3f-427e-987e-c614e5460447');
INSERT INTO "public"."peran" ("id_peran", "nm_peran", "created_at", "updated_at", "deleted_at", "id_updater") VALUES
(3, 'Koperasi', '2022-11-02 04:30:25', '2022-11-02 04:30:25', NULL, 'f578333f-97fc-425f-b545-cb12adb19db6');

INSERT INTO "public"."role_pengguna" ("id_role_pengguna", "id_pengguna", "id_peran", "a_aktif", "created_at", "updated_at", "id_updater", "deleted_at") VALUES
('d25a1e2a-9b7f-4f61-8d33-73c631b0396f', '9d430d22-26da-40ee-866b-4a7cb9015b45', 1, '1', '2022-11-02 07:30:05', '2022-11-02 07:30:05', NULL, NULL);
INSERT INTO "public"."role_pengguna" ("id_role_pengguna", "id_pengguna", "id_peran", "a_aktif", "created_at", "updated_at", "id_updater", "deleted_at") VALUES
('fd6b9d37-21d9-4365-80a1-7ce2122b2095', 'a50e152f-5f71-4978-aea0-25f41cc64cef', 2, '1', '2022-11-02 07:30:39', '2022-11-02 07:30:39', NULL, NULL);
INSERT INTO "public"."role_pengguna" ("id_role_pengguna", "id_pengguna", "id_peran", "a_aktif", "created_at", "updated_at", "id_updater", "deleted_at") VALUES
('1ae81cd1-ddf1-4887-a973-1463e85dec35', '9ee90006-e392-4ccd-9ab3-555a76fcd1d7', 3, '1', '2022-11-02 07:39:49', '2022-11-02 07:39:49', NULL, NULL);
INSERT INTO "public"."role_pengguna" ("id_role_pengguna", "id_pengguna", "id_peran", "a_aktif", "created_at", "updated_at", "id_updater", "deleted_at") VALUES
('16a08e1b-ac67-471c-94f0-a60ffd150c38', '477e0f46-49f9-460f-aca4-8136321fd0d1', 3, '1', '2022-11-04 03:11:06', '2022-11-04 03:18:03', NULL, '2022-11-04 03:18:03'),
('e5f87fa5-999e-4295-8377-ebd388b4c091', 'f8933765-acd3-4200-8bd5-8c9ef324550e', 1, '1', '2022-11-04 03:10:55', '2022-11-04 03:18:07', NULL, '2022-11-04 03:18:07'),
('87621586-e41b-4ab5-bae7-1f29321f9330', 'aa5532ed-daa6-48af-ab95-067645d21cfd', 2, '1', '2022-11-04 03:18:20', '2022-11-04 03:18:34', NULL, '2022-11-04 03:18:34');
