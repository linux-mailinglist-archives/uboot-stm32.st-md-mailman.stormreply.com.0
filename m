Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 783AC1B55EB
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Apr 2020 09:39:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EB52C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Apr 2020 07:39:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAE17C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 07:39:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03N7WTiv023685; Thu, 23 Apr 2020 09:39:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=mvmCoWZ7NFFYCDhBk+DAmZ9wrj7mnTLx0FxxGdscJKk=;
 b=v6flCS6usSABlIMNVTSoQ8G2Q8gfxpiljDtHH8W0QZtFY0mrA+6BylhrXhL1X5+BdFhH
 HwC0xRhoE8gJaauDmtUtmQvh7NorPMGco6QPAeu+4X7WSyJds4Tv2XxcD7uQEC6K/imB
 E7jHShNRwQE2D+2JI9JPPtSOMrzsq/NMMNlQRv+AEa5e/wfM0pDkUxaRvm0yf3pYs8OK
 H8pZ6Bfq3PvwF+v5Q2vQCpR4yvt/DD7Y2JF6W0QDuaSkbxexXpZuO6PiZ5Sa3aXOiTNW
 cn6TJm4z5nv+Tr3RN8TAygYlCAoas9QXJVUyPZm0mg4J5DSKSP1TovEWpIMUXwFGmPkJ uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp93k5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 09:39:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4239710002A;
 Thu, 23 Apr 2020 09:39:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC6FB2AA296;
 Thu, 23 Apr 2020 09:39:10 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 23 Apr 2020 09:39:10 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 23 Apr 2020 09:39:08 +0200
Message-ID: <20200423093845.1.Idf086bdb530238139f0066b3fecc01529d7c0b7d@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_06:2020-04-22,
 2020-04-23 signatures=0
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Fabio Estevam <festevam@gmail.com>
Subject: [Uboot-stm32] [PATCH] Makefile: copy SPL_FIT_SOURCE in build
	directory
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

Copy the .its source file selected by CONFIG_SPL_FIT_SOURCE
in builddir and in a file named "u-boot.its".

This patch avoid compilation issue when CONFIG_SPL_FIT_SOURCE is used
and KBUILD_OUTPUT is defined, in buildman for example.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
Hi,

Problem detected with path proposal:

[V3,3/6] ARM: stm32: Implement board coding on AV96

http://patchwork.ozlabs.org/project/uboot/patch/20200422111814.121060-3-marex@denx.de/

Issue see with:

tools/buildman/buildman -v -V stm32mp15_dhcom_basic stm32mp15_dhcor_basic

Building current source for 2 boards (2 threads, 6 jobs per thread)
       arm:  +   stm32mp15_dhcor_basic
+FATAL ERROR: Couldn't open "board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its": No such file or directory
+./tools/mkimage: Can't open u-boot.itb.tmp: No such file or directory
+make[2]: *** [spl/u-boot-spl] Error 1
+make[1]: *** [spl/u-boot-spl] Error 2
+make: *** [sub-make] Error 2
       arm:  +   stm32mp15_dhcom_basic
+FATAL ERROR: Couldn't open "board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its": No such file or directory
+./tools/mkimage: Can't open u-boot.itb.tmp: No such file or directory
+make[2]: *** [spl/u-boot-spl] Error 1
+make[1]: *** [spl/u-boot-spl] Error 2
+make: *** [sub-make] Error 2
    0    0    2 /2      stm32mp15_dhcom_basic

This error doesn't occur for a local compilation,
as the 2 files exist in  source directory:
"board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its"
"board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its"

But they can't found by buildman in build directory
and the issue is reproduced with "KBUILD_OUTPUT=../build".

With the proposed path the issue is solved.

Regards

Patrick


 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 26307fd4a6..d574f8a181 100644
--- a/Makefile
+++ b/Makefile
@@ -1320,7 +1320,9 @@ endif
 # Boards with more complex image requirements can provide an .its source file
 # or a generator script
 ifneq ($(CONFIG_SPL_FIT_SOURCE),"")
-U_BOOT_ITS = $(subst ",,$(CONFIG_SPL_FIT_SOURCE))
+U_BOOT_ITS := u-boot.its
+$(U_BOOT_ITS): $(subst ",,$(CONFIG_SPL_FIT_SOURCE))
+	$(call if_changed,copy)
 else
 ifneq ($(CONFIG_SPL_FIT_GENERATOR),"")
 U_BOOT_ITS := u-boot.its
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
