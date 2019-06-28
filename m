Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4959C70
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 15:03:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD7E4C20B47
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 13:03:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80422C20B44
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 13:03:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SD3ePi020614; Fri, 28 Jun 2019 15:03:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0lc9zsH1LS1BQ3BRWvPfOe1xsMwU3KpGzLLpymJ4pNQ=;
 b=lmsN89EhBGfhpd64WUPtQNdAtwL3ML7739Cat79thVT9hS6gwNgJhj52mm2u1srAJeer
 otBJlaDSsdplfMM4p0E5t6ZK7TVKxjsoS6DyzFA+K2m2lxxiSIfoa3+c5HWXtVjoJHil
 FnBofF64VLZItRjcn4eltWr6BnRgCrugVULHTb/Dd7emctF6jRW3foloeebpv8jAK5QK
 0s35x7HbDaySrpXH+zsfGBGuo+X+cbeABrD1MPxzW3Wi8WnpA6iI5baQ9cSdMui3tIzk
 ThARqZDPxQJiFEJpqgPeELqCWF6SgaJevYwCMqUlYCreymiGEZy3ZJsP1Q69Eifx5SB3 YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2x5v6c-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Jun 2019 15:03:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4CDFB31;
 Fri, 28 Jun 2019 13:03:18 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 363242937;
 Fri, 28 Jun 2019 13:03:18 +0000 (GMT)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Jun 2019 15:03:17 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Jun 2019 15:03:00 +0200
Message-ID: <20190628130301.18094-4-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130301.18094-1-patrice.chotard@st.com>
References: <20190628130301.18094-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 3/4] spi: stm32_qspi: Remove "st,
	stm32-qspi" compatible string
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

"st,stm32-qspi" is no more used, remove it.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/spi/stm32_qspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index bb1067ff4a..c5878e4058 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -524,7 +524,6 @@ static const struct dm_spi_ops stm32_qspi_ops = {
 };
 
 static const struct udevice_id stm32_qspi_ids[] = {
-	{ .compatible = "st,stm32-qspi" },
 	{ .compatible = "st,stm32f469-qspi" },
 	{ }
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
