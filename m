Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A9A65160
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Mar 2025 14:38:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEA11C78F80;
	Mon, 17 Mar 2025 13:38:52 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5695ACFAC45
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 13:38:52 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so691160366b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742218732; x=1742823532;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VsxTsk0oraNQm0LWdF6trrCJbD0TB0300z0RaWixEkY=;
 b=m0B5USBLuT3d7XoP7aocO+xw56P9Wg2kvm+amD6HcPVgALpKNeW/sA2PG/n/0wgsiM
 nmQAK+FL3p37VvlkaBqyK8PlYAiLNU67gzGd48w56cSQbduG4BRmeus2BZ5MU8rRf8C3
 l0m/deBPeCFFphb66XwUj/ei9TF9B+HnWnl+DuFq+D7MrMfVRi+rmwtAkClY0YULk6li
 nBrfHkVxyxVJFlPOVPzxreK9bSwRfd9f6Plyz+p95+fWk6M4yTlvv1Qy8+vCleKFnfpE
 lz3KMQYH9nnvsEtQpuX8GapuogZozey1IZumJRhPg6/0chDI2AI/ns5EBz5GFWxuhhoO
 qoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742218732; x=1742823532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VsxTsk0oraNQm0LWdF6trrCJbD0TB0300z0RaWixEkY=;
 b=NJs73bWlbrzmHNAIKwp1MORumq5TvBLqW1QF58j0bavaWzvm1tY1iMT7+fuP/cWRc5
 DxV2ssTJhDjNNWyIUu2lwUE5jS6zGKhGwijkCyreYPywFTABmyHmLxW3wZhq8ykPNdtQ
 Hl+sEheiSZjR/D52OlznXcuR9XyW16ye3hCvsYTK1HWRdJoM1UvpqBfAYk7WPsdBXHRk
 ze62IWudQrYc6NFs7HIdU1Bw0wUbxf/5Oa8ZucC0ZL3411K/VGRFEv4IclR2ivqH42NB
 2P8G5yLQup8oTlJ8YaruDmz+L+HNPqRagMQAHNaghCz7a97IlAhIsoCG0ji2fYkvvzfy
 3WEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNYZlTJEetRyQKbd3pMIQVQnydIkvbhRpRIPBzsyIpikjqBc7sBaw9tVvgSv3XeSMAQeh+zxb94I5gGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyspipvrS7qGcyEbjSf5vdhPltChmbjmTF0Ey+id1EgUkfBQM4y
 sBIH8MplEmb6vvph0nE2PuVb09b89+pQreY+cYog3cK/hmvQzIbfL+iasRsc/WU=
X-Gm-Gg: ASbGncuerDc2QK+HEftgNX35QnzAX4ZYjA7+5S1NpQIdMgroDcEcxmwwEvwi0F9Qu8+
 A5ER+SRySqYcJs3Up541aD10Bz1GpE4e9Zhv4dYOtPOWc3bqaWpGXHdrFESJA4yXZ80cuII/Nfr
 hFZo9bMt8kcuYQb92g+vI88EcMa0hv/96QYo32ge68NIcjBK/ZpYJyksVo33FiK30UH6r3LlBeQ
 N90dxaoXqwnRpNkSHwO+qlVOFgpCI5ZK8SqaC2xzA+Yc4v05NFnrm3SYqtW/9v6/NOgSt+84PQ4
 qqnTlgeE9Ltfp0qB4GHYeOl5cl3Se2QLFmW1V6u7jNgoTbd8ovlvqLxN5yYIJsKo5cVLDTOqDiS
 Ui9pG4QJcbaR/6avZn+hGoKc=
X-Google-Smtp-Source: AGHT+IGz/mkJrJmaTYr3hvqf2h2xDRrf66wyZK9v+3QDEP7TM4n7th8i8lfYddbi9DDtFumjw3sj1w==
X-Received: by 2002:a17:907:2d89:b0:ac2:7a6d:c927 with SMTP id
 a640c23a62f3a-ac3304d698cmr1431975466b.50.1742218731401; 
 Mon, 17 Mar 2025 06:38:51 -0700 (PDT)
