Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AFAF8C1C
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:42:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AB2FC36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 09:42:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C588C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 09:42:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC9b3vm019028; Tue, 12 Nov 2019 10:42:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=THYMTCjVs6TEsaB7zO28tiTkj8Zp6iUnoqzXAUX7ISo=;
 b=1g0agu2EBK7KefXk8HhwgkuhvaQqeGjNWJvmELlShY0Fq0JTELROkodPK/s/RCjydrsN
 Wa7HJASEP3XE+JILM6fWFHcOxGts0Htt8pTxVWwItSbNKBYRtD521glUOVic8V5z//py
 JDwPh7VB1rQiG1wBfWexw/qMOb84lF9mt8yYrf/kGE6ctSIVKpeBL1AneMeSrX0DbBxI
 GXOvg4/wevalESeZg1z2vcGRJY9EkjAPpo0n0H/zOgEwygJMkmyR8a45DXEGYqEFqqzC
 sFcPrkCQC01F1bRiUPJ0svK3s8u+8WpR02da4boF55iEEcpOz0K6XCc7Sdq6evl2SLnc QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psb15xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 10:42:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 179C510002A;
 Tue, 12 Nov 2019 10:42:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA0F92B1879;
 Tue, 12 Nov 2019 10:42:17 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 10:42:17 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 10:42:10 +0100
Message-ID: <20191112094214.12686-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112094214.12686-1-patrick.delaunay@st.com>
References: <20191112094214.12686-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, simon.k.r.goldschmidt@gmail.com,
 Sekhar Nori <nsekhar@ti.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 ley.foon.tan@intel.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v3 1/5] dm: clk: add stub for clk_disable_bulk
	when CONFIG_CLK is desactivated
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

Add stub for clk_disable_bulk() when CONFIG_CLK is desactivated.

That avoid compilation issue (undefined reference to
`clk_disable_bulk') for code:

clk_disable_bulk(&priv->clks);
clk_release_bulk(&priv->clks);

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- Add stub for clk_disable_bulk

Changes in v2: None

 include/clk.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/clk.h b/include/clk.h
index a5ee53d94a..6f0b0fe4bc 100644
--- a/include/clk.h
+++ b/include/clk.h
@@ -379,7 +379,11 @@ int clk_disable(struct clk *clk);
  *		by clk_get_bulk().
  * @return zero on success, or -ve error code.
  */
+ #if CONFIG_IS_ENABLED(CLK)
 int clk_disable_bulk(struct clk_bulk *bulk);
+#else
+inline int clk_disable_bulk(struct clk_bulk *bulk) { return 0; }
+#endif
 
 /**
  * clk_is_match - check if two clk's point to the same hardware clock
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
