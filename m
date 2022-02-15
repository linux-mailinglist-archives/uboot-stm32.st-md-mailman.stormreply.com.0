Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B574B6F82
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 16:08:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 717BDC5F1F2;
	Tue, 15 Feb 2022 15:08:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE1B9C23E53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 15:08:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FEsg98026043;
 Tue, 15 Feb 2022 16:08:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=+Pmx+M62QwDSRK9OxUztXIJ9XkqPT/wuEu0TxLi3PpE=;
 b=Gxq085QUTpxaqZtB2GXFEzrWFn+XZhq3d5MPtp+8N8Ci2OKfdNZK71/ztciHkeVa7Mwm
 rnn/P4h5asl/MMtR0p7/lTmzqmm1M3CEMI97cqxajoOiJbeNn78E7fIiFgc0VRFYd5wH
 JfdBiV4UaJ6AY6Eq8PM4SKFbs7wye5WNg3y+D/4wulHfyWCnq8mqrcSrqR2aZz65QTd8
 OlSUMo3bdnuKDIIXsw9cqXHp2Hb2kji7cYg3sijD/eJAhOMG5JlI77lOziyuPlSIoA53
 Id4SbNBuFl6zyIlqu3+YUjpFs+/xGc/sGtSQBe6Ua7PstrY3w30q1iivWaoRDVrur3E3 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e89b5j29h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:08:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 689A0100034;
 Tue, 15 Feb 2022 16:08:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61C6B229A8E;
 Tue, 15 Feb 2022 16:08:54 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Feb 2022 16:08:54
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 15 Feb 2022 16:08:51 +0100
Message-ID: <20220215160841.2.Ie699b8bb03dfaa3eb5b4e175c0cb5f80fe05a507@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215160841.1.Ieacd0bc93c53f5b38d6e1d228a498bc40758f121@changeid>
References: <20220215160841.1.Ieacd0bc93c53f5b38d6e1d228a498bc40758f121@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] stm32mp1: bsec: add missing dev in
	function comment
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

Add the missing @dev reference in some function description.

Fixes: b66bfdf238b9 ("arm: stm32mp: bsec: migrate trace to log macro")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index fd6e1a3957..506caa0a31 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -167,6 +167,7 @@ static int bsec_power_safmem(u32 base, bool power)
 
 /**
  * bsec_shadow_register() - copy safmen otp to bsec data
+ * @dev: bsec IP device
  * @base: base address of bsec IP
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: 0 if no error
@@ -210,6 +211,7 @@ static int bsec_shadow_register(struct udevice *dev, u32 base, u32 otp)
 
 /**
  * bsec_read_shadow() - read an otp data value from shadow
+ * @dev: bsec IP device
  * @base: base address of bsec IP
  * @val: read value
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
@@ -224,6 +226,7 @@ static int bsec_read_shadow(struct udevice *dev, u32 base, u32 *val, u32 otp)
 
 /**
  * bsec_write_shadow() - write value in BSEC data register in shadow
+ * @dev: bsec IP device
  * @base: base address of bsec IP
  * @val: value to write
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
@@ -242,6 +245,7 @@ static int bsec_write_shadow(struct udevice *dev, u32 base, u32 val, u32 otp)
 
 /**
  * bsec_program_otp() - program a bit in SAFMEM
+ * @dev: bsec IP device
  * @base: base address of bsec IP
  * @val: value to program
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
