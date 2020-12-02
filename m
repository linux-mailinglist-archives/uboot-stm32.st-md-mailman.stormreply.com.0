Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3C2CC41D
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 18:47:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79A6DC06150;
	Wed,  2 Dec 2020 17:47:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0D54C424C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 17:47:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2HhD9K022621; Wed, 2 Dec 2020 18:47:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=lL9+KftsbjUw0BTbz2/uGxX/0lNySQ0+Xdp8AyLH11k=;
 b=zVSKxci3fNgpzysjAIPhV6R3dSWIarvVWBWDPlVXSHZIuWP5yE6G9WHvjxDXbTFuPhge
 2o7NkC/E48nz8wJXZYSUSA3bMXuJztH+SlzjS1xqS/At/AYrRK5eTFT5lI/UDDsOqs0f
 JkW/j5u0KAPu8IDzq/1VJ5bnT7j//ctiHiiAHflqlz89u/zpn9BcypYGf53NqsmGwsyy
 L/mVk/0xY9+R1eoZsJbS++hbC5r9i/4M9+z6Gsr7oNiFqikfs/Vh9u7mQXmlSNsOMc3Z
 Y8iqu/i7o5Ec6RJm5Ie9lXgdSi5ylZjyIdvkSIAdWumcU/7x7Nz3MgMn1OZ8OZRbMzF9 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3hcku3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 18:47:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 025A610003B;
 Wed,  2 Dec 2020 18:47:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E95A8247D32;
 Wed,  2 Dec 2020 18:47:39 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec 2020 18:47:39
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 2 Dec 2020 18:47:31 +0100
Message-ID: <20201202174731.9503-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202174731.9503-1-patrice.chotard@foss.st.com>
References: <20201202174731.9503-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_10:2020-11-30,
 2020-12-02 signatures=0
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] .mailmap: map Patrick Delaunay and my
	email address
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

Add our new email address dedicated for upstream activities.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
  - Add .mailmap update

 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 8250015453..33001f1e01 100644
--- a/.mailmap
+++ b/.mailmap
@@ -31,6 +31,8 @@ Jagan Teki <jagannadh.teki@gmail.com>
 Jagan Teki <jagannadha.sutradharudu-teki@xilinx.com>
 Igor Opaniuk <igor.opaniuk@gmail.com> <igor.opaniuk@linaro.org>
 Markus Klotzbuecher <mk@denx.de>
+Patrice Chotard <patrice.chotard@foss.st.com> <patrice.chotard@st.com>
+Patrick Delaunay <patrick.delaunay@foss.st.com> <patrick.delaunay@st.com>
 Paul Burton <paul.burton@mips.com> <paul.burton@imgtec.com>
 Prabhakar Kushwaha <prabhakar@freescale.com>
 Rajeshwari Shinde <rajeshwari.s@samsung.com>
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
