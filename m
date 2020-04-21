Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A34081B2ABD
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:11:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D48BC36B0F
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:11:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FA3BC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:11:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF8D2N010796; Tue, 21 Apr 2020 17:11:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cKW69xAbti7GalO53dNLWZupsuZ/MLuEr6SEhBc2Eio=;
 b=x/drb+7b7+LJllyg29K1TEJBcetatMCfctYU2JqrEiV8UGR2/TNUlYOF7rmzBxeauJPc
 ZaViUz+2V88bf0MuC9dyGuFc5j7CVkJEiGSh+AXww7oiqlyEkszFpL6eUsI7Iq2ASHjp
 I9ZscTAvsAN1Najh3+paxDeBmt20Z2B1n4zcUmPnugRuq3PhWoJu2FlkEw5N5hJ4Xj66
 cTfnx/+AcUtFoQosSIIANCPJJr99NWL2oz4QoOsJRw3QX6LeMAHE7Z6M+TXbtwxtlJpe
 3D5StPwLxunu840uecWmWpH10+kS5E3u07JimCBjjTCY636NTDTTWXH9wVFQzyrg/iK8 RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11gwm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E9DE510002A;
 Tue, 21 Apr 2020 17:11:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF67C2BE249;
 Tue, 21 Apr 2020 17:11:50 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:50 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:25 +0200
Message-ID: <20200421171123.6.I845d08dcbe270a6b9339cdca96d25b1f4ce0e13e@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151128.18072-1-patrick.delaunay@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 6/9] arm: stm32mp: add weak function to save
	vddcore
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

Add a weak functions to save the vddcore voltage value provided
in the OPP node when the clock tree is initialized.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/include/mach/sys_proto.h | 3 +++
 drivers/clk/clk_stm32mp1.c                     | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 1617126bea..55193b5c2d 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -43,3 +43,6 @@ void get_soc_name(char name[SOC_NAME_SIZE]);
 u32 get_bootmode(void);
 
 int setup_mac_address(void);
+
+/* board power management : configure vddcore according OPP */
+void board_vddcore_init(u32 voltage_mv);
diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index baacc1abb5..5fccc03ba7 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -1225,6 +1225,10 @@ bool stm32mp1_supports_opp(u32 opp_id, u32 cpu_type)
 	}
 }
 
+__weak void board_vddcore_init(u32 voltage_mv)
+{
+}
+
 /*
  * gets OPP parameters (frequency in KHz and voltage in mV) from
  * an OPP table subnode. Platform HW support capabilities are also checked.
@@ -1302,6 +1306,7 @@ int stm32mp1_get_max_opp_freq(struct stm32mp1_clk_priv *priv, u64 *freq_hz)
 		return -FDT_ERR_NOTFOUND;
 
 	*freq_hz = (u64)1000U * freq;
+	board_vddcore_init(voltage);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
