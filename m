Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 661917AF7C
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32866C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFB57C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHG4uW012688; Tue, 30 Jul 2019 19:17:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=xXwrFVuPM/haWfFYu5tVLA0GSerMA2mN4CZ6KnVmubQ=;
 b=Fk3uFRfgJEk8n9v/kfjPpVzAbnE+r4Jj7d2UBJLbv8QrgIykR8uqS9poLct/UVHk5evj
 U7j1bHMDQIsXpuQGRSfptdm3joKFcKu/IiONFnfayA2FMiU+ldI6Q2d1htDk53XhkUw4
 8LORBLfdHtcqz1vBWa4TLkk3d2YG1d5XHWKDJAN+4fiA2gVAmBm22qBxBw7b6K7a0dtz
 NqRJ89AkF8WrVYcWmSKvpSWQ0SI4lWBU2fnfVh17uCW9Om9NzzaIQUsrGxVuAPWtf26o
 0/Az8uy12yvoBBJpbuiXJIQo2E9rcRpq8ANGGkISXu+vyibZsPvH9sBZLO9FPATxeJ3d fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2ybj21-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BC0531;
 Tue, 30 Jul 2019 17:17:13 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 751ACCEA01;
 Tue, 30 Jul 2019 19:17:13 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:13 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:12
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:19 +0200
Message-ID: <1564507016-16570-12-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 11/48] dt-bindings: clock: stm32mp1: support
	disabled fixed clock
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

Add precision for disabled fixed clock in stm32mp1 binding.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 doc/device-tree-bindings/clock/st,stm32mp1.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/doc/device-tree-bindings/clock/st,stm32mp1.txt b/doc/device-tree-bindings/clock/st,stm32mp1.txt
index 02e1460..ec1d703 100644
--- a/doc/device-tree-bindings/clock/st,stm32mp1.txt
+++ b/doc/device-tree-bindings/clock/st,stm32mp1.txt
@@ -164,8 +164,10 @@ used to define the state of associated ST32MP1 oscillators:
   - clk-csi
 
 At boot the clock tree initialization will
-  - enable oscillators present in device tree
+  - enable oscillators present in device tree and not disabled
+    (node with status="disabled"),
   - disable HSI oscillator if the node is absent (always activated by bootrom)
+    and not disabled (node with status="disabled").
 
 Optional properties :
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
