Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E744B6FAD
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 16:23:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 542D2C5F1F2;
	Tue, 15 Feb 2022 15:23:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A321C23E53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 15:23:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FEUh09026018;
 Tue, 15 Feb 2022 16:23:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=GUoA0VsKHnmCzufT3J5OgItXOAsc0DtGyaV4AXg3O4s=;
 b=Tu1jjh/dEZfHfSrWeFxn7OquMsedNbfMKMT3KIaNby3cUoYW8NxFn2Ka9hZvD1nKftgq
 vvElqJzDQhjlsxcTfspUbPSFXh/FR+la+/Z0BYqTrwmtZkDlop4fxKKxo8WVOgW3zJmL
 cf/c0iSoLbceqv8vaIj0YRShSWnOHhfnuG0BYXGz+yowdeNn/gVESwIf+dVeat/Vnjn9
 DBGDLAqOFne6WLEl04JQIlyoqyDVnts6csHd0dqQaNg/ywVwOVD4pzZGlWf4r4wiVseM
 +BTvMPPLFb3Q9Vav+JZDbwHPRCtC5AxYz4RqKAuS+M0Lt+MHVNTLZNscqomie8hr9TWH 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e89b5j4vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:23:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B8C3100034;
 Tue, 15 Feb 2022 16:23:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10F1E22A6DF;
 Tue, 15 Feb 2022 16:23:31 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Feb 2022 16:23:30
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 15 Feb 2022 16:23:23 +0100
Message-ID: <20220215162301.2.I26fa615c6898db0d17024664b17b20412638bfd7@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215162301.1.I5f92544259c3d1dad2df30c9d7762ec7860f07cf@changeid>
References: <20220215162301.1.I5f92544259c3d1dad2df30c9d7762ec7860f07cf@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH 2/2] env: mmc : align erase address and size
	on erase_grp_size
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

On eMMC device, the erase_grp_size > 1 so the address and size for the
erase block command in env/mmc.c can be unaligned on erase group size and
some strange trace occurs and the result is not guarantee by MMC devices.

The SD-Card behavior doesn't change as erase_grp_size = 1 for SD-Card.

For example, on eMMC present on STM32MP15C-EV1 and before the patch:

  STM32MP> env erase

  Erasing Environment on MMC...

  Caution! Your devices Erase group is 0x400
  The erase range would be change to 0x2000~0x27ff

  16 blocks erased: OK

  Caution! Your devices Erase group is 0x400
  The erase range would be change to 0x2000~0x23ff

  16 blocks erased: OK
  OK

After this patch:
  STM32MP> env erase
  Erasing Environment on MMC...
  1024 blocks erased at 0x2000: OK
  1024 blocks erased at 0x2000: OK
  OK

Here the 2 copies of U-Boot environment are in the same devices Erase
group: it is erased twice.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/mmc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/env/mmc.c b/env/mmc.c
index 465b104559..0c498d9a46 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -257,12 +257,15 @@ static inline int erase_env(struct mmc *mmc, unsigned long size,
 {
 	uint blk_start, blk_cnt, n;
 	struct blk_desc *desc = mmc_get_blk_desc(mmc);
+	u32 erase_size;
 
-	blk_start	= ALIGN(offset, mmc->write_bl_len) / mmc->write_bl_len;
-	blk_cnt		= ALIGN(size, mmc->write_bl_len) / mmc->write_bl_len;
+	erase_size = mmc->erase_grp_size * desc->blksz;
+	blk_start = ALIGN_DOWN(offset, erase_size) / desc->blksz;
+	blk_cnt = ALIGN(size, erase_size) / desc->blksz;
 
 	n = blk_derase(desc, blk_start, blk_cnt);
-	printf("%d blocks erased: %s\n", n, (n == blk_cnt) ? "OK" : "ERROR");
+	printf("%d blocks erased at 0x%x: %s\n", n, blk_start,
+	       (n == blk_cnt) ? "OK" : "ERROR");
 
 	return (n == blk_cnt) ? 0 : 1;
 }
@@ -286,6 +289,7 @@ static int env_mmc_erase(void)
 		goto fini;
 	}
 
+	printf("\n");
 	ret = erase_env(mmc, CONFIG_ENV_SIZE, offset);
 
 #ifdef CONFIG_ENV_OFFSET_REDUND
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
