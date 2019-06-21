Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED64E911
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1A4FCA0292
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 547ECCA028A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRMBh006998; Fri, 21 Jun 2019 15:27:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5zPEDU/bXgZoxmFEWrivOs9Jmqf0izHxJ7rkk1tGfUo=;
 b=DZ1G+mLMPlo4QHYXMoQFzXzdHlm76SfSuBPmiM62DXDj0/YRpN0ojmN6NHhOVypB3xtS
 pFLHikERxgAl9AIVxBNC7KBVEk9BmWFgQ8rBV3iOuROWjnfdNTqAmATjdGm4waLSRV1J
 MZTvdUhqBZ5Qw6II58nlQUoaKSfdqNEH82NnimvlM7NM6IzeWx34QkwPFu1KHQEFv1dj
 KHO3axlF45z8svRHEY+lD4tk/u+Vyt9LvT6DK3u1nP9LWyFS5+Zg6IkB1JX1NNpWZkbw
 79gRFyxGfSF9OtVjE9Xn/2z/qp3Ac2xw3/M3vHTXIDuKl1ZXFbc2pAc9CwIAUH26SkoZ Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxss9k7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F18FB94;
 Fri, 21 Jun 2019 13:27:16 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE1D62A50;
 Fri, 21 Jun 2019 13:27:16 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:16 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:16
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:51 +0200
Message-ID: <1561123618-2029-13-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 13/20] ram: stm32mp1_ram: Fix warnings when
	compiling with W=1
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

This patch solves the following warnings:

drivers/ram/stm32mp1/stm32mp1_ram.c: In function 'stm32mp1_ddr_clk_enable':
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  for (idx = 0; idx < ARRAY_SIZE(clkname); idx++) {
                    ^
drivers/ram/stm32mp1/stm32mp1_ram.c: In function 'stm32mp1_ddr_setup':
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  for (idx = 0; idx < ARRAY_SIZE(param); idx++) {
                    ^
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_ram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
index 84e39d0..a362cf9 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ram.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
@@ -26,7 +26,7 @@ int stm32mp1_ddr_clk_enable(struct ddr_info *priv, uint32_t mem_speed)
 	unsigned long ddr_clk;
 	struct clk clk;
 	int ret;
-	int idx;
+	unsigned int idx;
 
 	for (idx = 0; idx < ARRAY_SIZE(clkname); idx++) {
 		ret = clk_get_by_name(priv->dev, clkname[idx], &clk);
@@ -59,7 +59,8 @@ int stm32mp1_ddr_clk_enable(struct ddr_info *priv, uint32_t mem_speed)
 static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
 {
 	struct ddr_info *priv = dev_get_priv(dev);
-	int ret, idx;
+	int ret;
+	unsigned int idx;
 	struct clk axidcg;
 	struct stm32mp1_ddr_config config;
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