Received: from localhost.localdomain (ppp089210242125.access.hol.gr.
 [89.210.242.125]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a495a3sm663734266b.159.2025.03.17.06.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 06:38:50 -0700 (PDT)
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: xypron.glpk@gmx.de
Date: Mon, 17 Mar 2025 15:38:36 +0200
Message-ID: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 u-boot@lists.denx.de, Wei Ming Chen <jj251510319013@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>, Tom Rini <trini@konsulko.com>,
 Udit Agarwal <udit.agarwal@nxp.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Manish Tomar <Manish.Tomar@nxp.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Wasim Khan <wasim.khan@nxp.com>,
 Mathew McBride <matt@traverse.com.au>,
 =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Tien Fong Chee <tien.fong.chee@altera.com>, e@freeshell.de,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Adriano Cordova <adrianox@gmail.com>, Ashish Kumar <Ashish.Kumar@nxp.com>,
 Sumit Garg <sumit.garg@kernel.org>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@intel.com>,
 Lukas Funke <lukas.funke@weidmueller.com>,
 Robert Marko <robert.marko@sartura.hr>, Michal Simek <michal.simek@amd.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tang Yuantian <andy.tang@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Maks Mishin <maks.mishinfz@gmail.com>,
 Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] efi_loader: remove EFI_BOUNCE_BUFFER
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

The EFI subsystem defines its own bounce buffer for devices that
can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
which can be reused instead of defining another symbol.
The only limitation for EFI is that we don't know how big the file a user
chooses to transfer is and as a result we can't depend on allocating the
memory from the malloc area, which can prove too small.

So allocate an EFI buffer of the correct size and pass it to the DM,
which already supports bounce buffering via bounce_buffer_start_extalign()

Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
---
 arch/arm/Kconfig                              |  8 ++
 configs/ls1028aqds_tfa_SECURE_BOOT_defconfig  |  1 -
 configs/ls1028aqds_tfa_defconfig              |  1 -
 configs/ls1028aqds_tfa_lpuart_defconfig       |  1 -
 configs/ls1028ardb_tfa_SECURE_BOOT_defconfig  |  1 -
 configs/ls1028ardb_tfa_defconfig              |  1 -
 configs/ls1043ardb_tfa_SECURE_BOOT_defconfig  |  1 -
 configs/ls1043ardb_tfa_defconfig              |  1 -
 configs/ls1046ardb_tfa_SECURE_BOOT_defconfig  |  1 -
 configs/ls1046ardb_tfa_defconfig              |  1 -
 configs/ls1088aqds_tfa_defconfig              |  1 -
 configs/ls1088ardb_tfa_SECURE_BOOT_defconfig  |  1 -
 configs/ls1088ardb_tfa_defconfig              |  1 -
 configs/ls2088aqds_tfa_defconfig              |  1 -
 configs/ls2088ardb_tfa_SECURE_BOOT_defconfig  |  1 -
 configs/ls2088ardb_tfa_defconfig              |  1 -
 configs/lx2160aqds_tfa_SECURE_BOOT_defconfig  |  1 -
 configs/lx2160aqds_tfa_defconfig              |  1 -
 configs/lx2160ardb_tfa_SECURE_BOOT_defconfig  |  1 -
 configs/lx2160ardb_tfa_defconfig              |  1 -
 configs/lx2160ardb_tfa_stmm_defconfig         |  1 -
 configs/lx2162aqds_tfa_SECURE_BOOT_defconfig  |  1 -
 configs/lx2162aqds_tfa_defconfig              |  1 -
 .../lx2162aqds_tfa_verified_boot_defconfig    |  1 -
 configs/ten64_tfa_defconfig                   |  1 -
 include/efi_loader.h                          |  4 -
 lib/efi_loader/Kconfig                        |  7 --
 lib/efi_loader/efi_disk.c                     | 78 +++++++------------
 lib/efi_loader/efi_memory.c                   | 16 ----
 29 files changed, 36 insertions(+), 101 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index cf08fe63f1e7..bb946e69254c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1417,6 +1417,7 @@ config TARGET_LS2080A_EMU
 	select ARCH_LS2080A
 	select ARM64
 	select ARMV8_MULTIENTRY
