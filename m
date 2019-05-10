Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0E11A174
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:28:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F42ACA8E7E
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:28:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4083ECA8E7C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:28:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6Usd020376; Fri, 10 May 2019 18:20:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4hFZ5bmECakd1JNX6M63RvaZEjdcpoLvxt8ZJOFyGME=;
 b=kbi8uKs7P4a2S4UYxnjmMSToA0eU9W2eYMzn9FGHoouqhguKqIT844w+7GE5y3M96Gjx
 hbrctWM61APHiFE5yfrq1TH9tgYWxm3MH5dFsD88+IIySW92YFhnfME47JJlwOPL9QRD
 R3hgCULVa3ODhg42AVDmVwR4DCRGk10Wgqg+oKVnZc99bNBmkdTPL6KlRI4nX3RcFHIj
 4tD2M0pQQ5HiuMB2/wJ3Q9QJ3O9d55zbCqMMpI2r7qhmv7bZLHSzmBxWLIJ1rewq9y4c
 +DHkNH1V3DbZhJYqPX8De0PXoLPfQls/LkBk/8wmlYHzWkA2rHpxwJC2IBF+HSnvMKP1 kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2sr34-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:20:21 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DF4134;
 Fri, 10 May 2019 16:20:20 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3FDE32C15;
 Fri, 10 May 2019 16:20:20 +0000 (GMT)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:20:19 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:19:10 +0200
Message-ID: <1557505154-3856-10-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
References: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Adam Ford <aford173@gmail.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Jagan Teki <jagan@openedev.com>
Subject: [Uboot-stm32] [PATCH 09/13] mtd: Fix get_mtdparts()
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

When ENV_IS_IN_UBI is enable, get_mtdparts is called before relocation.

During first get_mtdparts() call, mtdparts is not available in environment,
it can be retrieved by calling board_mtdparts_default(), but following
env_set() do nothing as we are before relocation. Finally mtdparts is
still not available in environment.

At second get_mtdparts() call, use_defaults is false, but mtdparts is still
not in environment and is NULL.

Remove use_defaults bool, only mtdparts criteria is useful.

Fixes: commit 5ffcd50612f6 ("mtd: Use default mtdparts/mtids when not defined
in the environment")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/mtd/mtd_uboot.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/mtd_uboot.c b/drivers/mtd/mtd_uboot.c
index d638f70..0a41ed4 100644
--- a/drivers/mtd/mtd_uboot.c
+++ b/drivers/mtd/mtd_uboot.c
@@ -122,7 +122,6 @@ static const char *get_mtdparts(void)
 {
 	__maybe_unused const char *mtdids = NULL;
 	static char tmp_parts[MTDPARTS_MAXLEN];
-	static bool use_defaults = true;
 	const char *mtdparts = NULL;
 
 	if (gd->flags & GD_FLG_ENV_READY)
@@ -130,7 +129,7 @@ static const char *get_mtdparts(void)
 	else if (env_get_f("mtdparts", tmp_parts, sizeof(tmp_parts)) != -1)
 		mtdparts = tmp_parts;
 
-	if (mtdparts || !use_defaults)
+	if (mtdparts)
 		return mtdparts;
 
 #if defined(CONFIG_SYS_MTDPARTS_RUNTIME)
@@ -144,8 +143,6 @@ static const char *get_mtdparts(void)
 	if (mtdparts)
 		env_set("mtdparts", mtdparts);
 
-	use_defaults = false;
-
 	return mtdparts;
 }
 
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
