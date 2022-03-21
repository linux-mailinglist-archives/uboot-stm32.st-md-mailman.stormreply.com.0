Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D204E21C4
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Mar 2022 09:13:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E575C5EC6B;
	Mon, 21 Mar 2022 08:13:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BC12C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Mar 2022 08:13:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22L7iUeR009715;
 Mon, 21 Mar 2022 09:13:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=u/10yGFZGJlX/mXfNHZdPxArp55ZfbkqdUxXHUQlsbw=;
 b=TATN16wnU6r8ZHAhFxQmZYj2HE3hz07xjDVs0+ArWI2QNrrtVfJ0S8mWloW74znQNw2Y
 l1eFX+etNJbgxT5CMuqTlX0UYy3m4ILKnROt7ZEcSTmkgXLpxB4DjVce1AitH2zOxEpf
 mU2s+nc8fALo/NlFnUkoQfxjteZ6LGNFkt5Axe1ZZMrcwjbyjKdMtYPItnErcsHbLMoP
 HbbEoENUEOim3kaCK5QmBbaGK6ZmexG06jpzSJI4F2Jy+BMYZTGDUNz+jHjFiYbctJWY
 jyMPhsmfwm6wRXJaDJnzrNm7qXUaqQTlHwW9zOWPbVblPxtsy8li/CavF5SD9vr+ZIbK Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew5fp0gkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 09:13:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 497AE10002A;
 Mon, 21 Mar 2022 09:13:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29517212FC4;
 Mon, 21 Mar 2022 09:13:44 +0100 (CET)
Received: from localhost (10.75.127.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 21 Mar
 2022 09:13:43 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 21 Mar 2022 09:13:35 +0100
Message-ID: <20220321081337.28971-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
Cc: Wolfgang Denk <wd@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Farhan Ali <farhan.ali@broadcom.com>
Subject: [Uboot-stm32] [PATCH v1 0/2] mtd: Allow to parse DT partitions for
	raw nand
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


This series is fixing issue where "mtd list" command can't
displayed nand raw partitions even if the flash DT node is
populated with partitions subnode with "fixed-partitions" compatible.



Patrice Chotard (2):
  mtd: Add flash_node in struct mtd_info
  mtd: Update the way partitions are parsed

 drivers/mtd/mtdpart.c            | 8 ++++++--
 drivers/mtd/nand/raw/nand_base.c | 1 +
 include/linux/mtd/mtd.h          | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