+	select BOUNCE_BUFFER
 	select FSL_DDR_SYNC_REFRESH
 	select GPIO_EXTRA_HEADER
 	help
@@ -1432,6 +1433,7 @@ config TARGET_LS1088AQDS
 	select ARMV8_MULTIENTRY
 	select ARCH_SUPPORT_TFABOOT
 	select BOARD_LATE_INIT
+	select BOUNCE_BUFFER
 	select GPIO_EXTRA_HEADER
 	select SUPPORT_SPL
 	select FSL_DDR_INTERACTIVE if !SD_BOOT
@@ -1448,6 +1450,7 @@ config TARGET_LS2080AQDS
 	select ARMV8_MULTIENTRY
 	select ARCH_SUPPORT_TFABOOT
 	select BOARD_LATE_INIT
+	select BOUNCE_BUFFER
 	select GPIO_EXTRA_HEADER
 	select SUPPORT_SPL
 	imply SCSI
@@ -1467,6 +1470,7 @@ config TARGET_LS2080ARDB
 	select ARMV8_MULTIENTRY
 	select ARCH_SUPPORT_TFABOOT
 	select BOARD_LATE_INIT
+	select BOUNCE_BUFFER
 	select SUPPORT_SPL
 	select FSL_DDR_BIST
 	select FSL_DDR_INTERACTIVE if !SPL
@@ -1485,6 +1489,7 @@ config TARGET_LS2081ARDB
 	select ARM64
 	select ARMV8_MULTIENTRY
 	select BOARD_LATE_INIT
+	select BOUNCE_BUFFER
 	select GPIO_EXTRA_HEADER
 	select SUPPORT_SPL
 	help
@@ -1500,6 +1505,7 @@ config TARGET_LX2160ARDB
 	select ARMV8_MULTIENTRY
 	select ARCH_SUPPORT_TFABOOT
 	select BOARD_LATE_INIT
+	select BOUNCE_BUFFER
 	select GPIO_EXTRA_HEADER
 	help
 	  Support for NXP LX2160ARDB platform.
@@ -1514,6 +1520,7 @@ config TARGET_LX2160AQDS
 	select ARMV8_MULTIENTRY
 	select ARCH_SUPPORT_TFABOOT
 	select BOARD_LATE_INIT
+	select BOUNCE_BUFFER
 	select GPIO_EXTRA_HEADER
 	help
 	  Support for NXP LX2160AQDS platform.
@@ -1529,6 +1536,7 @@ config TARGET_LX2162AQDS
 	select ARMV8_MULTIENTRY
 	select ARCH_SUPPORT_TFABOOT
 	select BOARD_LATE_INIT
+	select BOUNCE_BUFFER
 	select GPIO_EXTRA_HEADER
 	help
 	  Support for NXP LX2162AQDS platform.
diff --git a/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig b/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig
index 97eb7d9dca4c..e3b1018f6f8e 100644
--- a/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig
@@ -23,7 +23,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
 CONFIG_SYS_MEMTEST_END=0x9fffffff
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ls1028aqds_tfa_defconfig b/configs/ls1028aqds_tfa_defconfig
index cc53c17f543b..5b7dd4bf7dd5 100644
--- a/configs/ls1028aqds_tfa_defconfig
+++ b/configs/ls1028aqds_tfa_defconfig
@@ -25,7 +25,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
 CONFIG_SYS_MEMTEST_END=0x9fffffff
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ls1028aqds_tfa_lpuart_defconfig b/configs/ls1028aqds_tfa_lpuart_defconfig
index 8da7271c7f85..a38c81e83199 100644
--- a/configs/ls1028aqds_tfa_lpuart_defconfig
+++ b/configs/ls1028aqds_tfa_lpuart_defconfig
@@ -24,7 +24,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
 CONFIG_SYS_MEMTEST_END=0x9fffffff
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig
index 3f71a37559be..da225e1dad8f 100644
--- a/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig
@@ -23,7 +23,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
 CONFIG_SYS_MEMTEST_END=0x9fffffff
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ls1028ardb_tfa_defconfig b/configs/ls1028ardb_tfa_defconfig
index 89e452bdb1a8..829cc5204d34 100644
--- a/configs/ls1028ardb_tfa_defconfig
+++ b/configs/ls1028ardb_tfa_defconfig
@@ -25,7 +25,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
 CONFIG_SYS_MEMTEST_END=0x9fffffff
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig
index 1b41fe608dae..04ca2a3afd81 100644
--- a/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig
@@ -24,7 +24,6 @@ CONFIG_PCIE2=y
 CONFIG_PCIE3=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ls1043ardb_tfa_defconfig b/configs/ls1043ardb_tfa_defconfig
