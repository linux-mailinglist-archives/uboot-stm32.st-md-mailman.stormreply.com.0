Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF3523039B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:13:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E6EBC36B29
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 07:13:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 795EFC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 07:13:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S7DcGW005227; Tue, 28 Jul 2020 09:13:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4Wfr2RmifHv0U85nmrMX86XmkPDv345kg96uJ7IlKfE=;
 b=YcTquRsc/EdtFLC43qrra5bC0jXUMsvTtijdhBkqPkUyI6vaxqBGG69cHJwwVSvlsvZ3
 Lbb0ZpqPb1r2xP8nkU8eLMwewRlHCvaiNf63B36FZP/MmHSMN7Iojsp/enqNAAdHCo5I
 yURFEnnM9wQOdTXAN8q7XggNPRS/LLeEBlkT3m0eUScCL9yVm68D9biEbl83ev36nJys
 7AMv84ikfv6CEhhwbssJMaDEb4q+BK67VWnBMV1ftTB88MWyxjlPma8N6eOHFL+im90x
 Qqb84czOGZp2IdhfJDIOF3nGgEFWm0qAXDYrw3gsCsJzHuDQknsQG61fTbH7PIoy9vWv rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv4trn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:13:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD2E210002A;
 Tue, 28 Jul 2020 09:13:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF92A21E690;
 Tue, 28 Jul 2020 09:13:41 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 09:13:41 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 09:13:32 +0200
Message-ID: <20200728071335.5840-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728071335.5840-1-patrice.chotard@st.com>
References: <20200728071335.5840-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-27,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v5 2/5] sandbox: phy: add driver_data for bind
	test cmd
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

Add driver data to existing compatible string "sandbox,phy".
Add an additional compatible string without driver_data

This will verify that bind command parses, finds and passes the
correct driver data to device_bind_with_driver_data() by using
driver_data in the second sandbox_phy_ids table entry.
In sandbox_phy_bind() a check is added to validate driver_data
content.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 drivers/phy/sandbox-phy.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/sandbox-phy.c b/drivers/phy/sandbox-phy.c
index 84ff5c6275..5f36da7692 100644
--- a/drivers/phy/sandbox-phy.c
+++ b/drivers/phy/sandbox-phy.c
@@ -8,6 +8,8 @@
 #include <dm.h>
 #include <generic-phy.h>
 
+#define DRIVER_DATA 0x12345678
+
 struct sandbox_phy_priv {
 	bool initialized;
 	bool on;
@@ -71,6 +73,14 @@ static int sandbox_phy_exit(struct phy *phy)
 	return 0;
 }
 
+static int sandbox_phy_bind(struct udevice *dev)
+{
+	if (dev_get_driver_data(dev) != DRIVER_DATA)
+		return -ENODATA;
+
+	return 0;
+}
+
 static int sandbox_phy_probe(struct udevice *dev)
 {
 	struct sandbox_phy_priv *priv = dev_get_priv(dev);
@@ -90,13 +100,19 @@ static struct phy_ops sandbox_phy_ops = {
 };
 
 static const struct udevice_id sandbox_phy_ids[] = {
-	{ .compatible = "sandbox,phy" },
+	{ .compatible = "sandbox,phy_no_driver_data",
+	},
+
+	{ .compatible = "sandbox,phy",
+	  .data = DRIVER_DATA
+	},
 	{ }
 };
 
 U_BOOT_DRIVER(phy_sandbox) = {
 	.name		= "phy_sandbox",
 	.id		= UCLASS_PHY,
+	.bind		= sandbox_phy_bind,
 	.of_match	= sandbox_phy_ids,
 	.ops		= &sandbox_phy_ops,
 	.probe		= sandbox_phy_probe,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
