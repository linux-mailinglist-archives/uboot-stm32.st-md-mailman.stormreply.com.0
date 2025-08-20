Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E86B2EEE7
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Aug 2025 08:58:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CD02C3F933;
	Thu, 21 Aug 2025 06:58:30 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C216DC3F949
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 16:20:23 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KFbNxx030449;
 Wed, 20 Aug 2025 18:20:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 okok4HqrJ8mkJ8BiLV7B4uO0WzvLZbZm8GZmc8peOqs=; b=ZPWFVMD9RuxoilFL
 GISuH0ZnqmwzQpWKBlJ+cRtELz6qRmjig6oXtRzapgLYwd8cUaM7G2KlY3IDLDtL
 kH2uefEBMs1TUbu534vPQkWcaKhkbVwHHkFwYfk+FAf4KQBwCmHzleOVLnidWepY
 hCv5tU6AG28dGVa+g+x+e8Sms7ZJ/si2KUoy27CDXNNbmjH5nthWA9eQQPATD0Di
 iVkr9vlpwQDFmqCAPF1jfeTAvui0l3iIAPEkFtf7KvsYCq7CTNtnMz7Hv4F4H9Xz
 8dMcNd+c1RkJunoFds/f446BosSQlkehjZi40/PrYtWnnrasybOcNwcMpY5kKvZO
 6SPKyg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n81wjjuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Aug 2025 18:20:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 10FB74002D;
 Wed, 20 Aug 2025 18:19:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D6E772B816;
 Wed, 20 Aug 2025 18:18:57 +0200 (CEST)
Received: from localhost (10.252.7.99) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 18:18:57 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Wed, 20 Aug 2025 18:17:41 +0200
MIME-Version: 1.0
Message-ID: <20250820-master-v1-2-fc76f18ab2fd@foss.st.com>
References: <20250820-master-v1-0-fc76f18ab2fd@foss.st.com>
In-Reply-To: <20250820-master-v1-0-fc76f18ab2fd@foss.st.com>
To: Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.7.99]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Mailman-Approved-At: Thu, 21 Aug 2025 06:58:27 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH 2/8] video: simple_panel: add support for
 "panel-lvds" display
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

Add the compatible "panel-lvds" for simple-panel driver in U-Boot.  In
Linux this compatible is managed by the driver
drivers/gpu/drm/panel/panel-lvds.c but in U-Boot the specific LVDS
features (bus_format/bus_flags) are not supported.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/video/simple_panel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/simple_panel.c b/drivers/video/simple_panel.c
index b6c5b058b2e967bbbd47ab3c3ce5ca52c7804409..0f23df701bc3c40ea49380bbfa3743ee592d8bd3 100644
--- a/drivers/video/simple_panel.c
+++ b/drivers/video/simple_panel.c
@@ -191,6 +191,7 @@ static const struct mipi_dsi_panel_plat panasonic_vvx10f004b00 = {
 
 static const struct udevice_id simple_panel_ids[] = {
 	{ .compatible = "simple-panel" },
+	{ .compatible = "panel-lvds" },
 	{ .compatible = "auo,b133xtn01" },
 	{ .compatible = "auo,b116xw03" },
 	{ .compatible = "auo,b133htn01" },

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