index ca100bd4bca9..a6ca63cd8f79 100644
--- a/configs/ls1043ardb_tfa_defconfig
+++ b/configs/ls1043ardb_tfa_defconfig
@@ -26,7 +26,6 @@ CONFIG_PCIE2=y
 CONFIG_PCIE3=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig
index 6b4e834ad4a0..9c22d542a6f8 100644
--- a/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig
@@ -24,7 +24,6 @@ CONFIG_PCIE2=y
 CONFIG_PCIE3=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ls1046ardb_tfa_defconfig b/configs/ls1046ardb_tfa_defconfig
index a8f20f9b87b7..4eab8ea19e8e 100644
--- a/configs/ls1046ardb_tfa_defconfig
+++ b/configs/ls1046ardb_tfa_defconfig
@@ -26,7 +26,6 @@ CONFIG_PCIE2=y
 CONFIG_PCIE3=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ls1088aqds_tfa_defconfig b/configs/ls1088aqds_tfa_defconfig
index df86bf982ee4..31d56f587af8 100644
--- a/configs/ls1088aqds_tfa_defconfig
+++ b/configs/ls1088aqds_tfa_defconfig
@@ -29,7 +29,6 @@ CONFIG_SYS_MEMTEST_END=0x9fffffff
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig
index df472eeb404d..c910b73634f9 100644
--- a/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig
@@ -26,7 +26,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
 CONFIG_SYS_MEMTEST_END=0x9fffffff
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/ls1088ardb_tfa_defconfig b/configs/ls1088ardb_tfa_defconfig
index 8d640f6594b2..682007e803d1 100644
--- a/configs/ls1088ardb_tfa_defconfig
+++ b/configs/ls1088ardb_tfa_defconfig
@@ -28,7 +28,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
 CONFIG_SYS_MEMTEST_END=0x9fffffff
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/ls2088aqds_tfa_defconfig b/configs/ls2088aqds_tfa_defconfig
index 8c86b8b11eb3..ea73a4cda971 100644
--- a/configs/ls2088aqds_tfa_defconfig
+++ b/configs/ls2088aqds_tfa_defconfig
@@ -23,7 +23,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_BOOTDELAY=10
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig b/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig
index 3fd1de967896..7f53397cdcb1 100644
--- a/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig
@@ -27,7 +27,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_BOOTDELAY=10
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/ls2088ardb_tfa_defconfig b/configs/ls2088ardb_tfa_defconfig
index f053044fa56e..398dfe068015 100644
--- a/configs/ls2088ardb_tfa_defconfig
+++ b/configs/ls2088ardb_tfa_defconfig
@@ -29,7 +29,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_BOOTDELAY=10
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig b/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig
index 321ed71993b8..afb842978209 100644
--- a/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig
@@ -28,7 +28,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
diff --git a/configs/lx2160aqds_tfa_defconfig b/configs/lx2160aqds_tfa_defconfig
index 465f07ee7f82..ec23ed384c44 100644
--- a/configs/lx2160aqds_tfa_defconfig
+++ b/configs/lx2160aqds_tfa_defconfig
@@ -30,7 +30,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_BOOTDELAY=10
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig b/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig
index 478a01b566c6..71f4436eca06 100644
--- a/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig
@@ -29,7 +29,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
diff --git a/configs/lx2160ardb_tfa_defconfig b/configs/lx2160ardb_tfa_defconfig
index 8fd18825569c..6be3890de3ed 100644
--- a/configs/lx2160ardb_tfa_defconfig
+++ b/configs/lx2160ardb_tfa_defconfig
@@ -31,7 +31,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_BOOTDELAY=10
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/lx2160ardb_tfa_stmm_defconfig b/configs/lx2160ardb_tfa_stmm_defconfig
index cf65897af898..ef89b0f34575 100644
--- a/configs/lx2160ardb_tfa_stmm_defconfig
+++ b/configs/lx2160ardb_tfa_stmm_defconfig
@@ -32,7 +32,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
 CONFIG_EFI_MM_COMM_TEE=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_BOOTDELAY=10
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/lx2162aqds_tfa_SECURE_BOOT_defconfig b/configs/lx2162aqds_tfa_SECURE_BOOT_defconfig
index 46b6085a52fe..2b31be10899b 100644
--- a/configs/lx2162aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/lx2162aqds_tfa_SECURE_BOOT_defconfig
@@ -28,7 +28,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
diff --git a/configs/lx2162aqds_tfa_defconfig b/configs/lx2162aqds_tfa_defconfig
index 41e0262f3ca5..43f8069cfde5 100644
--- a/configs/lx2162aqds_tfa_defconfig
+++ b/configs/lx2162aqds_tfa_defconfig
@@ -30,7 +30,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_BOOTDELAY=10
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/lx2162aqds_tfa_verified_boot_defconfig b/configs/lx2162aqds_tfa_verified_boot_defconfig
index 7abfdbafbdf1..33b362c20b65 100644
--- a/configs/lx2162aqds_tfa_verified_boot_defconfig
+++ b/configs/lx2162aqds_tfa_verified_boot_defconfig
@@ -30,7 +30,6 @@ CONFIG_FSL_QIXIS=y
 CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_DYNAMIC_SYS_CLK_FREQ=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/ten64_tfa_defconfig b/configs/ten64_tfa_defconfig
