Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1056F74A6
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 May 2023 21:52:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C968C6A5ED;
	Thu,  4 May 2023 19:52:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E6A4C69073
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 May 2023 19:52:20 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 78050857CF;
 Thu,  4 May 2023 21:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683229939;
 bh=271LocXAqsTmVTiJ79kn3+PDX4w7W+C/TAzoBo7SJvw=;
 h=From:To:Cc:Subject:Date:From;
 b=TBKONT3XbG1cxjp9XmiHTGfPP8oPtq5MBFlBEu1SVC1pdS8SX8XG8XWoZjNy1/ARt
 j3/dg+sX8RerOX5XvZGnEeemY6Y9e8gGvms+OYtYuwkd7626rny7GxLjm3ooV2US8Y
 xedwNCFFIaKh5xPHnnaEvgWsK9f+aHYXQOsTWwcOVbYUIrRsNwZtwyKCvXHlSThLsH
 5GaN3SCXnzUQ/3TI1f88JQMmZjrSP/6nOMIJOW9fUQHD8sSUniiICEdmYsdYR+12V3
 cMhns08l0enM9zN1YvtcBzlPtpU4tclpOcQtMJdk3jmwqW/7XLLYGP2pAEdPhcSd+C
 q6faP1n6UkBPQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Thu,  4 May 2023 21:52:08 +0200
Message-Id: <20230504195208.4941-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Use __section(".data") with dot
	in the section name on DHSOM
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

The correct specifier of the section is ".data" and not "data",
use the former to place the variables in ".data" section.

Fixes: 731fd50e27f ("ARM: stm32: Implement board coding on AV96")
Fixes: 92ca0f7446c ("ARM: dts: stm32: Synchronize DDR setttings on DH SoMs")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 board/dhelectronics/dh_stm32mp1/board.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index a9a2965a386..a0cdf83ea71 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -185,9 +185,9 @@ int checkboard(void)
 }
 
 #ifdef CONFIG_BOARD_EARLY_INIT_F
-static u8 brdcode __section("data");
-static u8 ddr3code __section("data");
-static u8 somcode __section("data");
+static u8 brdcode __section(".data");
+static u8 ddr3code __section(".data");
+static u8 somcode __section(".data");
 static u32 opp_voltage_mv __section(".data");
 
 static void board_get_coding_straps(void)
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
