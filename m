Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D49981C5F1
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 May 2019 11:22:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99CF7C35E0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 May 2019 09:22:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C802C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 09:21:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E96x9s001198; Tue, 14 May 2019 11:20:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CRxBGrir0029saRf0q7MyaH8WjkLTnatO8AWYMZgX4s=;
 b=Lp/aaKT6wRfyAcQU4sZHbyneazL3j358AjPw5d8RihXOw8KVU3/rNtGWM8lBwD+wFtNZ
 JVPc+i2JK2XjEZQjePS1ES6QneiKhoeUk58ZUMEVElXt6ZkJZuzo0Cdo/rMQ0YGV/K7L
 8idwv8KOxLv11T4M7G+1l+nxIlPh7mPuJQ2twzPqqX0FdEZu09KhOhtX/gDYMYBNCFjd
 AKKNxy1Le3FT1QEFERjbouxyFxDlclQpzQOEtj++QLLVvVtq3V0BiEFKD5wfr7idConH
 8fdj+p7okYyNQ5quP9/hVx2KqxdR/0JbHquz1pqm+mIgjzjThiZPYVxZXQvVy9eumBFA dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdm5tyxeb-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 May 2019 11:20:53 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B56193D;
 Tue, 14 May 2019 09:20:52 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F5641696;
 Tue, 14 May 2019 09:20:52 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May
 2019 11:20:52 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May 2019 11:20:51
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, Albert Aribaud
 <albert.u.boot@aribaud.net>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>, Alexander Graf
 <agraf@suse.de>, Stefan Roese <sr@denx.de>, Mario Six <mario.six@gdsys.cc>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, "Andrew F . Davis"
 <afd@ti.com>, Michal Simek <michal.simek@xilinx.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Liviu Dudau
 <Liviu.Dudau@foss.arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, York Sun <york.sun@nxp.com>,
 "Andreas Dannenberg" <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>, "Lokesh Vutla" <lokeshvutla@ti.com>
Date: Tue, 14 May 2019 11:20:35 +0200
Message-ID: <1557825637-25153-3-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
References: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_05:, , signatures=0
X-Mailman-Approved-At: Tue, 14 May 2019 09:22:33 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 2/4] MAINTAINERS: Add stm32 mailbox IPPC driver
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

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33fd465..5523c4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -301,6 +301,7 @@ S:	Maintained
 F:	arch/arm/mach-stm32mp/
 F:	drivers/clk/clk_stm32mp1.c
 F:	drivers/i2c/stm32f7_i2c.c
+F:	drivers/mailbox/stm32-ipcc.c
 F:	drivers/misc/stm32mp_fuse.c
 F:	drivers/mmc/stm32_sdmmc2.c
 F:	drivers/phy/phy-stm32-usbphyc.c
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
