Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIw1EFsaDGpIWQUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 10:07:55 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED061579ACE
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 10:07:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCA0DC8F296;
	Tue, 19 May 2026 08:07:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013063.outbound.protection.outlook.com
 [40.107.162.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C51CC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 08:07:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIvP3+rVBubkXB6cPrfNemIKFsUa/CMgxk3eCNP1w8+aGIEJ2UFoYyI493C0nV4jE1FSFX183EgTKkrYykJ0nt4gSxxocjKJ2PqtXIs1hykwPVGegcG/XknOlRTFHjv3dBh0OwtMoe7EGS7eeg3Lttw+2zjFuiFB1XBJtPYspzXMTeVqIpa69k4lLIZIf4f/GpdvSQ1iV7MpvUItzoh6tL12zNyf8VDViwL/93i1I4QQW/2KMWqCiBSQc2HX8GL09jGkhuGwSDQkxpk3zmi540CsK6I1SKTLppYvRea7aLMpsDEmsuk4e61QOF7cZ2XQJfK+/sAI3w5TS/8pNuMHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL/sF7+4ECtAwn90lt6Ck1Wu3zIh3pLNTYaf+zy6fik=;
 b=KjpIowwDidthCegRKZleUDVzR98uLOYKREkYTNHrMVTbvCP9eBkq/AjxBUJKrPCpqXoB3ZOtkJTh5ubQT5Vcuq/HJD0QqjCNSPzeVTyKfZoSKzIfIub/QAJ6QuVcAPw82PY+y9zLA3/Y6kOJPHNxeVVtvwab8NCrk+FP7er4sjCGLc4/ALU0uOv6iTry/Sc3kZ+fv7Mlj7JuBzm8Z3cqzrqzYUowHoJQ7jGgFYsFDTJjxakvbM6WNpfALCi5phBscRIgQ/UNmGWnT5uQXwYSmuoMRsfhycw1DBOGY7wvyksohZ0X/5YgOm90sdTNtHxpB6wTQWHB6mTglTFTPMjrvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL/sF7+4ECtAwn90lt6Ck1Wu3zIh3pLNTYaf+zy6fik=;
 b=JJHMGhYnv45hWXVXvbrMHbaPgkQ5f73h6FM2begwSbMl+qdG1SCGT/DxUzNRjggsZoxKfgJFlWZqOAr4P1IuuWAFd7KH99QxSAKIG79nS5004+SMtf9xRkjUMDfhiNZYX5eOkbb1dUBxTn9AAHwPqjxkLLk87a89u4uRzo11nULe8t/8xW1qwiPsDjZ4LZZmnaErProcY8IWLogz3gcoPtuIhz75HK9/jXsGA8sPIOzz/kYnwKPwfW8ALT0oTIAZVruoaKnWcO3A1vx/brSfqfNgSk42rI0Dq4TxRYcn4tafJpIdmucn8zTGbGfBC+77dvL3QRUg29bFGMw9IVq+jw==
Received: from DUZPR01CA0112.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::11) by AS2PR10MB7129.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:60f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 08:07:50 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::4d) by DUZPR01CA0112.outlook.office365.com
 (2603:10a6:10:4bb::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 08:07:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 08:07:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 10:11:42 +0200
Received: from localhost (10.252.30.192) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 10:07:49 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 19 May 2026 10:07:37 +0200
Message-ID: <20260519080737.47928-4-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519080737.47928-1-yann.gautier@foss.st.com>
References: <20260519080737.47928-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.30.192]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|AS2PR10MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: e6827fce-e325-4fa9-18fe-08deb57db834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: pUqNy5A0r7upvoNaOXWEaMxtmVGgYrWmSI7BOcLVvYoMopB808O2L+lNK4Lhop+ywzuhcxEeJxebApEAv/hKqIMAoKzCLT3JWCSWlwlfhZVHhCzZHaDj1+K14Y5ozl6Ft/jC4m/xzZHZeXB++7sVimdMIwyixneKDnfNM3Ttl0J8w8529vtbDBI7e5hhF55x2SQJTUv1pQ/Pw6ZdZrZMJdM9Cr8Utatpk5Jt7ES687k+WeZf9DIfEOn0Cpu2exVDp94uq5KNmeBkXWzonKPQOoKNRQyNButt2f+Cku+Rh7DrPVXfgpV096w7z8xqpfO/H4CIKeLC7H6hPmj46w6mImvtFsAoD2YNZzlTt5dJbNYW5HInhVXMonKMNNF+8S6RmCCqYa7Cn3dsA0uRsp/p1Tyb9bzy8c2IAJEf1X6wkkWSTCHvndmMuVFR8NBYY8WpY0c5LVMyZWNLseNVV6/C9IEhx3WUl/aq2CaLRvJOXr3EBpfTPO3/RBsEE11yOzdejrkzDvbBhTYXQnzDLxGA+n5YgB0Ksok9zebwNq+osKczKU6UWvSouF7huao/b56Odawrv59XTbtyHMKarwi8M+q3YFDP7rWxday2P0Mv3GdX9S0H3HevlwCkhiF2uGGTGmM+7lu4hQIXlUB58iQAGsLZ8hcYsFjRdzl87RZvXAELM+mOFQpAiy4c7GtbGtHeJJwuJSa4UXFgB4vbfw/0SLEOZu1i7er/2HVJd3V1Ejg=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3NXLbOce1/2lqyFH9uTAyrQAD5N7bawlxuJ+z7oyIwH9xFyfezNoDnakyarOQcwLl4rYjoObovuRYY9J41w6yIoG9+B75rU0RTbEYsYgf9ifIJs/vc79IuASCBZ8AOk5ynL0mkCSQ0/cz2R62JBpGuIiIQ7I5rGS4HDzfQgPhU2MoCIq8VXceR8xO/QaE5xoy0MtHFjg6u5tdeNguU19vwI+RFn3LZp4uxgSL/Mv9EFjIVVEf1ByaKwgarjl/Uvvie1DWLUeolKvHmSY7JP+Mvc9xLCuCTQ4A2u0FBg4YQiKo1Iu7LkP+1nBysMWpfjtobMJXak0coa3kYspzeUbytiGWhcOenbNOfEGSJ2CYlowIa4vYIpA6I2Aj/gvtcL/tyuOXuHScCrhq83iuahtr/mgXEkMtw/FJRCg94HBQfFJA9g/9D/oHby61fUpFDL+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:07:49.7968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6827fce-e325-4fa9-18fe-08deb57db834
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7129
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: enable SMC watchdog for
	STM32MP15 SCMI config
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
X-Spamd-Result: default: False [3.89 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:peng.fan@nxp.com,m:christophe.kerello@foss.st.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED061579ACE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For this configuration, the watchdog (iwdg1) is secured and managed by
OP-TEE. Add an watchdog node with arm,smc-wdt compatible, and disable
iwdg2 node which is then no more used.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---

 arch/arm/dts/stm32mp15-scmi-u-boot.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
index 79494ecad90a..600316205fcc 100644
--- a/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
@@ -21,6 +21,13 @@
 		pinctrl1 = &pinctrl_z;
 	};
 
+	arm_wdt: watchdog {
+		compatible = "arm,smc-wdt";
+		arm,smc-id = <0xbc000000>;
+		timeout-sec = <32>;
+		status = "okay";
+	};
+
 	binman: binman {
 		multiple-images;
 	};
@@ -103,7 +110,7 @@
 };
 
 &iwdg2 {
-	bootph-all;
+	status = "disabled";
 };
 
 /* pre-reloc probe = reserve video frame buffer in video_reserve() */
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
