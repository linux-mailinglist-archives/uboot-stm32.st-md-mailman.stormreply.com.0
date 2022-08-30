Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F55A66B6
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 16:56:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F641C5A4FD;
	Tue, 30 Aug 2022 14:56:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E91CC57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 14:56:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UEoSTp031127;
 Tue, 30 Aug 2022 16:56:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Bkx/tAicwcISOLYyMy/glYhBHWalc4Lq5/7fl0Wrq6E=;
 b=s6GZf2X2/I8aj9ypDIvJX4jovkJWAIye5RWiVbB0oYdH6QZn2I79spoIp8OcOLw/unhF
 i4XGXEvF4ZZ7YZgGh0p9yxS8kn9X4RZThJX7m37guml0v/axRhyULIPxJTMpIZE48+sy
 vNOGBahhrfZmFvRPsu3u61kRihF160+//eiEBOmueCKhz3a4Ya47OdDN9cDTMRUiJBD/
 6OVjk4Ow/ztbgZh2SsrPUHpStu03A2NIQLY80RWClEVdTLVj3g0cWHKlZ3e7sK5yoEAV
 fvdKwn88eFVPhW/EdDNfyMdNcgWvb1hP5RlFtrcXenPszE13Dv3PvBEftzZeMyh3t102 og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j7am10ej4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 16:56:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E5AB110002A;
 Tue, 30 Aug 2022 16:56:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBF4E2309E0;
 Tue, 30 Aug 2022 16:56:35 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 16:56:35 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Aug 2022 16:56:28 +0200
Message-ID: <20220830145628.2386366-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_08,2022-08-30_01,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [Uboot-stm32] [PATCH] doc: Add gpio status output fields description
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

Add gpio status output fields description and one output example.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 doc/usage/cmd/gpio.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/doc/usage/cmd/gpio.rst b/doc/usage/cmd/gpio.rst
index f6a5668388..b768b08a9b 100644
--- a/doc/usage/cmd/gpio.rst
+++ b/doc/usage/cmd/gpio.rst
@@ -45,6 +45,17 @@ gpio status
 
 Display the status of one or multiple GPIOs. By default only claimed GPIOs
 are displayed.
+gpio status command output fields are : [name]: [function]: [value] [x] [label]
+
+[function] can be:
+  - "output" : pin configured in gpio output.
+  - "input"  : pin configured in gpio input.
+  - "func"   : pin configured in alternate function, followed by [label]
+     which shows pinmuxing label.
+  - "unused" : pin not configured.
+
+For [function] "output" or "input", [value] field indicates pin's level,
+[x] or [ ] indicates respectively if gpio is used or not, [label] shows gpio label.
 
 -a
     Display GPIOs irrespective of being claimed.
@@ -77,6 +88,21 @@ Switch the status of a GPIO::
     => echo $myvar
     0
 
+    => gpio status
+    Bank GPIOA:
+    GPIOA1: func rgmii-0
+    GPIOA2: func rgmii-0
+    GPIOA7: func rgmii-0
+    GPIOA10: output: 0 [x] hdmi-transmitter@39.reset-gpios
+    GPIOA13: output: 1 [x] red.gpios
+
+    Bank GPIOB:
+    GPIOB0: func rgmii-0
+    GPIOB1: func rgmii-0
+    GPIOB2: func uart4-0
+    GPIOB7: input: 0 [x] mmc@58005000.cd-gpios
+    GPIOB11: func rgmii-0
+
 Configuration
 -------------
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
