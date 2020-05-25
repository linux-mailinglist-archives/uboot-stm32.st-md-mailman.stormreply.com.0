Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7B1E0B98
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 12:20:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E93B4C36B2F
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 10:20:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3250C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 10:20:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAH5Em011631; Mon, 25 May 2020 12:19:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=mhvSkhT2gbblU5/7OsHU1pZ7IDHSHJUf/FcQ8Tk3kRk=;
 b=ji4sAWub8iKipWg3cRiaFCaO8R3/fzxP3sVaJrjO0hzTXxGegryPA4hYd9DO1iTtRX24
 I4X4FhA4R0aQ87ng4+LPizChsdgYa6IZlLqpRDYxb3G3uucye6HOj1vqqWJFx9jgq4/5
 AZFmn+VsFFeOmx9s+L3wgRaQXoKYT5g/JLzGwaTWS+Z+MWD9Dn4Y4hkHGsWQ29PlJ14D
 jLm/KVKEpAPiJnFlQTwa5qSgH9eAirKvVBXqe8pNXEBU/f1eeDYPG+ZaA95ZfcAm7weE
 NUVUY4bgno33t51aO7ccVUtNrr4U/kD0q74AhJQw1CBO6hsLN6sYPz/UnvBKfucITK1W fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316tqgse1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 12:19:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B0EA10002A;
 Mon, 25 May 2020 12:19:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DAA920B854;
 Mon, 25 May 2020 12:19:58 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 May 2020 12:19:57 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 May 2020 12:19:45 +0200
Message-ID: <20200525101949.15944-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525101949.15944-1-patrick.delaunay@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-25,
 2020-05-25 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 5/9] arm: stm32mp: add weak function to
	save vddcore
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
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2: None

 arch/arm/mach-stm32mp/include/mach/sys_proto.h | 3 +++
 drivers/clk/clk_stm32mp1.c                     | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 4b6c7b8bdd..4149d3a133 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -48,3 +48,6 @@ void get_soc_name(char name[SOC_NAME_SIZE]);
 u32 get_bootmode(void);
 
 int setup_mac_address(void);
+
+/* board power management : configure vddcore according OPP */
+void board_vddcore_init(u32 voltage_mv);
diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index b48c835bc3..d1177fc3af 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -1226,6 +1226,10 @@ bool stm32mp1_supports_opp(u32 opp_id, u32 cpu_type)
 	}
 }
 
+__weak void board_vddcore_init(u32 voltage_mv)
+{
+}
+
 /*
  * gets OPP parameters (frequency in KHz and voltage in mV) from
  * an OPP table subnode. Platform HW support capabilities are also checked.
@@ -1303,6 +1307,7 @@ int stm32mp1_get_max_opp_freq(struct stm32mp1_clk_priv *priv, u64 *freq_hz)
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
