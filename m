Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FA57F7D7
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 15:08:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11B92C35E06
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:08:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABCBFC35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 13:08:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72D3QYY012599; Fri, 2 Aug 2019 15:07:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lk4z3VSeQQYrfdaU2sZivJA0yhcLehKOBThiL7Tl4E0=;
 b=qw3fV3HKb1q2EubwlBpch6/vtJDiHX9UycReNKg52GIXAaB4WVgsAi2xpicZXMCdNdtI
 BIvfyNN3mfHcIQBokc3stRUXsWk8YW19W9crFd/0vdA8c3Fc+egMMGPyCsA7Hv53Oz4a
 xqayLReUv2tKjyGjuchZrs4TLyHdC3RqSZBaedjQRvUqAcbxMX1VjaFEJnEhL8l+WwzI
 64lifjvRPnlveckxltwRZADJmqxirBs4j7+iUk+V1TPgbe/FIONq0nHKVSAV1bE206wS
 vRODmBFEldKrETzVnrlxKmsQrdrmzCq4A0BHHMAM1fcwlqngGbNjQ3mPI+CjsbeWfxJC 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0braga05-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 15:07:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F76242;
 Fri,  2 Aug 2019 13:07:48 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65C762C35C1;
 Fri,  2 Aug 2019 15:07:48 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 15:07:48 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 15:07:47
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 15:07:19 +0200
Message-ID: <1564751242-683-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
References: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, Shawn
 Guo <shawn.guo@linaro.org>, Simon Glass <sjg@chromium.org>,
 Tien Fong Chee <tien.fong.chee@intel.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Alex
 Kiernan <alex.kiernan@gmail.com>, Fabien Dessenne <fabien.dessenne@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Julius Werner <jwerner@chromium.org>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Chris Packham <judge.packham@gmail.com>, Stefano Babic <sbabic@denx.de>
Subject: [Uboot-stm32] [PATCH 2/5] image: add new "copro" image type
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

Define new image type for coprocessor images.
It is used in FIT to identify the files loaded
with remoteproc command (elf or bin).

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/image.c  | 1 +
 include/image.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/common/image.c b/common/image.c
index 4958831..f65c3e9 100644
--- a/common/image.c
+++ b/common/image.c
@@ -174,6 +174,7 @@ static const table_entry_t uimage_type[] = {
 	{       IH_TYPE_PMMC,        "pmmc",        "TI Power Management Micro-Controller Firmware",},
 	{	IH_TYPE_STM32IMAGE, "stm32image", "STMicroelectronics STM32 Image" },
 	{	IH_TYPE_MTKIMAGE,   "mtk_image",   "MediaTek BootROM loadable Image" },
+	{	IH_TYPE_COPRO, "copro", "Coprocessor Image"},
 	{	-1,		    "",		  "",			},
 };
 
diff --git a/include/image.h b/include/image.h
index 27d7cb9..64a694f 100644
--- a/include/image.h
+++ b/include/image.h
@@ -283,6 +283,7 @@ enum {
 	IH_TYPE_MTKIMAGE,		/* MediaTek BootROM loadable Image */
 	IH_TYPE_IMX8MIMAGE,		/* Freescale IMX8MBoot Image	*/
 	IH_TYPE_IMX8IMAGE,		/* Freescale IMX8Boot Image	*/
+	IH_TYPE_COPRO,			/* Coprocessor Image for remoteproc*/
 
 	IH_TYPE_COUNT,			/* Number of image types */
 };
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
