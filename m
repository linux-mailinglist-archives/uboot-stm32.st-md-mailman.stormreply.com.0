Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEEFABF672
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 15:43:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20B7CC7A826;
	Wed, 21 May 2025 13:43:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90770C7A825
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 13:43:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LBo8mq013291;
 Wed, 21 May 2025 15:43:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 fdy34bXxJLwlYN2agnGl1y+F8EzLnrGc5IniTM45jO4=; b=Uhq2kimYukTYd/jm
 URZ90MQBxjutgWEpzV+rgqz8ONyxns86SsC2jxBiybZfcmdpufAAyTmb5gZ+qd6X
 w3lLTvUm+8nSJzEjrfy8DnkfITRyAj/EoPcUU/6GQvRX4jDkH1XHN8bxYbckT2j7
 hVPJviPjIyMuXHDArRwMmEYOPaNhPfxVSCoNxk7/V2OPa6jTbpfgOCFzHeKo0Fud
 rUJBkeVvUUOAiUXWtfx+kwjHhZd6jUPPoqgdl+XL9TFRmOx7EzWjCwrW5aJzm0Z7
 4zd5Q8r8FCMjD74s8jvfER99mq58vB7SXopD9+57vAdshdH+8J0ek+M9HHGnHZA0
 R9kcwg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwff4drn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 15:43:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 45F2240048;
 Wed, 21 May 2025 15:42:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38DD9B2CB63;
 Wed, 21 May 2025 15:41:30 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 15:41:29 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 May 2025 15:41:05 +0200
Message-ID: <20250521134117.2828335-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
References: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Alice Guo <alice.guo@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>,
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Ye Li <ye.li@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 01/13] clk: scmi: add compatibility with
	clock protocol 2.0
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

From: Valentin Caron <valentin.caron@foss.st.com>

Since clock protocol 2.0, SCMI specification add an option field
"clock_enable_delay" to CLOCK_ATTRIBUTES command.

scmi_read_resp_from_smt() will return an error ("Buffer too small") as
the message length coming from the SCMI server is not the same as expected.

So implement a condition to SCMI clock protocol version to change the
length of the expected message.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Sean Anderson <seanga2@gmail.com>
---

 drivers/clk/clk_scmi.c   | 54 +++++++++++++++++++++++++++++-----------
 include/scmi_protocols.h | 15 +++++++++++
 2 files changed, 54 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk_scmi.c b/drivers/clk/clk_scmi.c
index af69850cdd8..e323a948780 100644
--- a/drivers/clk/clk_scmi.c
+++ b/drivers/clk/clk_scmi.c
@@ -84,26 +84,47 @@ static int scmi_clk_get_num_clock(struct udevice *dev, size_t *num_clocks)
 static int scmi_clk_get_attibute(struct udevice *dev, int clkid, char **name,
 				 u32 *attr)
 {
+	struct scmi_clock_priv *priv = dev_get_priv(dev);
 	struct scmi_clk_attribute_in in = {
 		.clock_id = clkid,
 	};
-	struct scmi_clk_attribute_out out;
-	struct scmi_msg msg = {
-		.protocol_id = SCMI_PROTOCOL_ID_CLOCK,
-		.message_id = SCMI_CLOCK_ATTRIBUTES,
-		.in_msg = (u8 *)&in,
-		.in_msg_sz = sizeof(in),
-		.out_msg = (u8 *)&out,
-		.out_msg_sz = sizeof(out),
-	};
 	int ret;
 
-	ret = devm_scmi_process_msg(dev, &msg);
-	if (ret)
-		return ret;
-
-	*name = strdup(out.clock_name);
-	*attr = out.attributes;
+	if (priv->version >= 0x20000) {
+		struct scmi_clk_attribute_out_v2 out;
+		struct scmi_msg msg = {
+			.protocol_id = SCMI_PROTOCOL_ID_CLOCK,
+			.message_id = SCMI_CLOCK_ATTRIBUTES,
+			.in_msg = (u8 *)&in,
+			.in_msg_sz = sizeof(in),
+			.out_msg = (u8 *)&out,
+			.out_msg_sz = sizeof(out),
+		};
+
+		ret = devm_scmi_process_msg(dev, &msg);
+		if (ret)
+			return ret;
+
+		*name = strdup(out.clock_name);
+		*attr = out.attributes;
+	} else {
+		struct scmi_clk_attribute_out out;
+		struct scmi_msg msg = {
+			.protocol_id = SCMI_PROTOCOL_ID_CLOCK,
+			.message_id = SCMI_CLOCK_ATTRIBUTES,
+			.in_msg = (u8 *)&in,
+			.in_msg_sz = sizeof(in),
+			.out_msg = (u8 *)&out,
+			.out_msg_sz = sizeof(out),
+		};
+
+		ret = devm_scmi_process_msg(dev, &msg);
+		if (ret)
+			return ret;
+
+		*name = strdup(out.clock_name);
+		*attr = out.attributes;
+	}
 
 	return 0;
 }
@@ -257,6 +278,9 @@ static int scmi_clk_probe(struct udevice *dev)
 	if (!CONFIG_IS_ENABLED(CLK_CCF))
 		return 0;
 
+	ret = scmi_generic_protocol_version(dev, SCMI_PROTOCOL_ID_CLOCK,
+					    &priv->version);
+
 	/* register CCF children: CLK UCLASS, no probed again */
 	if (device_get_uclass_id(dev->parent) == UCLASS_CLK)
 		return 0;
diff --git a/include/scmi_protocols.h b/include/scmi_protocols.h
index 9046de7e3e7..762a1032c37 100644
--- a/include/scmi_protocols.h
+++ b/include/scmi_protocols.h
@@ -782,6 +782,21 @@ struct scmi_clk_attribute_out {
 	char clock_name[SCMI_CLOCK_NAME_LENGTH_MAX];
 };
 
+/**
+ * struct scmi_clk_get_nb_out_v2 - Response payload for SCMI_CLOCK_ATTRIBUTES command
+ * Clock management Protocol 2.0
+ * @status:	SCMI command status
+ * @attributes:	clock attributes
+ * @clock_name:	name of the clock
+ * @clock_enable_delay: delay incurred by the platform to enable the clock
+ */
+struct scmi_clk_attribute_out_v2 {
+	s32 status;
+	u32 attributes;
+	char clock_name[SCMI_CLOCK_NAME_LENGTH_MAX];
+	u32 clock_enable_delay;
+};
+
 /**
  * struct scmi_clk_state_in - Message payload for CLOCK_CONFIG_SET command
  * @clock_id:	SCMI clock ID
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
