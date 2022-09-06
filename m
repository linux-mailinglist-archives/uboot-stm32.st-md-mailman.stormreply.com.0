Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B55ADF9A
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 08:15:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14BD3C64102;
	Tue,  6 Sep 2022 06:15:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1C62C640FE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 06:15:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2864s6XQ014193;
 Tue, 6 Sep 2022 08:15:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=e9u9oHpD+186kIYTjYk+SaDnQ66sadssFDAM8EsQ6vg=;
 b=7PGoryf8TwQX0FT71wqnEVBjG/K+G5oKiAqIASezFw78SP0pyX04hWjn+FuM2yzMiuxF
 uTtkIK7Aj+HEjOGobYqgmwq+mhyLfPE+L0Mp12k1TshWxPZli7dq+1OIz1qV49nNc6a2
 MtqDAfBAUkG1/iLhz3YyHpHnGNK0K4E0jajGJqT5vJefFQcd5sZmV0B9nCRGQ4osFigY
 1Vhw99wVMLRuynVmzz9TYN7l3ysACUB/9sv47xeHJfcAqHuwxTWODbYWQQ1mjCZ1jwT+
 3Bp+2D2IFgoTsMHLMdu4nXhzOQ1liiWjnyXusn+Blgu1fh5pnSb6q8lMzW4QEmwNkiZ6 VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jdamg7073-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 08:15:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20FFA100039;
 Tue,  6 Sep 2022 08:15:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B0012132D3;
 Tue,  6 Sep 2022 08:15:33 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 6 Sep 2022
 08:15:32 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Sep 2022 08:15:26 +0200
Message-ID: <20220906061529.3788894-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
References: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_03,2022-09-05_03,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>, Alexander Dahl <ada@thorsis.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Angus Ainslie <angus@akkea.ca>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH v1 1/4] phy: Add generic_{setup,
	shutdown}_phy() helpers
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

In drivers usb/host/{ehci,ohci}-generic.c, {ehci,ohci}_setup_phy() and
{ehci,ohci}_shutdown_phy() shares 95% of common code.
Factorize this code in new generic_{setup,shudown}_phy() functions.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Simon Glass <sjg@chromium.org>
---

 drivers/phy/phy-uclass.c | 42 ++++++++++++++++++++++++++++++++++++++++
 include/generic-phy.h    | 30 ++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/phy/phy-uclass.c b/drivers/phy/phy-uclass.c
index 8b84da3ce0..3fef5135a9 100644
--- a/drivers/phy/phy-uclass.c
+++ b/drivers/phy/phy-uclass.c
@@ -455,6 +455,48 @@ int generic_phy_power_off_bulk(struct phy_bulk *bulk)
 	return ret;
 }
 
+int generic_setup_phy(struct udevice *dev, struct phy *phy, int index)
+{
+	int ret = 0;
+
+	if (!phy)
+		return 0;
+
+	ret = generic_phy_get_by_index(dev, index, phy);
+	if (ret) {
+		if (ret != -ENOENT)
+			return ret;
+	} else {
+		ret = generic_phy_init(phy);
+		if (ret)
+			return ret;
+
+		ret = generic_phy_power_on(phy);
+		if (ret)
+			ret = generic_phy_exit(phy);
+	}
+
+	return ret;
+}
+
+int generic_shutdown_phy(struct phy *phy)
+{
+	int ret = 0;
+
+	if (!phy)
+		return 0;
+
+	if (generic_phy_valid(phy)) {
+		ret = generic_phy_power_off(phy);
+		if (ret)
+			return ret;
+
+		ret = generic_phy_exit(phy);
+	}
+
+	return ret;
+}
+
 UCLASS_DRIVER(phy) = {
 	.id		= UCLASS_PHY,
 	.name		= "phy",
diff --git a/include/generic-phy.h b/include/generic-phy.h
index d40ce589b6..f8eddeff67 100644
--- a/include/generic-phy.h
+++ b/include/generic-phy.h
@@ -342,6 +342,26 @@ int generic_phy_power_on_bulk(struct phy_bulk *bulk);
  */
 int generic_phy_power_off_bulk(struct phy_bulk *bulk);
 
+/**
+ * generic_setup_phy() - Get, initialize and power on phy.
+ *
+ * @dev:	The consumer device.
+ * @phy:	A pointer to the PHY port
+ * @index:	The index in the list of available PHYs
+ *
+ * Return: 0 if OK, or negative error code.
+ */
+int generic_setup_phy(struct udevice *dev, struct phy *phy, int index);
+
+/**
+ * generic_shutdown_phy() - Power off and de-initialize phy.
+ *
+ * @phy:	A pointer to the PHY port.
+ *
+ * Return: 0 if OK, or negative error code.
+ */
+int generic_shutdown_phy(struct phy *phy);
+
 #else /* CONFIG_PHY */
 
 static inline int generic_phy_init(struct phy *phy)
@@ -407,6 +427,16 @@ static inline int generic_phy_power_off_bulk(struct phy_bulk *bulk)
 	return 0;
 }
 
+static inline int generic_setup_phy(struct udevice *dev, struct phy *phy, int index)
+{
+	return 0;
+}
+
+static inline int generic_shutdown_phy(struct phy *phy)
+{
+	return 0;
+}
+
 #endif /* CONFIG_PHY */
 
 /**
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
