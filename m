Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B518B1739A2
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 15:18:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FA92C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 14:18:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5E16C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 14:18:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SEDOdp025949; Fri, 28 Feb 2020 15:18:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6p9ivx7q1z8QR3B1jwYVniGPdLpjAn4V+2ysgyCm79w=;
 b=xBA/FI/TkD6B5yDd6h29JmWma2OCzUqks9XLUBPimLk43KWxIOmgPowcPBeFlEXZ6ZG5
 eaxPpa1RD+UjL+pfY3StQ5h3lEHuAFuISwR6zvXN7ni6gQ+ns9DFwH6cdCpdShnhgUAX
 1GKknn7u+jsv8H5rXtvSn7dk/9MGaJ58T9I8QcosxmFq8NIJQ7FTsqn4kfGSqfoT1Hul
 dpg0WxTHj88CYz1lnK2HeQCPiGlEkiL+cKmL0ZZC4idb/zFAAho6E8BkqtwLv/XoETi0
 o6mxGVz7Xc5rVHrMZF7mFnYVT7AlCzsLtA4GgztBZISyiiAptv+deC87nDCXZ6ArUkHt cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvvcc4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 15:18:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78E65100034;
 Fri, 28 Feb 2020 15:18:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D4412BF9D0;
 Fri, 28 Feb 2020 15:18:23 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Feb 2020 15:18:22 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Feb 2020 15:18:15 +0100
Message-ID: <20200228141816.1644-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228141816.1644-1-patrick.delaunay@st.com>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
 2020-02-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: [Uboot-stm32] [PATCH 6/7] doc: device-tree-bindings: update
	reference to binding directory
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

Update reference in files detected by
scripts/documentation-file-ref-check

doc/devicetree/device-tree-bindings/  => doc/device-tree-bindings/

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 doc/device-tree-bindings/net/ti,dp83867.txt      | 2 +-
 doc/device-tree-bindings/video/rockchip-lvds.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/device-tree-bindings/net/ti,dp83867.txt b/doc/device-tree-bindings/net/ti,dp83867.txt
index 268220964a..d3c3046499 100644
--- a/doc/device-tree-bindings/net/ti,dp83867.txt
+++ b/doc/device-tree-bindings/net/ti,dp83867.txt
@@ -18,7 +18,7 @@ Required properties:
 			      PHY's default will be left as is.
 
 Default child nodes are standard Ethernet PHY device
-nodes as described in doc/devicetree/bindings/net/ethernet.txt
+nodes as described in doc/device-tree-bindings/net/ethernet.txt
 
 Example:
 
diff --git a/doc/device-tree-bindings/video/rockchip-lvds.txt b/doc/device-tree-bindings/video/rockchip-lvds.txt
index 07e3d3f9de..7432e22166 100644
--- a/doc/device-tree-bindings/video/rockchip-lvds.txt
+++ b/doc/device-tree-bindings/video/rockchip-lvds.txt
@@ -20,7 +20,7 @@ Required properties:
 	<LVDS_OUTPUT_DUAL>, This describes the output face.
 
 - display-timings : described by
-	doc/devicetree/device-tree-bindings/video/display-timing.txt.
+	doc/device-tree-bindings/video/display-timing.txt.
 
 Example:
 	lvds: lvds@ff96c000 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
