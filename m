Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 024FF32D2B0
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Mar 2021 13:14:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8F46C57B76;
	Thu,  4 Mar 2021 12:14:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E34EDC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 12:14:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124CB92D006321; Thu, 4 Mar 2021 13:14:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=p1H79wV2qJcnitGVHNcqlWtAkwzWprCvnhnaHKnE8Nc=;
 b=VEheqhkB/GDdzWZspmEh1wfu+0R2VpH918hLpvWc0dBPEUf7jW9wmZpE9zlyS9Rb+aHw
 kNBX4/PM147DjRRqepKtCjS5+pfGEbW3m079oJSoJ4WHE2rK76LW2SZ0mVZIjA7hIAj3
 kgzrPueMQhVJbstknmab6jZVn84w0GCtX9GHK/BcMePoh8sdgjpaeJ7FfFozPa3qpkza
 LeyQcshSSZtWb9C7FWvjSj2LNGm1bvphIMQryAgoC7+4GTCKgr5kO1vSWKodr70Jbwbh
 nTSYwsxpwxGGF/jkfrkFx+UzP+SBnMw0G3pcR4YtTtKfGaiZVOAOIHsTWutEBqc3k1Ro 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 370xej40yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 13:14:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3857C10002A;
 Thu,  4 Mar 2021 13:14:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E3B023E7BA;
 Thu,  4 Mar 2021 13:14:38 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar 2021 13:14:37
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Mar 2021 13:14:35 +0100
Message-ID: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_03:2021-03-03,
 2021-03-04 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] video: dw_mipi_dsi: missing device to log
	debug
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

From: Yannick Fertre <yannick.fertre@foss.st.com>

Missing udevice to struct dw_mipi_dsi to log trace.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/video/dw_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/dw_mipi_dsi.c b/drivers/video/dw_mipi_dsi.c
index 4dde648814..a5beed3514 100644
--- a/drivers/video/dw_mipi_dsi.c
+++ b/drivers/video/dw_mipi_dsi.c
@@ -797,6 +797,7 @@ static int dw_mipi_dsi_init(struct udevice *dev,
 	dsi->phy_ops = phy_ops;
 	dsi->max_data_lanes = max_data_lanes;
 	dsi->device = device;
+	dsi->dsi_host.dev = (struct device *)dev;
 	dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
 	device->host = &dsi->dsi_host;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
