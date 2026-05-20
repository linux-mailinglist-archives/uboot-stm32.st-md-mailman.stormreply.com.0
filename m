Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJiiL0TcDWpb4QUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 18:07:32 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC18159179F
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 18:07:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75FDFC8F264;
	Wed, 20 May 2026 16:07:32 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013010.outbound.protection.outlook.com
 [52.101.83.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EDF0C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 16:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFdZaWl4S3OBpx3TdDZ+OQ9O9DfhduqAB+2N4pRx/+sQKXwyAPvk2lZwXeExttlbsCisT6Q3Gb0Ev9xyjA7LPALdxGqkkuzm6ZAqRpwA7hoEluF8DOahd4I2ZxmZ8sZ0WV1m9Tiqx3Wvhlp+NMhlR+P6vja2Cl3PTac+2nOdsZZUCn04b/j614fz55HW80IhPVsJkossKF1Prs8VTUSObi5lrPaH4sVDLrsVw+O+8k/kyED/APQLlJh0n5wBEszUR25dGVy9WfFvhmsnoyF3iCDSrqmbH5pWixm+9jffEFKmAaBeVXW9FLSt4elHWzgLFXa6idsAuYKOP8FxCaJhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLa4Hqkx5RFoEjhRE6jicTyC5ZxIz1G5cU7rFghlygY=;
 b=FV9MYWku9tpB9qGFPBB70sks27/ewq7Mgbl8M9Cn0XpysY5OHxEtYjbNHdW+kC75ZjlvDYPZxKIf+MsOg+U4T3QEbYDwMPHrxK5BBBlRrbTp+ycGPDyJ/W4B+at0Mb6RLEpW7ouVdosvBlgc7UEZ7N9CQb044bK4Pq1p8IJu6Fdy6TNNVMdWEdEZrsxXLmhEWqdSCaqM2ewwNLq9txC2myexZNAZJoLlskhe/xiMpMp0QQGTZYHT10BBjkD6ErFWYnoKxahXDeogVJluUjQ6/OJOGJaQ16IkrQf9F3DMZe2Ga4AlIjHjqtJ1nf9SncJDV/Qqx/ep393cHl1oXJO5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLa4Hqkx5RFoEjhRE6jicTyC5ZxIz1G5cU7rFghlygY=;
 b=M+ADTOqcNvenUM2ZPC/Bydl+t09kTTaLBhM6MlWiBKUhL28ar/z65t1gscxi//nshvzhterHkJ/XsRVaQ48F9605FPlZ0UiocwUlTvsie35MzNFgQBa6iIEJT49LGmgyrbCLuaEWQv7I/nh29xhykQ58tF6+KDs7UWh9AokrTn0+rH5g9o2Tzx8xFycCjDMCjqglDNXcbjLEmSgtZ3h5kdkHJmpD4AJ03LfjB04QaYqHktQT/KvJlBIDQEim8ufojMRxebSqcjOXDll4owar/AnX696JxIG3iI9FVqZeRqLIVDvkq6lO3MHK92fW10O+2XyFDWm59oDVR54iDYg4YQ==
Received: from DB8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::21)
 by FRZPR10MB9865.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:1c8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:07:27 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::d) by DB8P191CA0011.outlook.office365.com
 (2603:10a6:10:130::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 16:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 16:07:27 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 18:11:20 +0200
Received: from localhost (10.252.1.215) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 18:07:26 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 May 2026 18:07:15 +0200
Message-ID: <20260520160715.175032-4-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520160715.175032-1-yann.gautier@foss.st.com>
References: <20260520160715.175032-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.1.215]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|FRZPR10MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: b268ed91-6211-4b16-e805-08deb689e333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|22082099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 4PMWIqFys5ewlavD9ILYTTvKDEKainBRLKRNWt+AIZKCGAQGyPafp5fVuUz8dIoK8qvsEqbAcFRRQz1MACcuIT2SrG6Q4JSR12vNOtIMpJo8IT+P0Xcacur8f4VDLz/KvseseTtupP2fw3DyWMReufxl8j2/2xseeh48GOy6t6LdNcC8Dr+DjJdnGVUAVrnS9QrEYloR1TtOo43Wit9qG8wim4ZmGP+EKeMClqkpsrK2zywFmIo2HzXUClm8GoxHt9GK4ZVvNxI0xG4bwKSByTyzTyrzUNMSymb/w7i7yyFKVf4jxG8zljwmEuXxUdM917iUD/Vt4eEgLV+60ignIUo6b3Lm0lgTysHFaMy0xLNfPVC7cV8XJKZRLJpMZaOktItMI10UM2OEYYdKOxmI9OUr98mzdpOhXrM5TKp1zY4g9HCX0MPYT4xbVKjIMnNIuJNFaHA9yZCjlRAThNgfk5/xAMq9ibImRqS6jQ761cEWza/yvfVgOZMOZpu3kLBRuaYgiH7Q+EkMLeq/wqjIMC9BKU6w/XA55//Q+AEzqayN3g1b58yEHPptP5OfQmfCn06cdroYgFB9gEigBbVPbjMUJNWDZMcU4KuszguC7A3tEhZw/ROkl1FSO/MoN12sCc8C4g/DSPJ0ZYYe4fcNU4gWR9uB9LEiVwH1fcz0qc+pAg0HZvrfSq+SeH8LyIu9b79ntoi3ol4dysO4Li/+YNy/e64P02BZLlg6811O+Hc=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rhto0/AwDyXNpf+9WmAHj6D1b2Pwtby+fN5wQfL3y0XkS1ljBuE3NPMe/mNMHywT7xvs/l2UWOOu4nO/GdQAE1nrOLoisiOWImH8kT8grixAq5AiygR8qptuhDWHtx5+UuwWpYfF8LuoonUFZGxALHPMm/xhZNBQeCEfkh+k1E+9ejmjRbRQxV3DTDbfnNF1XgE9JknbTeUNWxDMfVgJPsb9IxaYCDsv3m/Fr/d+vxynrfOXfvFzteNPLDHksITB1p0CkXmNeywrdMepjAYi1O6zNmWhAbLc50S7FH95/wWIkUbCND9lrRFzrSnbLHhXOb5xqpXSUdzcs/BvK4oyTKLbDs0WZ6fRU6Nb2P2Ez6ces/QWaHxnsM/f6MdrtUEBsxfXXfZsWmLzEDteai8TwW3FKcDBkenhZ2kwAaIRu2BlYprB9j+TqrbEXo+6Wws/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:07:27.0721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b268ed91-6211-4b16-e805-08deb689e333
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR10MB9865
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 3/3] ARM: dts: stm32: enable SMC watchdog
	for STM32MP15 SCMI config
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:peng.fan@nxp.com,m:christophe.kerello@foss.st.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,foss.st.com:mid,stormreply.com:url,stormreply.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[yann.gautier@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC18159179F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For this configuration, the watchdog (iwdg1) is secured and managed by
OP-TEE. Add an watchdog node with arm,smc-wdt compatible, and disable
iwdg2 node which is then no more used.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

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
