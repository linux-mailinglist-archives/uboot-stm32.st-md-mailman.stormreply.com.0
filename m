Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D7323BF4
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 13:38:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18E4FC57B53;
	Wed, 24 Feb 2021 12:38:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D900C3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 12:38:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OCQc8e026328; Wed, 24 Feb 2021 13:38:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=fUuFxjrKx4WBvQTlENzxNOOH0AOraiCKm24lAJbMnt0=;
 b=wJfA1dhfBuiGqDYfTeacUFZojpgyZsY6ViSfdgF0qHZtg/CtmXUArE/eQSgpeZUxLO41
 YWruLU9YySezCc1lCtGJjJwwNLi5Eom6EXEEEne9aa/h/gYlrmRaIWxFmIipx9ELcqTZ
 y8jQncndpPlZ5SVT2QUudSoTUVL303SEe7vNrtXGhN+Wd3rhcElUtHoofivyZ9Cj64Th
 evaTApB9m07JdmV3z2Z0mSDYLPP2Ocmqs8nqdxaj/592LlM2mckksGy8l6wADmmDuKjx
 jwTtMrlUl9zOoKVuNQU1PVCfiBSKiNVIqBwqP7XniwOnZ228Fo6j5xpuIp9xv2bew+zH jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66ve3sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 13:38:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4294100034;
 Wed, 24 Feb 2021 13:38:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B92AF22B9A6;
 Wed, 24 Feb 2021 13:38:23 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 13:38:23
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 13:38:20 +0100
Message-ID: <20210224123821.22848-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224123821.22848-1-patrice.chotard@foss.st.com>
References: <20210224123821.22848-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_04:2021-02-24,
 2021-02-24 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>, Kamil Lulko <kamil.lulko@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/2] board: st: Remove board_early_init_f and
	board_late_init callbacks for stm32 boards
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

Remove board_early_init_f() and board_late_init() callbacks for stm32
boards as the corresponding flags (CONFIG_BOARD_LATE_INIT and
CONFIG_BOARD_EARLY_INIT_R) are now disabled.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/stm32f429-discovery/stm32f429-discovery.c   |  5 -----
 board/st/stm32f429-evaluation/stm32f429-evaluation.c |  5 -----
 board/st/stm32f469-discovery/stm32f469-discovery.c   |  5 -----
 board/st/stm32f746-disco/stm32f746-disco.c           |  5 -----
 board/st/stm32h743-disco/stm32h743-disco.c           | 10 ----------
 board/st/stm32h743-eval/stm32h743-eval.c             | 10 ----------
 6 files changed, 40 deletions(-)

diff --git a/board/st/stm32f429-discovery/stm32f429-discovery.c b/board/st/stm32f429-discovery/stm32f429-discovery.c
index 9d8fc9f5a2..46fcf907fc 100644
--- a/board/st/stm32f429-discovery/stm32f429-discovery.c
+++ b/board/st/stm32f429-discovery/stm32f429-discovery.c
@@ -51,11 +51,6 @@ u32 get_board_rev(void)
 	return 0;
 }
 
-int board_early_init_f(void)
-{
-	return 0;
-}
-
 int board_init(void)
 {
 	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
diff --git a/board/st/stm32f429-evaluation/stm32f429-evaluation.c b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
index 96b4c25726..3b6df1f3ab 100644
--- a/board/st/stm32f429-evaluation/stm32f429-evaluation.c
+++ b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
@@ -45,11 +45,6 @@ u32 get_board_rev(void)
 	return 0;
 }
 
-int board_early_init_f(void)
-{
-	return 0;
-}
-
 int board_init(void)
 {
 	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
diff --git a/board/st/stm32f469-discovery/stm32f469-discovery.c b/board/st/stm32f469-discovery/stm32f469-discovery.c
index 742fd67b98..c5df9b0d9c 100644
--- a/board/st/stm32f469-discovery/stm32f469-discovery.c
+++ b/board/st/stm32f469-discovery/stm32f469-discovery.c
@@ -45,11 +45,6 @@ u32 get_board_rev(void)
 	return 0;
 }
 
-int board_early_init_f(void)
-{
-	return 0;
-}
-
 int board_init(void)
 {
 	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
index 40450ca914..143cc6e1ea 100644
--- a/board/st/stm32f746-disco/stm32f746-disco.c
+++ b/board/st/stm32f746-disco/stm32f746-disco.c
@@ -48,11 +48,6 @@ int dram_init_banksize(void)
 	return fdtdec_setup_memory_banksize();
 }
 
-int board_early_init_f(void)
-{
-	return 0;
-}
-
 #ifdef CONFIG_SPL_BUILD
 #ifdef CONFIG_SPL_OS_BOOT
 int spl_start_uboot(void)
diff --git a/board/st/stm32h743-disco/stm32h743-disco.c b/board/st/stm32h743-disco/stm32h743-disco.c
index 405836aba3..4091d5f9fd 100644
--- a/board/st/stm32h743-disco/stm32h743-disco.c
+++ b/board/st/stm32h743-disco/stm32h743-disco.c
@@ -36,21 +36,11 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-int board_early_init_f(void)
-{
-	return 0;
-}
-
 u32 get_board_rev(void)
 {
 	return 0;
 }
 
-int board_late_init(void)
-{
-	return 0;
-}
-
 int board_init(void)
 {
 	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
diff --git a/board/st/stm32h743-eval/stm32h743-eval.c b/board/st/stm32h743-eval/stm32h743-eval.c
index 405836aba3..4091d5f9fd 100644
--- a/board/st/stm32h743-eval/stm32h743-eval.c
+++ b/board/st/stm32h743-eval/stm32h743-eval.c
@@ -36,21 +36,11 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-int board_early_init_f(void)
-{
-	return 0;
-}
-
 u32 get_board_rev(void)
 {
 	return 0;
 }
 
-int board_late_init(void)
-{
-	return 0;
-}
-
 int board_init(void)
 {
 	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
