Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FB92CD24F
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Dec 2020 10:16:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06003C56635;
	Thu,  3 Dec 2020 09:16:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D11EBC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Dec 2020 09:16:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B397s9h006045; Thu, 3 Dec 2020 10:16:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=kyceuu4Jecyb9uHzY7Uf6FHqG9Rbneb6VfHXIg3S0ec=;
 b=FdHICHygFGq9hRxDt7nqHnK9FmAvlcn4I0kqp0M3WY5cZy9Bf5sKP5y30mvI5a81SNpv
 hg05x7hif51kiDGWUgHxtBgIXcbuxc+T6+UEQAXjRujWtd5ZnG9vy/Bzdan6joeWlqLE
 dc03txZBukHfb0miteN+dJl5+Xu6axtm8jH1ixISM5+sZVbHAwHp5y5EkqghWEgCKtIn
 tN+gnMS099SD6rN2877ZBlb0CQAMSvQP69L+NXUo0xqx1vsWfXBT6DK+X/PabxHHuygt
 0c+OrOpOK800pKRnsPoPBck6AMQfUBvP2Gstd3mji25XBMJoAreugu//JGjX2uNlfRwU Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3hfpmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:16:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 181DE10002A;
 Thu,  3 Dec 2020 10:16:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08836233FDA;
 Thu,  3 Dec 2020 10:16:12 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec 2020 10:16:11
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Dec 2020 10:15:49 +0100
Message-ID: <20201203101538.6.I6465bef9819233a1e02dcc0c8737d534275b85f6@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203091549.7031-1-patrick.delaunay@st.com>
References: <20201203091549.7031-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_06:2020-12-03,
 2020-12-03 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 6/6] video: remove VIDCONSOLE_AS_LCD and
	VIDCONSOLE_AS_NAME
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

Remove as planned (option will be removed around the end of 2020)
the workaround for boards which have 'lcd' or 'vga' in their stdout
environment variable.

These options are no more used in any defconfig and this patch simplify
the code in console.c file.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/console.c      | 10 ----------
 drivers/video/Kconfig | 22 ----------------------
 2 files changed, 32 deletions(-)

diff --git a/common/console.c b/common/console.c
index 3348436da6..dce28723d5 100644
--- a/common/console.c
+++ b/common/console.c
@@ -730,11 +730,6 @@ struct stdio_dev *search_device(int flags, const char *name)
 	struct stdio_dev *dev;
 
 	dev = stdio_get_by_name(name);
-#ifdef CONFIG_VIDCONSOLE_AS_LCD
-	if (!dev && !strcmp(name, CONFIG_VIDCONSOLE_AS_NAME))
-		dev = stdio_get_by_name("vidconsole");
-#endif
-
 	if (dev && (dev->flags & flags))
 		return dev;
 
@@ -914,11 +909,6 @@ done:
 #ifndef CONFIG_SYS_CONSOLE_INFO_QUIET
 	stdio_print_current_devices();
 #endif /* CONFIG_SYS_CONSOLE_INFO_QUIET */
-#ifdef CONFIG_VIDCONSOLE_AS_LCD
-	if (strstr(stdoutname, CONFIG_VIDCONSOLE_AS_NAME))
-		printf("Warning: Please change '%s' to 'vidconsole' in stdout/stderr environment vars\n",
-		       CONFIG_VIDCONSOLE_AS_NAME);
-#endif
 
 #ifdef CONFIG_SYS_CONSOLE_ENV_OVERWRITE
 	/* set the environment variables (will overwrite previous env settings) */
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 998271b9b6..e4bf04a561 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -207,28 +207,6 @@ config SIMPLE_PANEL
 
 source "drivers/video/fonts/Kconfig"
 
-config VIDCONSOLE_AS_LCD
-	bool "Use 'vidconsole' when CONFIG_VIDCONSOLE_AS_NAME string is seen in stdout"
-	depends on DM_VIDEO
-	help
-	  This is a work-around for boards which have 'lcd' or 'vga' in their
-	  stdout environment variable, but have moved to use driver model for
-	  video. In this case the console will no-longer work. While it is
-	  possible to update the environment, the breakage may be confusing for
-	  users. This option will be removed around the end of 2020.
-
-config VIDCONSOLE_AS_NAME
-	string "Use 'vidconsole' when string defined here is seen in stdout"
-	depends on VIDCONSOLE_AS_LCD
-	default "lcd" if LCD || TEGRA_COMMON
-	default "vga" if !LCD
-	help
-	  This is a work-around for boards which have 'lcd' or 'vga' in their
-	  stdout environment variable, but have moved to use driver model for
-	  video. In this case the console will no-longer work. While it is
-	  possible to update the environment, the breakage may be confusing for
-	  users. This option will be removed around the end of 2020.
-
 config VIDEO_COREBOOT
 	bool "Enable coreboot framebuffer driver support"
 	depends on X86 && SYS_COREBOOT
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