index a65209e8335b..f35de31718f7 100644
--- a/configs/ten64_tfa_defconfig
+++ b/configs/ten64_tfa_defconfig
@@ -16,7 +16,6 @@ CONFIG_PCI=y
 CONFIG_AHCI=y
 CONFIG_SYS_FSL_NUM_CC_PLLS=3
 CONFIG_MP=y
-CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_BOOTSTD_FULL=y
 CONFIG_BOOTSTD_BOOTCOMMAND=y
diff --git a/include/efi_loader.h b/include/efi_loader.h
index e9c10819ba26..3ed27e97a083 100644
--- a/include/efi_loader.h
+++ b/include/efi_loader.h
@@ -894,10 +894,6 @@ efi_status_t efi_setup_loaded_image(struct efi_device_path *device_path,
 				    struct efi_loaded_image_obj **handle_ptr,
 				    struct efi_loaded_image **info_ptr);

-#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
-extern void *efi_bounce_buffer;
-#define EFI_LOADER_BOUNCE_BUFFER_SIZE (64 * 1024 * 1024)
-#endif

 /* shorten device path */
 struct efi_device_path *efi_dp_shorten(struct efi_device_path *dp);
diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
index 6130af14337e..bc08776ef4a6 100644
--- a/lib/efi_loader/Kconfig
+++ b/lib/efi_loader/Kconfig
@@ -490,13 +490,6 @@ config EFI_HTTP_PROTOCOL
 endmenu

 menu "Misc options"
-config EFI_LOADER_BOUNCE_BUFFER
-	bool "EFI Applications use bounce buffers for DMA operations"
-	help
-	  Some hardware does not support DMA to full 64bit addresses. For this
-	  hardware we can create a bounce buffer so that payloads don't have to
-	  worry about platform details.
-
 config EFI_GRUB_ARM32_WORKAROUND
 	bool "Workaround for GRUB on 32bit ARM"
 	default n if ARCH_BCM283X || ARCH_SUNXI || ARCH_QEMU
