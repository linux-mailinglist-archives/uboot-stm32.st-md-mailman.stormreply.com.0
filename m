Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD000210B5E
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Jul 2020 14:56:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65E1EC36B23
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Jul 2020 12:56:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B280C36B22
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2020 12:56:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061CsocU018096; Wed, 1 Jul 2020 14:56:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=5M/YIE913Y81F2wAKSCOzhmFWI32bnToA7UHhW6NYt8=;
 b=fi4e57qJq69zXULwMI7V0MW+RjTV/heOIn/uAhJIEHk0BydkrzlU7ByXSMhXciJLuXto
 eiYYa0J9DurqhZP+qcDnADJEEN6spovzOpbOfqN35IU273Y5eMXsfU+wyxSqNOiWm4hc
 fHCL55hzpah3jujjWHeg7xJaGXbWDC8/DISF+qQI2J9To44c1gvbeV9RE4DFZ8d4pkXZ
 J6jqLXvFwtxrM8eVDJEOxC2F8czssin7A49zHKLR8Es73MjHGUQiPbrJcX3s97hfpF3/
 WlLj9V5pq/IYx/LRvRjN3Pw0qbUmne60gQmIHBsHvXnhAWMmYaXwVJ3mUcbAU4oQD4Qm Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0ga2c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 14:56:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 310CA100038;
 Wed,  1 Jul 2020 14:56:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA78D2B66D2;
 Wed,  1 Jul 2020 14:56:21 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 1 Jul 2020 14:56:21 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 1 Jul 2020 14:56:10 +0200
Message-ID: <20200701125610.22340-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_08:2020-07-01,
 2020-07-01 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Soeren Moch <smoch@web.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH] video: restore CONFIG_VIDCONSOLE_AS_LCD as
	boolean
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

This patch restores CONFIG_VIDCONSOLE_AS_LCD as boolean
and introduce a separate sting as CONFIG_VIDCONSOLE_AS_NAME
to search this string in stdout used as videoconsole.

This patch avoid issue with board defconfig or code expecting
CONFIG_VIDCONSOLE_AS_LCD as boolean.

Fixes: 22b897a12323 ("video: extend stdout video console work-around for 'vga'")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
Hi,

It is fix for stm32mp157c-ev1 boot on next branch.

The option names are not perfect but it is only a temporarily
work around (up to end of 2020).

You can see other example of boolean and string in Kconfig =
  config USE_BOOTCOMMAND
  config BOOTCOMMAND

I think the correct name could be:
- CONFIG_USE_VIDCONSOLE_AS_NAME
- CONFIG_VIDCONSOLE_AS_NAME

but these name need to modify many file for a fix on a workaround
CONFIG.

Regards,

Patrick


 common/console.c      |  6 +++---
 drivers/video/Kconfig | 12 +++++++++++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/common/console.c b/common/console.c
index f149624954..7b9816979a 100644
--- a/common/console.c
+++ b/common/console.c
@@ -713,7 +713,7 @@ struct stdio_dev *search_device(int flags, const char *name)
 
 	dev = stdio_get_by_name(name);
 #ifdef CONFIG_VIDCONSOLE_AS_LCD
-	if (!dev && !strcmp(name, CONFIG_VIDCONSOLE_AS_LCD))
+	if (!dev && !strcmp(name, CONFIG_VIDCONSOLE_AS_NAME))
 		dev = stdio_get_by_name("vidconsole");
 #endif
 
@@ -897,9 +897,9 @@ done:
 	stdio_print_current_devices();
 #endif /* CONFIG_SYS_CONSOLE_INFO_QUIET */
 #ifdef CONFIG_VIDCONSOLE_AS_LCD
-	if (strstr(stdoutname, CONFIG_VIDCONSOLE_AS_LCD))
+	if (strstr(stdoutname, CONFIG_VIDCONSOLE_AS_NAME))
 		printf("Warning: Please change '%s' to 'vidconsole' in stdout/stderr environment vars\n",
-		       CONFIG_VIDCONSOLE_AS_LCD);
+		       CONFIG_VIDCONSOLE_AS_NAME);
 #endif
 
 #ifdef CONFIG_SYS_CONSOLE_ENV_OVERWRITE
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 52f5bc6127..0cf13adc7d 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -177,8 +177,18 @@ config SIMPLE_PANEL
 source "drivers/video/fonts/Kconfig"
 
 config VIDCONSOLE_AS_LCD
-	string "Use 'vidconsole' when string defined here is seen in stdout"
+	bool "Use 'vidconsole' when CONFIG_VIDCONSOLE_AS_NAME string is seen in stdout"
 	depends on DM_VIDEO
+	help
+	  This is a work-around for boards which have 'lcd' or 'vga' in their
+	  stdout environment variable, but have moved to use driver model for
+	  video. In this case the console will no-longer work. While it is
+	  possible to update the environment, the breakage may be confusing for
+	  users. This option will be removed around the end of 2020.
+
+config VIDCONSOLE_AS_NAME
+	string "Use 'vidconsole' when string defined here is seen in stdout"
+	depends on VIDCONSOLE_AS_LCD
 	default "lcd" if LCD || TEGRA_COMMON
 	default "vga" if !LCD
 	help
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
