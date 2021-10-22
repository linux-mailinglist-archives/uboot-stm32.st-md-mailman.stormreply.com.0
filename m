Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D46AA437996
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Oct 2021 17:05:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60FA1C5C857;
	Fri, 22 Oct 2021 15:05:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28162C5C831
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 15:05:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M9Kjid026676; 
 Fri, 22 Oct 2021 17:05:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=RNrUbclGCH+6kxC6MoI9q4msl9vTkUDDm7k6OxN0upE=;
 b=XK4r7NBYBIdFLo/1LohMd11gomBzQev4+50ZY5m5teD4cCqAwVasLVyLmz9m3+Xsfx1S
 a6im9Ci1n9q6F+pJ8/Jd4jXLzkFMUTcFVfXDiWIhDfdDnmLYD/ZqMbfX7r/HlUsjpZmG
 p4MNuakVXrHgIDB53SoTSB+U/n1myLEchKLybgJyp+gQizE7RqsEcA7ZlLbY359ZbkOz
 waX9tifUmSmSyJOo6e7R4BY3xGSw10txGNILR341bObI9q0vy2SLL49dMZy31e/70UL6
 zs/IyyRE4K7wgnmUad3rNT9nF1O6gV5rvmKIYNk7uRZA7QVUDDKhYfK0L21eTaeZNF99 ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3butka1y35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 17:05:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D1A510002A;
 Fri, 22 Oct 2021 17:05:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0562922F7BA;
 Fri, 22 Oct 2021 17:05:51 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 17:05:50
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 22 Oct 2021 17:05:47 +0200
Message-ID: <20211022170544.1.Ib218a8a747f99cab44c3fac6af649f17f003b2e2@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_04,2021-10-22_01,2020-04-07_01
Cc: Matthias Brugger <mbrugger@suse.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Torsten Duwe <duwe@suse.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] lib: uuid: fix the test on RNG device presence
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

Correct the test on RNG device presence,when ret is equal to 0,
before to call dm_rng_read function.

Without this patch the RNG device is not used when present (when ret == 0)
or a data abort occurs in dm_rng_read when CONFIG_DM_RNG is activated but
the RNG device is not present in device tree (ret != 0 and devp = NULL).

Fixes: 92fdad28cfdf ("lib: uuid: use RNG device if present")
CC: Matthias Brugger <mbrugger@suse.com>
CC: Torsten Duwe <duwe@suse.de>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 lib/uuid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/uuid.c b/lib/uuid.c
index 67267c66a3..e4703dce2b 100644
--- a/lib/uuid.c
+++ b/lib/uuid.c
@@ -257,7 +257,7 @@ void gen_rand_uuid(unsigned char *uuid_bin)
 
 	if (IS_ENABLED(CONFIG_DM_RNG)) {
 		ret = uclass_get_device(UCLASS_RNG, 0, &devp);
-		if (ret) {
+		if (!ret) {
 			ret = dm_rng_read(devp, &randv, sizeof(randv));
 			if (ret < 0)
 				randv = 0;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
