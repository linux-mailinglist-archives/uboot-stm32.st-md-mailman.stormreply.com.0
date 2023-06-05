Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B39972201C
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Jun 2023 09:52:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5273C6A5E7;
	Mon,  5 Jun 2023 07:52:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9707BC03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jun 2023 07:52:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3556CjAt032214; Mon, 5 Jun 2023 09:52:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=5UhPm4f9LR/lFhquWBbAu7IjVDZztIeOIT1Ca2Vwry8=;
 b=Iua2Nrbnx+wODM+M3JwROJ0NL5CEyIhrxdzG4peN3nA5HVtJAJbeBFfMPBMSewj8UQmg
 M/cuSgiwofy+Yh4hHejgdL04j3Dlomc7yPxI7Wem/Mcu+c/YCgk7S+8F/I+QPp1lzaoI
 auNtb6KxSbR3wMAfz/FpIZA0NXO3DFUTPxb9CjkcY0Kxs+4ieQBcfXIzWsHizf8dG9Nt
 1I9aDvyuTMs4FBrFlW942PS4dUlKUQ/yvgyOvR2KzCPWcZXWxhZEY2+CI135a1miX7os
 m5kVrka5g6D3Qkxg9xIp5OZtTDU4SrzOw7r9/1WDDnXM8iCY/epwMpQbLCI2s7S3Cphu Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r1a850kap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jun 2023 09:52:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6377F100034;
 Mon,  5 Jun 2023 09:52:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C35F20BA10;
 Mon,  5 Jun 2023 09:52:10 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 5 Jun
 2023 09:52:10 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 5 Jun 2023 09:52:06 +0200
Message-ID: <20230605075208.55221-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
Cc: Christophe KERELLO <christophe.kerello@foss.st.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 0/2] dfu: mtd: mark bad the MTD block on
	erase error
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


V3 for http://patchwork.ozlabs.org/project/uboot/list/?series=357878
after remarks and missing impact after comts
d9fa61f54e7f9a ("mtd: nand: Show reserved block in chip.erase")
and
cfb82f7c123e4 ("mtd: nand: Mark reserved blocks")

Patrick

Changes in v3:
- Split serie with trace fix and support of bad block in MTD erase
- Fix trace for "bbt reserved" when mtd_block_isbad return 2

Changes in v2:
- fix mtd_block_isbad offset parameter for erase check
- Add trace when bad block are skipped in erase loop
- Add remaining byte in trace "Limit reached"

Patrick Delaunay (2):
  dfu: mtd: fix the trace when limit is reached
  dfu: mtd: mark bad the MTD block on erase error

 drivers/dfu/dfu_mtd.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
