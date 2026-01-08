Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65457D07CF4
	for <lists+uboot-stm32@lfdr.de>; Fri, 09 Jan 2026 09:28:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B723C8F286;
	Fri,  9 Jan 2026 08:28:24 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CCD8C8F283
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 02:16:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F354D10B030; Thu,  8 Jan 2026 03:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1767838608; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=M4R1rt4JJ0VTT2QVkLIgEj32qluymtWkoZYOJKHSwYM=;
 b=T+FHzWwEz1bX1gvj8dhtoh9auZzh8bnS2QVJcwdusL5kCo3Gpp5m+SQDgJOy0h/Bi+VMZh
 LzIAuvcKnf1Tzm9ZXkasUlvAve3rtUmjm6s8LLwVsxsoibSrB03TYSfaypog9cr94E0Ow/
 6YwyyQ7U0B9gWSg1FjRQx+2bafS6d6xCXOojUeQtEg23B4YKpRk0igbPd0plprjVDQchoZ
 XtwG2wl7SqRZpQXqSDMlPy7fWaFRXtBDbuQM/NkRAcHYDOcZzl0+ZKT/TLwARR/Cvtbmad
 qpmygU6T9C6SGkTYqsnZp3uEgCGrpGucrtSnpDXwZj0dJmhL/idrOfyMPP8EEg==
From: Marek Vasut <marex@nabladev.com>
To: u-boot@lists.denx.de
Date: Thu,  8 Jan 2026 03:16:28 +0100
Message-ID: <20260108021645.518220-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Fri, 09 Jan 2026 08:28:23 +0000
Cc: Marek Vasut <marex@nabladev.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>, u-boot@dh-electronics.com,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Use CONFIG_STM32MP15X to discern
	STM32MP15xx on DH STM32MP15xx DHSOM
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

Use plain CONFIG_STM32MP15X to discern code which is specific to
STM32MP15xx in DH STM32MP1 DHSOM board files.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 board/dhelectronics/dh_stm32mp1/board.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 55526189d5a..90590d14941 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -314,7 +314,7 @@ int board_stm32mp1_ddr_config_name_match(struct udevice *dev,
 			return 0;
 	}
 
-	if (IS_ENABLED(CONFIG_TARGET_DH_STM32MP15X)) {
+	if (IS_ENABLED(CONFIG_STM32MP15X)) {
 		if (ddr3code == 1 &&
 		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x1gb-533mhz"))
 			return 0;
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
