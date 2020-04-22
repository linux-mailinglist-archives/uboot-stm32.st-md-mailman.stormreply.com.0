Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F242E1B4442
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:18:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA411C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:18:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B36CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:18:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCCNoE015755; Wed, 22 Apr 2020 14:18:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ZGfVUPql/poyrnd6ACHkxBFAe1EJvhvQe2pLutztGUo=;
 b=uYF3l0GF5LQmO/feVsPUow1j05PE+Gru9MjLwtjXIyh7RJ+7tK0Jv+RbFaGLBECOaRJk
 3SxaxOpblm1rGA+Zuozx1/09Jg4YzHj/+O9YWH7UQXC8hj13lisL+FETMZhSBmh0MN3o
 WW8LICrg6iAPf1RflDcNX8LiDO1t8DnhkiCkMhOGhwIIxO0yxfCMb0lhGR/XnetYo6sp
 nhhhLWqN26mKZATh5fI74SNZc5YMV0b1gVYVtH46avpGFZDA3L76PoPFs4WIw6nPOjxx
 KySjQOnd9/i/Qj0VJ15odvNIee4WgqFNp1WmZhHtGPYDmzhfMzgHMZy09LPBnxEuH2lL tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregp91t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:18:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 229BE10002A;
 Wed, 22 Apr 2020 14:18:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 150E82AE6AE;
 Wed, 22 Apr 2020 14:18:29 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:18:28 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:18:26 +0200
Message-ID: <20200422141755.2.I7e1980e0938cb60ddf2b7fea2778d9987291da99@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422141755.1.I8b005c35223011e3c07122ccbf558bf8d27b6aab@changeid>
References: <20200422141755.1.I8b005c35223011e3c07122ccbf558bf8d27b6aab@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>, Andre Przywara <andre.przywara@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: [Uboot-stm32] [PATCH 2/2] net: tftp: remove TFTP_MTU_BLOCKSIZE
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

Remove the unneeded define TFTP_MTU_BLOCKSIZE.
Since the KConfig migration done by commit b618b3707633 ("net:
Convert CONFIG_TFTP_BLOCKSIZE to Kconfig"), CONFIG_TFTP_BLOCKSIZE
is always defined and can be used directly to avoid confusion
(fallback to 1468 in code is never used).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 net/tftp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/net/tftp.c b/net/tftp.c
index 585eb6ef0c..be24e63075 100644
--- a/net/tftp.c
+++ b/net/tftp.c
@@ -133,14 +133,9 @@ static char tftp_filename[MAX_LEN];
  * almost-MTU block sizes.  At least try... fall back to 512 if need be.
  * (but those using CONFIG_IP_DEFRAG may want to set a larger block in cfg file)
  */
-#ifdef CONFIG_TFTP_BLOCKSIZE
-#define TFTP_MTU_BLOCKSIZE CONFIG_TFTP_BLOCKSIZE
-#else
-#define TFTP_MTU_BLOCKSIZE 1468
-#endif
 
 static unsigned short tftp_block_size = TFTP_BLOCK_SIZE;
-static unsigned short tftp_block_size_option = TFTP_MTU_BLOCKSIZE;
+static unsigned short tftp_block_size_option = CONFIG_TFTP_BLOCKSIZE;
 
 static inline int store_block(int block, uchar *src, unsigned int len)
 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
