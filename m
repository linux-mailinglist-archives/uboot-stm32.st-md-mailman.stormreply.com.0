Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C8354D6E
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Apr 2021 09:10:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB8A7C57B6B;
	Tue,  6 Apr 2021 07:10:10 +0000 (UTC)
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DBE2C5719D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Apr 2021 18:21:57 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.148.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id T7NiljuYb3IXUT7NkloHC3; Sun, 04 Apr 2021 20:21:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617560517; bh=d/DW1mjBqlrI2UH7KzkVVClt5I4os5c06hZGjrDd1/k=;
 h=From:To:Subject:Date:MIME-Version;
 b=e6JW9yqlrS9xD3nR25W5ZwnGS3uPc4MeBtMMPN0Q2XO1qa4G5SETLHjUfHL/xXNH1
 BopX/j1ihsSrGhQLsr3VT+/QA9R2hMeuulwirH/YznEBakxMWhnSEIau7UfonTeML1
 dcjTGUz8IbMs43Lzp/40FrjOM4xnfRem8evwe8YWTHBSEjd9Ft7E1Uo6gskjGRnldm
 ootpq8IVHQBRMQZpkBw7/WUncVdp+fpgWGHA/KFTRBvU0HYjOpHNY7ZZcmP2AOUk6D
 lVuTiQNuROYFboQJc6Yss6Nm5tECPs48uxm8U6fV0NbkDbShv3b8RESWYzJnYU2jxa
 KX946uNZ7rVEw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Stefano Babic <sbabic@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Sun,  4 Apr 2021 20:21:35 +0200
Message-Id: <20210404182135.1243077-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210404182135.1243077-1-giulio.benetti@benettiengineering.com>
References: <20210404182135.1243077-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHVjqL4z60dxWLpMtRZuHDOV7aVQOK95Qnj8rYsPvsscJyLsXPGZT5HYi68vpnWtaJ6VSu6ElrISNMMAuc00qzR5kBlyWsqML/hXCkztUtt8SYDvlCan
 te1OIuz7zTLsYiCLvDa9mUdiMIPfIsx6ppDjprVR1h9XIznVypod7A3YoxQFmVORDBlMMUs9TdtCHriVJGgzMfRGnMmsYzW2ckE43K4Y+4CYgSVDOl5n9XD1
 +maUkgYCgOisGGhWeN+1jbwEVIJ73amjBOg7YHwe3gHMTzmMWOMR5blNjQ5XbfoUwpNe4nW5dyUcz7e01rGEjAmzSBeZ9Xof6BLoJUU0ILDBYOVz0m1jhorF
 4pVxAS6927P6uHsTOTWDTOvdXJ/aWUyvuRmMfliYWlng3bVHSp7VgE6IFgCq+YBpdG9XRwZcGxuyH1Tids4IGdGfWH9X+nUTJe2GYjEQOi/OKNwXjZ8c/4Sp
 hBVc9M4NHqCaHC2guPT+VLWy8+wIr9Lu6wRGyA==
X-Mailman-Approved-At: Tue, 06 Apr 2021 07:10:08 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>
Subject: [Uboot-stm32] [PATCH 3/3] board: st: stm32f746-disco: fix console
	is not enabled while init dram
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

While initializing dram in spl_dram_init(), mdelay() is called that in
order calls get_ticks() that  verifies if timer exists, if doesn't, it
throws a panic(), but since preloader_console_init() has still not been
called those panic()s will fail. This doesn't help debugging, so let's
setup console before calling spl_dram_init() by moving it after
spl_dram_init().

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/st/stm32f746-disco/stm32f746-disco.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
index 143cc6e1ea..efa38a0e26 100644
--- a/board/st/stm32f746-disco/stm32f746-disco.c
+++ b/board/st/stm32f746-disco/stm32f746-disco.c
@@ -69,8 +69,8 @@ int spl_dram_init(void)
 }
 void spl_board_init(void)
 {
-	spl_dram_init();
 	preloader_console_init();
+	spl_dram_init();
 	arch_cpu_init(); /* to configure mpu for sdram rw permissions */
 }
 u32 spl_boot_device(void)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
