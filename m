Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5705AF137
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 18:53:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E65FDC63326;
	Tue,  6 Sep 2022 16:53:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7125BC640F0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 16:53:29 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286FRgLq012326;
 Tue, 6 Sep 2022 18:53:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=dV97soy3EciVqQPqHWw29u0VA6uSukK/gtWhSpdqj+0=;
 b=Lk3xgckgQlnot9WuzB39+4ZmF+tQdm2EBaXmc13zJGcJFCFUtaNz2lgYOWlnKR/L21qb
 f/TLL2+5zdNbx7aLkQ6K2HdSVrCmjmlSW6cBmQMYQWDLUor/trYGrPKPg1u/KbNQUlBI
 rpzmJE0hRpUJhLrJPzj5LaC7OnikeVv+oIucToW+zCzX6Hnml8NhOmzp7nwgG7yNDEsR
 MndidNyBIdoTEqgHCSBa9Vca5eUpi4M996b3VyKDUAHNgLU8l6IgX79Fosb8AuAUw+n2
 WRykAPymYhG05+w3STjQhUV+ywnhR686ahg5jbjD93WFaaCBukezY95KmaSIyTFGy4h/ vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbvbn9ueu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 18:53:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DAB910002A;
 Tue,  6 Sep 2022 18:53:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59C8D23BE17;
 Tue,  6 Sep 2022 18:53:28 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 6 Sep
 2022 18:53:25 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Sep 2022 18:53:20 +0200
Message-ID: <20220906185314.4.I7f5dcb6d058c600d6f67432864c5051d29ba8d7b@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906185314.1.I9928b88f3a453611043b484158b02efe9b0c06bf@changeid>
References: <20220906185314.1.I9928b88f3a453611043b484158b02efe9b0c06bf@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 4/4] stm32mp: stm32prog: correctly handle OTP
	when SMC is not supported
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

As the SMC is only supported in SP-MIN for STM32MP15x, the associated
partition should be absent when the TA NVMEM is not available in OPT-TEE
in STM32MP13x.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 25 +++++++++++++------
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  5 ++++
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 67be1ac7ff8..b151ce10475 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1342,10 +1342,22 @@ static int dfu_init_entities(struct stm32prog_data *data)
 	struct stm32prog_part_t *part;
 	struct dfu_entity *dfu;
 	int alt_nb;
+	u32 otp_size = 0;
 
 	alt_nb = 1; /* number of virtual = CMD*/
-	if (IS_ENABLED(CONFIG_CMD_STM32PROG_OTP))
-		alt_nb++; /* OTP*/
+
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
+		/* OTP_SIZE_SMC = 0 if SMC is not supported */
+		otp_size = OTP_SIZE_SMC;
+		/* check if PTA BSEC is supported */
+		ret = optee_ta_open(data);
+		log_debug("optee_ta_open(PTA_NVMEM) result %d\n", ret);
+		if (!ret && data->tee)
+			otp_size = OTP_SIZE_TA;
+		if (otp_size)
+			alt_nb++; /* OTP*/
+	}
+
 	if (CONFIG_IS_ENABLED(DM_PMIC))
 		alt_nb++; /* PMIC NVMEM*/
 
@@ -1363,6 +1375,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
 	puts("DFU alt info setting: ");
 	if (data->part_nb) {
 		alt_id = 0;
+		ret = 0;
 		for (phase = 1;
 		     (phase <= PHASE_LAST_USER) &&
 		     (alt_id < alt_nb) && !ret;
@@ -1396,12 +1409,8 @@ static int dfu_init_entities(struct stm32prog_data *data)
 	if (!ret)
 		ret = stm32prog_alt_add_virt(dfu, "virtual", PHASE_CMD, CMD_SIZE);
 
-	if (!ret && IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
-		ret = optee_ta_open(data);
-		log_debug("optee_ta result %d\n", ret);
-		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP,
-					     data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC);
-	}
+	if (!ret && IS_ENABLED(CONFIG_CMD_STM32PROG_OTP) && otp_size)
+		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP, otp_size);
 
 	if (!ret && CONFIG_IS_ENABLED(DM_PMIC))
 		ret = stm32prog_alt_add_virt(dfu, "PMIC", PHASE_PMIC, PMIC_SIZE);
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 397506ac47c..58f4b96fa75 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -20,7 +20,12 @@
 #define DEFAULT_ADDRESS		0xFFFFFFFF
 
 #define CMD_SIZE		512
+/* SMC is only supported in SPMIN for STM32MP15x */
+#ifdef CONFIG_STM32MP15x
 #define OTP_SIZE_SMC		1024
+#else
+#define OTP_SIZE_SMC		0
+#endif
 #define OTP_SIZE_TA		776
 #define PMIC_SIZE		8
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
