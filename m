Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E09638948
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Nov 2022 12:56:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A0C0C65E4B;
	Fri, 25 Nov 2022 11:56:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00896C65E43
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Nov 2022 11:56:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AP8DuEI029091; Fri, 25 Nov 2022 12:56:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=aCMPHCOCl0iEzG/TR/5z7dNpUYj1q2Z0uTbVuY84er8=;
 b=gW7o7G0w6URmS++SYvCVGAVlop+PhD56uu8eFrK0wQ61QVmhc0Gfuzwm8c2KbTQ3rPrP
 N5RT/b/lzu0SO2jYCxpHyTs5mNCnS0qgZ4y2PN8PVv+RodQtRAd4HUy2E1f2lDBUVe2u
 wnDPuNpCZ19eqJJvS+JbLonQeTEgFt8Q1/pHjclWbrA/l2t+LNxKGgEybnBIrK2EzABW
 3Ga76lu7aVa7nwhwVWtIUxFRz3v8vEe+RPOXcqz6sHFG96pbGEhIzn6n8ccLdty1XI6c
 EwtogTobcJhYHd5zpFK7SmeoBIeqY+ug7cx1Hsu8coPPE21PCZOCMcWlTuC3CQA46Vl6 AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m10c4vcst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 12:56:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E92F1100034;
 Fri, 25 Nov 2022 12:56:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0BE4218D1B;
 Fri, 25 Nov 2022 12:56:37 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 25 Nov
 2022 12:56:37 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Nov 2022 12:56:29 +0100
Message-ID: <20221125125600.1.I04ba2df902dce6162fd1cc11153417c1935d0ea9@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_04,2022-11-25_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH] firmware: scmi: use protocol node name to
	bind the scmi regulator driver
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

In scmi firmware driver, it is better to bind the scmi protocol driver
"scmi_voltage_domain" with the node name of the protocol 17 and not
the sub-node named "regulator", because is a fixed string which doesn't
provide information and because it is not aligned with the other scmi
protocol nodes.

For example on stm32mp135f-dk board with device tree in stm32mp131.dtsi

scmi: scmi {
	compatible = "linaro,scmi-optee";
	#address-cells = <1>;
	#size-cells = <0>;
	linaro,optee-channel-id = <0>;
	shmem = <&scmi_shm>;
	scmi_clk: protocol@14 {
		reg = <0x14>;
		#clock-cells = <1>;
	};
	scmi_reset: protocol@16 {
		reg = <0x16>;
		#reset-cells = <1>;
	};
	scmi_voltd: protocol@17 {
		reg = <0x17>;
		scmi_regu: regulators {
			#address-cells = <1>;
			#size-cells = <0>;
			scmi_reg11: voltd-reg11 {
				reg = <VOLTD_SCMI_REG11>;
				regulator-name = "reg11";
			};
			scmi_reg18: voltd-reg18 {
				reg = <VOLTD_SCMI_REG18>;
				regulator-name = "reg18";
			};
			scmi_usb33: voltd-usb33 {
				reg = <VOLTD_SCMI_USB33>;
				regulator-name = "usb33";
			};
		};
	};
};

Before the patch:

> dm tree

 scmi_agent    0  [ + ]   scmi-over-optee       |-- scmi
 clk           1  [ + ]   scmi_clk              |   |-- protocol@14
 ...
 reset         1  [   ]   scmi_reset_domain     |   |-- protocol@16
 nop           2  [ + ]   scmi_voltage_domain   |   `-- regulators
 regulator     0  [ + ]   scmi_regulator        |       |-- voltd-reg11
 regulator     1  [ + ]   scmi_regulator        |       |-- voltd-reg18
 regulator     2  [ + ]   scmi_regulator        |       |-- voltd-usb33
 ...

after the patch:

> dm tree

 scmi_agent    0  [ + ]   scmi-over-optee       |-- scmi
 clk           1  [ + ]   scmi_clk              |   |-- protocol@14
 ...
 reset         1  [   ]   scmi_reset_domain     |   |-- protocol@16
 nop           2  [ + ]   scmi_voltage_domain   |   `-- protocol@17
 regulator     0  [ + ]   scmi_regulator        |       |-- voltd-reg11
 regulator     1  [ + ]   scmi_regulator        |       |-- voltd-reg18
 regulator     2  [ + ]   scmi_regulator        |       |-- voltd-usb33
 ...

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/firmware/scmi/scmi_agent-uclass.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/scmi/scmi_agent-uclass.c b/drivers/firmware/scmi/scmi_agent-uclass.c
index 8f48de30c8cc..9a32678617d7 100644
--- a/drivers/firmware/scmi/scmi_agent-uclass.c
+++ b/drivers/firmware/scmi/scmi_agent-uclass.c
@@ -60,6 +60,7 @@ static int scmi_bind_protocols(struct udevice *dev)
 {
 	int ret = 0;
 	ofnode node;
+	const char *name;
 
 	dev_for_each_subnode(node, dev) {
 		struct driver *drv = NULL;
@@ -71,6 +72,7 @@ static int scmi_bind_protocols(struct udevice *dev)
 		if (ofnode_read_u32(node, "reg", &protocol_id))
 			continue;
 
+		name = ofnode_get_name(node);
 		switch (protocol_id) {
 		case SCMI_PROTOCOL_ID_CLOCK:
 			if (IS_ENABLED(CONFIG_CLK_SCMI))
@@ -100,8 +102,7 @@ static int scmi_bind_protocols(struct udevice *dev)
 			continue;
 		}
 
-		ret = device_bind(dev, drv, ofnode_get_name(node), NULL, node,
-				  NULL);
+		ret = device_bind(dev, drv, name, NULL, node, NULL);
 		if (ret)
 			break;
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
