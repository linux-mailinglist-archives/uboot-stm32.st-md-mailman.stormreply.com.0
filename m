Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6CD28BBF7
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 17:33:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49FF9C3FAD5;
	Mon, 12 Oct 2020 15:33:27 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC151C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 14:11:29 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id F1E41160060
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 16:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1602511889; bh=YFiPU4m3mhU2lUecWxlncAlYIU+bEZ9TURDijrs/DI4=;
 h=From:To:Cc:Subject:Date:From;
 b=ZNyM3txFlZcgc4lwRL18VV8TExepFLv3D/LPW6U+V1/eBasUB4JzZ44v0wmf7QdAh
 WfTztKIyba3pydTJUpKi9OfqoighyuRAs6w0oxUv7sPv3G4gxEKAcktJecBl/8DJq4
 XcJOqC0cp4Z9O00o2B9cdMFzxaHbDhzZxh10KMPDNxVohADhR/F4Mz9eARSJz4rGo9
 1zuomXJobv7nvkd/rdAADSDzl3WMFeeUJCcl0m3Vot5Ptd+G1hD7luSdAfeWWYALhK
 S+goVeRiAGDkM21in9V3g5NkV/iG47+CcL7RqRMOGYtRocivTmFRTHFDk4bblaZkP2
 vZ9BLLc/MaiMQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4C90wJ1ZmFz6tm9;
 Mon, 12 Oct 2020 16:11:28 +0200 (CEST)
From: Richard Genoud <richard.genoud@posteo.net>
To: Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Date: Mon, 12 Oct 2020 16:11:09 +0200
Message-Id: <20201012141109.29778-1-richard.genoud@posteo.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 Oct 2020 15:33:26 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Richard Genoud <richard.genoud@posteo.net>
Subject: [Uboot-stm32] [PATCH] SPL: stm32mp1: fix spl_mmc_boot_partition not
	defined
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

spl_mmc_boot_partition is only defined when
CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION is defined.

Signed-off-by: Richard Genoud <richard.genoud@posteo.net>
---
 arch/arm/mach-stm32mp/spl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index e84bdad7bfc..32a4a69282a 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -55,6 +55,7 @@ u32 spl_mmc_boot_mode(const u32 boot_device)
 	return MMCSD_MODE_RAW;
 }
 
+#ifdef CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
 int spl_mmc_boot_partition(const u32 boot_device)
 {
 	switch (boot_device) {
@@ -66,6 +67,7 @@ int spl_mmc_boot_partition(const u32 boot_device)
 		return -EINVAL;
 	}
 }
+#endif
 
 #ifdef CONFIG_SPL_DISPLAY_PRINT
 void spl_display_print(void)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