diff --git a/lib/efi_loader/efi_disk.c b/lib/efi_loader/efi_disk.c
index 5452640354e0..a0202032bb5a 100644
--- a/lib/efi_loader/efi_disk.c
+++ b/lib/efi_loader/efi_disk.c
@@ -105,6 +105,8 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,
 	int blksz;
 	int blocks;
 	unsigned long n;
+	u64 bb = 0xffffffff;
+	void *bb_ptr = buffer;

 	diskobj = container_of(this, struct efi_disk_obj, ops);
 	blksz = diskobj->media.block_size;
@@ -113,27 +115,35 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,
 	EFI_PRINT("blocks=%x lba=%llx blksz=%x dir=%d\n",
 		  blocks, lba, blksz, direction);

+	if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && (uintptr_t)buffer >= SZ_4G + buffer_size - 1) {
+		if (efi_allocate_pages(EFI_ALLOCATE_MAX_ADDRESS, EFI_BOOT_SERVICES_DATA,
+				       buffer_size >> EFI_PAGE_SHIFT, &bb) != EFI_SUCCESS)
+			return EFI_OUT_OF_RESOURCES;
+
+		bb_ptr = (void *)(uintptr_t)bb;
+	}
 	/* We only support full block access */
-	if (buffer_size & (blksz - 1))
+	if (buffer_size & (blksz - 1)) {
+		if (buffer != bb_ptr)
+			efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
 		return EFI_BAD_BUFFER_SIZE;
+	}

 	if (CONFIG_IS_ENABLED(PARTITIONS) &&
 	    device_get_uclass_id(diskobj->header.dev) == UCLASS_PARTITION) {
 		if (direction == EFI_DISK_READ)
-			n = disk_blk_read(diskobj->header.dev, lba, blocks,
-					  buffer);
+			n = disk_blk_read(diskobj->header.dev, lba, blocks, bb_ptr);
 		else
-			n = disk_blk_write(diskobj->header.dev, lba, blocks,
-					   buffer);
+			n = disk_blk_write(diskobj->header.dev, lba, blocks, bb_ptr);
 	} else {
 		/* dev is a block device (UCLASS_BLK) */
 		struct blk_desc *desc;

 		desc = dev_get_uclass_plat(diskobj->header.dev);
 		if (direction == EFI_DISK_READ)
-			n = blk_dread(desc, lba, blocks, buffer);
+			n = blk_dread(desc, lba, blocks, bb_ptr);
 		else
-			n = blk_dwrite(desc, lba, blocks, buffer);
+			n = blk_dwrite(desc, lba, blocks, bb_ptr);
 	}

 	/* We don't do interrupts, so check for timers cooperatively */
@@ -141,8 +151,16 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,

 	EFI_PRINT("n=%lx blocks=%x\n", n, blocks);

-	if (n != blocks)
+	if (n != blocks) {
+		if (buffer != bb_ptr)
+			efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
 		return EFI_DEVICE_ERROR;
+	}
+
+	if (buffer != bb_ptr) {
+		memcpy(buffer, bb_ptr, buffer_size);
+		efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
+	}

 	return EFI_SUCCESS;
 }
