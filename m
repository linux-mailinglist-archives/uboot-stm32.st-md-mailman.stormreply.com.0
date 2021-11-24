Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C01345B7D2
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Nov 2021 10:52:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13440C597BB;
	Wed, 24 Nov 2021 09:52:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 459E9C597BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 09:52:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AO965Y6002333;
 Wed, 24 Nov 2021 10:52:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=oPRsDsT7uL8Edrvuqg0qKRjP+MawCZCQUCr38gm2hwM=;
 b=O3cV97t/adDyfVMG9VhdMw+LiB5qo3wCuo9KAkqtGW+/Gmgt/Rk3Aj8DBLtn2kEd7zOy
 nCLmOgFHN3AyRIx7lXkFEQGFyHN4AGJT2iqZfQ0/VpwxHRSnglVpBT+BMcGBMruaQvSc
 x+cFNulHjveoT6zVX3XRA255uuAIUz7MOgmds+pG1ZS0D7b2skz3VsAL6oylXlY0NzJ6
 QDpvU3SECHEbylllmcdGiXMk3HuXwkVvkfhk2sqNHLH+YYJhhok8aqS+ddIgTIyAwG92
 zTE3ZP4Df019OuN73jPljbXueivom63Ok4mkGhjI16Vm5FpjduNO01TXLUjEEK/X3x39 tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3chbneafxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 10:52:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D2C3C100038;
 Wed, 24 Nov 2021 10:52:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAE0B21E660;
 Wed, 24 Nov 2021 10:52:24 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 24 Nov 2021 10:52:24
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Nov 2021 10:52:19 +0100
Message-ID: <20211124105216.2.I9be593bea27d9cdb1d37cc5f8afc16d8e2e8a5be@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124105216.1.I2f1cd5fa86d23797b452eecde73e8b52ac0f878f@changeid>
References: <20211124105216.1.I2f1cd5fa86d23797b452eecde73e8b52ac0f878f@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_03,2021-11-23_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] ram: stm32mp1: remove __maybe_unused on
	stm32mp1_ddr_setup
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

Since the commit f42045b2e750 ("stm32mp15: replace CONFIG_TFABOOT when
it is possible") the function stm32mp1_ddr_setup is always called so the
__maybe_unused can be removed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/ram/stm32mp1/stm32mp1_ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
index c9335e59df..43702f3576 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ram.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
@@ -88,7 +88,7 @@ static ofnode stm32mp1_ddr_get_ofnode(struct udevice *dev)
 	return dev_ofnode(dev);
 }
 
-static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
+static int stm32mp1_ddr_setup(struct udevice *dev)
 {
 	struct ddr_info *priv = dev_get_priv(dev);
 	int ret;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