@@ -166,7 +184,6 @@ static efi_status_t EFIAPI efi_disk_read_blocks(struct efi_block_io *this,
 			u32 media_id, u64 lba, efi_uintn_t buffer_size,
 			void *buffer)
 {
-	void *real_buffer = buffer;
 	efi_status_t r;

 	if (!this)
@@ -184,31 +201,12 @@ static efi_status_t EFIAPI efi_disk_read_blocks(struct efi_block_io *this,
 	    (this->media->last_block + 1) * this->media->block_size)
 		return EFI_INVALID_PARAMETER;

-#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
-	if (buffer_size > EFI_LOADER_BOUNCE_BUFFER_SIZE) {
-		r = efi_disk_read_blocks(this, media_id, lba,
-			EFI_LOADER_BOUNCE_BUFFER_SIZE, buffer);
-		if (r != EFI_SUCCESS)
-			return r;
-		return efi_disk_read_blocks(this, media_id, lba +
-			EFI_LOADER_BOUNCE_BUFFER_SIZE / this->media->block_size,
-			buffer_size - EFI_LOADER_BOUNCE_BUFFER_SIZE,
-			buffer + EFI_LOADER_BOUNCE_BUFFER_SIZE);
-	}
-
-	real_buffer = efi_bounce_buffer;
-#endif
-
 	EFI_ENTRY("%p, %x, %llx, %zx, %p", this, media_id, lba,
 		  buffer_size, buffer);

-	r = efi_disk_rw_blocks(this, media_id, lba, buffer_size, real_buffer,
+	r = efi_disk_rw_blocks(this, media_id, lba, buffer_size, buffer,
 			       EFI_DISK_READ);

-	/* Copy from bounce buffer to real buffer if necessary */
-	if ((r == EFI_SUCCESS) && (real_buffer != buffer))
-		memcpy(buffer, real_buffer, buffer_size);
-
 	return EFI_EXIT(r);
 }

@@ -232,7 +230,6 @@ static efi_status_t EFIAPI efi_disk_write_blocks(struct efi_block_io *this,
 			u32 media_id, u64 lba, efi_uintn_t buffer_size,
 			void *buffer)
 {
-	void *real_buffer = buffer;
 	efi_status_t r;

 	if (!this)
@@ -252,29 +249,10 @@ static efi_status_t EFIAPI efi_disk_write_blocks(struct efi_block_io *this,
 	    (this->media->last_block + 1) * this->media->block_size)
 		return EFI_INVALID_PARAMETER;

-#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
-	if (buffer_size > EFI_LOADER_BOUNCE_BUFFER_SIZE) {
-		r = efi_disk_write_blocks(this, media_id, lba,
-			EFI_LOADER_BOUNCE_BUFFER_SIZE, buffer);
-		if (r != EFI_SUCCESS)
-			return r;
-		return efi_disk_write_blocks(this, media_id, lba +
-			EFI_LOADER_BOUNCE_BUFFER_SIZE / this->media->block_size,
-			buffer_size - EFI_LOADER_BOUNCE_BUFFER_SIZE,
-			buffer + EFI_LOADER_BOUNCE_BUFFER_SIZE);
-	}
-
-	real_buffer = efi_bounce_buffer;
-#endif
-
 	EFI_ENTRY("%p, %x, %llx, %zx, %p", this, media_id, lba,
 		  buffer_size, buffer);

-	/* Populate bounce buffer if necessary */
-	if (real_buffer != buffer)
-		memcpy(real_buffer, buffer, buffer_size);
-
-	r = efi_disk_rw_blocks(this, media_id, lba, buffer_size, real_buffer,
+	r = efi_disk_rw_blocks(this, media_id, lba, buffer_size, buffer,
 			       EFI_DISK_WRITE);

 	return EFI_EXIT(r);
diff --git a/lib/efi_loader/efi_memory.c b/lib/efi_loader/efi_memory.c
index 6d00b1862505..d7a8cb89e5b5 100644
--- a/lib/efi_loader/efi_memory.c
+++ b/lib/efi_loader/efi_memory.c
@@ -40,10 +40,6 @@ struct efi_mem_list {
 /* This list contains all memory map items */
 static LIST_HEAD(efi_mem);

-#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
-void *efi_bounce_buffer;
-#endif
-
 /**
  * struct efi_pool_allocation - memory block allocated from pool
  *
@@ -852,18 +848,6 @@ int efi_memory_init(void)

 	add_u_boot_and_runtime();

-#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
-	/* Request a 32bit 64MB bounce buffer region */
-	uint64_t efi_bounce_buffer_addr = 0xffffffff;
-
-	if (efi_allocate_pages(EFI_ALLOCATE_MAX_ADDRESS, EFI_BOOT_SERVICES_DATA,
-			       (64 * 1024 * 1024) >> EFI_PAGE_SHIFT,
-			       &efi_bounce_buffer_addr) != EFI_SUCCESS)
-		return -1;
-
-	efi_bounce_buffer = (void*)(uintptr_t)efi_bounce_buffer_addr;
-#endif
-
 	return 0;
 }

--
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
